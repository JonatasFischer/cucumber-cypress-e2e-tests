Feature: Product Info Stock Validations (no stock validations or messages)
  Stock validations should not be triggered with the configuration specified in the background:

  Background:
    Given I am logged in the backend admin
    And   I have the following parameters configured in the settings page
      | Check stock level                 | unchecked |
      | Check stock before shopping cart? | unchecked |
      | Allow Checkout                    | unchecked |
    Given I'm at the categories page
    When I delete any product with the name as "English Description"
    Then There is 0 product(s) named as "English Description"


  Scenario: Selling without available quantity should be possible
    Given I'm at the categories page
    When  I click in the create product button
    Then I am redirected to the new product page
    And I expand all the boxes

    When I check the field "Show on start page" at the panel "Product master data"
    And I define the product quantity as "0"
    And I define the product price as "9.99"
    And I fill the product name for the language "de" with "German Description"
    And I fill the product name for the language "en" with "English Description"
    And I save the product
    Then I'm at the categories page

    Given I am on the homepage
    Then The product "English Description" should be visible

    When I clicked in the product "English Description"
    Then The product info page must be active to the product "English Description"
    And  The selected product is "English Description"
    And  There is no modifier  in the page
    And  The product price is "9,99 EUR"
    And  The button add to cart is enabled
    And  The error message "This product is not available." does not exist
    And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." does not exist

  Scenario: Selling available quantity should be possible

    Given I'm at the categories page
    And  I click in the create product button
    Then I am redirected to the new product page
    Then I expand all the boxes

    When I check the field "Show on start page" at the panel "Product master data"
    And I define the product quantity as "10"
    And I define the product price as "9.99"
    And I fill the product name for the language "de" with "German Description"
    And I fill the product name for the language "en" with "English Description"
    And I save the product
    Then I'm at the categories page

    Given I am on the homepage
    Then The product "English Description" should be visible

    When I clicked in the product "English Description"
    Then The product info page must be active to the product "English Description"
    And  The selected product is "English Description"
    And  There is no modifier  in the page
    And  The product price is "9,99 EUR"
    And  The button add to cart is enabled
    And  The error message "This product ist not available." does not exist
    And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." does not exist

    When I set the quantity "9"
    And  The error message "This product ist not available." does not exist
    And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." does not exist
    And  The button add to cart is enabled

  Scenario: Selling more than the available quantity should be possible

    Given I'm at the categories page
    And  I click in the create product button
    Then I am redirected to the new product page
    Then I expand all the boxes

    When I check the field "Show on start page" at the panel "Product master data"
    And I define the product quantity as "10"
    And I define the product price as "9.99"
    And I fill the product name for the language "de" with "German Description"
    And I fill the product name for the language "en" with "English Description"
    And I save the product
    Then I'm at the categories page

    Given I am on the homepage
    Then The product "English Description" should be visible
    When I clicked in the product "English Description"
    Then The product info page must be active to the product "English Description"
    And  The selected product is "English Description"
    And  There is no modifier  in the page
    And  The product price is "9,99 EUR"
    And  The button add to cart is enabled
    And  The error message "This product ist not available." does not exist
    And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." does not exist
    When I set the quantity "20"
    And  The error message "This product ist not available." does not exist
    And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." does not exist
    And  The button add to cart is enabled

