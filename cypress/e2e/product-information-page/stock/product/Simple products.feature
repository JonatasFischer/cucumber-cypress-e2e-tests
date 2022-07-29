Feature: Product Info Stock Validations
  Stock validations should not be triggered when with the configuration specified in the background:

  Scenario: This is a setup scenario ans should be replaced with a tag and a initialization control (status)
    Given I am logged in the backend admin
    And I'm at the categories page
    When I delete any product with the name as "Without Stock"
    Then There is 0 product(s) named as "Without Stock"

    When I delete any product with the name as "With Stock of 10"
    Then There is 0 product(s) named as "With Stock of 10"

    When  I click in the create product button
    Then I am redirected to the new product page

    When I expand all the boxes
    And I check the field "Show on start page" at the panel "Product master data"
    And I define the product quantity as "0"
    And I define the product price as "9.99"
    And I fill the product name for the language "de" with "Without Stock"
    And I fill the product name for the language "en" with "Without Stock"
    And I save the product
    Then I'm at the categories page
    Then There is 1 product(s) named as "Without Stock"

    When  I click in the create product button
    Then I am redirected to the new product page

    When I expand all the boxes
    And I check the field "Show on start page" at the panel "Product master data"
    And I define the product quantity as "10"
    And I define the product price as "9.99"
    And I fill the product name for the language "de" with "With Stock of 10"
    And I fill the product name for the language "en" with "With Stock of 10"
    And I save the product
    Then I'm at the categories page
    And There is 1 product(s) named as "With Stock of 10"

    Given I am on the homepage
    Then The product "Without Stock" should be visible
    Then The product "With Stock of 10" should be visible




  Rule: The stock validations at the product information page will be executed based in tree configurations
    Background:
      Given I am logged in the backend admin

    Scenario Outline: <SCENARIO_TITLE>

      Given   I have the following parameters configured in the settings page
        | Check stock level                 | <CSL>   |
        | Check stock before shopping cart? | <CSBSC> |
        | Allow Checkout                    | <AC>    |

      Given I am on the homepage
      Then The product "<PRODUCT>" should be visible

      When I clicked in the product "<PRODUCT>"
      Then The product info page must be active to the product "<PRODUCT>"
      And  The selected product is "<PRODUCT>"
      And  There is no modifier  in the page
      And  The product price is "9,99 EUR"
      And  The button add to cart is <ADD_TO_CART_1>
      And  The error message "This product ist not available in this quantity..." <PRODUCT_QUANTITY_UNAVAILABLE_1> exists
      And  The error message "This product ist not available." <PRODUCT_UNAVAILABLE_1> exists
      And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." <PRODUCT_WILL_BE_SUPPLIED_1> exists

      When I set the quantity to <QUANTITY>
      And  The button add to cart is <ADD_TO_CART_2>

      And  The error message "This product ist not available in this quantity..." <PRODUCT_QUANTITY_UNAVAILABLE_2> exists
      And  The error message "This product ist not available." <PRODUCT_UNAVAILABLE_2> exists
      And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." <PRODUCT_WILL_BE_SUPPLIED_2> exists

      Examples:
        | CSL       | CSBSC     | AC        | PRODUCT          | QUANTITY | PRODUCT_QUANTITY_UNAVAILABLE_1 | PRODUCT_QUANTITY_UNAVAILABLE_2 | PRODUCT_UNAVAILABLE_1 | PRODUCT_UNAVAILABLE_2 | ADD_TO_CART_1 | ADD_TO_CART_2 | PRODUCT_WILL_BE_SUPPLIED_1 | PRODUCT_WILL_BE_SUPPLIED_2 | SCENARIO_TITLE                                                                                                                                                                                                                                         |
        | unchecked | unchecked | unchecked | Without Stock    | 1        | doesn't                        | doesn't                        | doesn't               | doesn't               | enabled       | enabled       | doesn't                    | doesn't                    | Products without stock shouldn't present any error message when the "Check stock Level" is disabled                                                                                                                                                    |
        | unchecked | unchecked | unchecked | With Stock of 10 | 10       | doesn't                        | doesn't                        | doesn't               | doesn't               | enabled       | enabled       | doesn't                    | doesn't                    | Products with stock shouldn't present any error message when the "Check stock Level" is disabled                                                                                                                                                       |
        | unchecked | unchecked | unchecked | With Stock of 10 | 20       | doesn't                        | doesn't                        | doesn't               | doesn't               | enabled       | enabled       | doesn't                    | doesn't                    | Products with stock shouldn't present any error message when the "Check stock Level" is disabled and the ordered quantity is higher than the amount in stock                                                                                           |

        | unchecked | unchecked | checked   | Without Stock    | 1        | doesn't                        | doesn't                        | doesn't               | doesn't               | enabled       | enabled       | doesn't                    | doesn't                    | Products without stock shouldn't present any error message when the "Check stock Level" is unchecked even if "Allow Checkout" is checked                                                                                                               |
        | unchecked | unchecked | checked   | With Stock of 10 | 10       | doesn't                        | doesn't                        | doesn't               | doesn't               | enabled       | enabled       | doesn't                    | doesn't                    | Products with stock shouldn't present any error message when the "Check stock Level" is unchecked even if "Allow Checkout" is checked                                                                                                                  |
        | unchecked | unchecked | checked   | With Stock of 10 | 20       | doesn't                        | doesn't                        | doesn't               | doesn't               | enabled       | enabled       | doesn't                    | doesn't                    | Products with stock shouldn't present any error message when the "Check stock Level" is unchecked even if "Allow Checkout" is checked and the ordered quantity is higher than the amount in stock                                                      |

        | unchecked | checked   | unchecked | Without Stock    | 1        | doesn't                        | doesn't                        | doesn't               | doesn't               | enabled       | enabled       | doesn't                    | doesn't                    | Products without stock shouldn't present any error message when the "Check stock Level" is unchecked even if "Check stock before shopping cart" is checked                                                                                             |
        | unchecked | checked   | unchecked | With Stock of 10 | 10       | doesn't                        | doesn't                        | doesn't               | doesn't               | enabled       | enabled       | doesn't                    | doesn't                    | Products with stock shouldn't present any error message when the "Check stock Level" is unchecked even if "Check stock before shopping cart" is checked                                                                                                |
        | unchecked | checked   | unchecked | With Stock of 10 | 20       | doesn't                        | doesn't                        | doesn't               | doesn't               | enabled       | enabled       | doesn't                    | doesn't                    | Products with stock shouldn't present any error message when the "Check stock Level" is unchecked even if "Check stock before shopping cart" is checked and the ordered quantity is higher than the amount in stock                                    |

        | unchecked | checked   | checked   | Without Stock    | 1        | doesn't                        | doesn't                        | doesn't               | doesn't               | enabled       | enabled       | doesn't                    | doesn't                    | Products without stock shouldn't present any error message when the "Check stock Level" is unchecked even if "Allow Checkout" and  "Check stock before shopping cart" are checked                                                                      |
        | unchecked | checked   | checked   | With Stock of 10 | 10       | doesn't                        | doesn't                        | doesn't               | doesn't               | enabled       | enabled       | doesn't                    | doesn't                    | Products with stock shouldn't present any error message when the "Check stock Level" is unchecked even if "Allow Checkout" and  "Check stock before shopping cart" are checked                                                                         |
        | unchecked | checked   | checked   | With Stock of 10 | 20       | doesn't                        | doesn't                        | doesn't               | doesn't               | enabled       | enabled       | doesn't                    | doesn't                    | Products with stock shouldn't present any error message when the "Check stock Level" is unchecked even if "Allow Checkout" and  "Check stock before shopping cart" are checked and the ordered quantity is higher than the amount in stock             |

        | checked   | unchecked | unchecked | Without Stock    | 1        | doesn't                        | doesn't                        | doesn't               | doesn't               | enabled       | enabled       | doesn't                    | doesn't                    | Products without stock shouldn't present any error message when the "Check stock Level" is checked and "Checking stock before shopping cart" is unchecked                                                                                              |
        | checked   | unchecked | unchecked | With Stock of 10 | 10       | doesn't                        | doesn't                        | doesn't               | doesn't               | enabled       | enabled       | doesn't                    | doesn't                    | Products with stock shouldn't present any error message when the "Check stock Level" is checked and "Checking stock before shopping cart" is unchecked                                                                                                 |
        | checked   | unchecked | unchecked | With Stock of 10 | 20       | doesn't                        | doesn't                        | doesn't               | doesn't               | enabled       | enabled       | doesn't                    | doesn't                    | Products with stock shouldn't present any error message when the "Check stock Level" is checked and "Checking stock before shopping cart" is unchecked and the ordered quantity is higher than the amount in stock                                     |

        | checked   | unchecked | checked   | Without Stock    | 1        | doesn't                        | doesn't                        | doesn't               | doesn't               | enabled       | enabled       | doesn't                    | doesn't                    | Products without stock shouldn't present any error message when the "Check stock Level" is checked and "Checking stock before shopping cart" is unchecked even if "Allow Checkout" is checked                                                          |
        | checked   | unchecked | checked   | With Stock of 10 | 10       | doesn't                        | doesn't                        | doesn't               | doesn't               | enabled       | enabled       | doesn't                    | doesn't                    | Products with stock shouldn't present any error message when the "Check stock Level" is checked and "Checking stock before shopping cart" is unchecked even if "Allow Checkout" is checked                                                             |
        | checked   | unchecked | checked   | With Stock of 10 | 20       | doesn't                        | doesn't                        | doesn't               | doesn't               | enabled       | enabled       | doesn't                    | doesn't                    | Products with stock shouldn't present any error message when the "Check stock Level" is checked and "Checking stock before shopping cart" is unchecked even if "Allow Checkout" is checked and the ordered quantity is higher than the amount in stock |

        | checked   | checked   | unchecked | Without Stock    | 1        | doesn't                        | doesn't                        | does                  | does                  | disabled      | disabled      | doesn't                    | doesn't                    | Products without stock should present an error message when the "Check stock Level" and "Check stock before shopping cart" are checked and "Allow checkout" is unchecked                                                                               |
        | checked   | checked   | unchecked | With Stock of 10 | 10       | doesn't                        | doesn't                        | doesn't               | doesn't               | enabled       | enabled       | doesn't                    | doesn't                    | Products with stock shouldn't present any error message when the "Check stock Level" and "Check stock before shopping cart" are checked and "Allow checkout" is unchecked                                                                              |
        | checked   | checked   | unchecked | With Stock of 10 | 20       | doesn't                        | does                           | doesn't               | doesn't               | enabled       | disabled      | doesn't                    | doesn't                    | Products with stock should present any error message when the "Check stock Level" and "Check stock before shopping cart" are checked and "Allow checkout" is unchecked and the ordered quantity is higher than the amount in stock                     |

        | checked   | checked   | checked   | Without Stock    | 1        | doesn't                        | doesn't                        | doesn't               | doesn't               | enabled       | enabled       | does                       | does                       | Products without stock should present an alert message when the "Check stock Level" and "Check stock before shopping cart" are checked and "Allow checkout" is unchecked                                                                               |
        | checked   | checked   | checked   | With Stock of 10 | 10       | doesn't                        | doesn't                        | doesn't               | doesn't               | enabled       | enabled       | doesn't                    | doesn't                    | Products with stock shouldn't present any error message when the "Check stock Level" is unchecked even if "Allow Checkout" and  "Check stock before shopping cart" are checked                                                                         |
        | checked   | checked   | checked   | With Stock of 10 | 20       | doesn't                        | doesn't                        | doesn't               | doesn't               | enabled       | enabled       | doesn't                    | does                       | Products with stock should present a alert message when the "Check stock Level", "Allow Checkout" and  "Check stock before shopping cart" are checked when the ordered quantity is higher than the amount in stock                                     |