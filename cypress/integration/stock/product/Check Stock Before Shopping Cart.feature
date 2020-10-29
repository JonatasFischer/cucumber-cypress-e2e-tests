Feature: Check Product Stock Before the Shopping Cart

  Scenario: A product with stock can be purchased?

    Given I'm at the categories page
    When I delete any product with the name as "English Description"
    When  I click in the create product button
    Then I am redirected to the new product page

    When I check the field "Show on start page"
    And I update the product quantity to "10"
    And I fill the product name for the language "de" with "German Description"
    And I fill the product name for the language "en" with "English Description"
    And I save the product

