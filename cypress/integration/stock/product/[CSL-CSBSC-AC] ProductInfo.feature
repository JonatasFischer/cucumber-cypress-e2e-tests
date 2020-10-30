Feature: Check Stock Level, Check Stock Before Shopping Cart, Allow Checkout - Product Info Stock Validations

  Scenario: The shop can sell an available quantity without warnings

    Given I have the following parameters configured in the settings page
      | Check stock level                 | checked   |
      | Check stock before shopping cart? | checked   |
      | Allow Checkout                    | checked   |
    And I'm at the categories page
    When I delete any product with the name as "English Description"
    And  I click in the create product button
    Then I am redirected to the new product page

    When I check the field "Show on start page"
    And I define the product quantity as "10"
    And I define the product price as "9.99"
    And I fill the product name for the language "de" with "German Description"
    And I fill the product name for the language "en" with "English Description"
    And I save the product
    Then I'm at the categories page

    Given I am on the homepage
    Then The product "English Description" should be visible
    When I clicked in the product "English Description"
    Then The product info page must be active
    And  The selected product is "English Description"
    And  There is no modifier  in the page
    And  The product price is "9,99 EUR"
    And  The button add to cart is enabled
    And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." is not visible
    When I set the quantity "9"
    And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." is not visible
    And  The button add to cart is enabled

  Scenario: The shop can sell without stock with warnings

    Given I have the following parameters configured in the settings page
      | Check stock level                 | checked   |
      | Check stock before shopping cart? | checked   |
      | Allow Checkout                    | checked   |
    And I'm at the categories page
    When I delete any product with the name as "English Description"
    And  I click in the create product button
    Then I am redirected to the new product page

    When I check the field "Show on start page"
    And I define the product quantity as "0"
    And I define the product price as "9.99"
    And I fill the product name for the language "de" with "German Description"
    And I fill the product name for the language "en" with "English Description"
    And I save the product
    Then I'm at the categories page

    Given I am on the homepage
    Then The product "English Description" should be visible
    When I clicked in the product "English Description"
    Then The product info page must be active
    And  The selected product is "English Description"
    And  There is no modifier  in the page
    And  The product price is "9,99 EUR"
    And  The button add to cart is enabled
    And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." is visible

  Scenario: The shop can sell more than the quantity available with warnings

    Given I have the following parameters configured in the settings page
      | Check stock level                 | checked   |
      | Check stock before shopping cart? | checked   |
      | Allow Checkout                    | checked   |
    And I'm at the categories page
    When I delete any product with the name as "English Description"
    And  I click in the create product button
    Then I am redirected to the new product page

    When I check the field "Show on start page"
    And I define the product quantity as "10"
    And I define the product price as "9.99"
    And I fill the product name for the language "de" with "German Description"
    And I fill the product name for the language "en" with "English Description"
    And I save the product
    Then I'm at the categories page

    Given I am on the homepage
    Then The product "English Description" should be visible
    When I clicked in the product "English Description"
    Then The product info page must be active
    And  The selected product is "English Description"
    And  There is no modifier  in the page
    And  The product price is "9,99 EUR"
    And  The button add to cart is enabled
    And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." is not visible
    When I set the quantity "20"
    And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." is visible
    And  The button add to cart is enabled

