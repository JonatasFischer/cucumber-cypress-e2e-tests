Feature: Product Information Page

  Scenario: Combination without stock should not be selectable (Combination stock : Combi quantity, Check stock level,Check stock before shopping cart?

    Given I'm at the categories page
    When I navigate to the "test category" category
    And I navigate to the product "test article 1"
    And I update the product quantity to "0"
    And I save the product
    And I navigate to the product "test article 1" options
    And I define the combinations settings as
      | Dropdown mode:        | Any order, only possible values are selectable |
      | Quantity check:       | Combi quantity                                 |
    And I define the combination "s-gold" quantity as "0"
    And I have the following parameters configured in the settings page
      | Check stock level                 | checked   |
      | Check attribute stock level       | unchecked |
      | Check stock before shopping cart? | checked   |
      | Allow Checkout                    | unchecked |

    Given I am on the homepage
    Then The product "test article 1" should be visible
    When I clicked in the product "test article 1"
    Then The product info page must be active
    And  The selected product is "test article 1"
    And  There is a modifier called "Size"
    And  There is a option "S" for the modifier "Size"
    And  The option "S" for the modifier "Size" is active
    And  There is a option "M" for the modifier "Size"
    And  The option "M" for the modifier "Size" is active
    And  There is a option "L" for the modifier "Size"
    And  The option "L" for the modifier "Size" is active
    And  There is a modifier called "Color"
    And  The option "Gold" for the modifier "Color" is active
    And  The option "Red" for the modifier "Color" is active
    And  The option "Black" for the modifier "Color" is active
    And  The button add to cart is disabled

    When I selected the option "S" for the modifier "Size"
    Then The option "S" for the modifier "Size" is active
    And  The option "M" for the modifier "Size" is active
    And  The option "L" for the modifier "Size" is active
    And  The option "Gold" for the modifier "Color" is not active
    And  The option "Black" for the modifier "Color" is active
    And  The option "Red" for the modifier "Color" is active
    And  The button add to cart is disabled
    And  The error message "This product ist not available." is not visible


  Scenario: Combination without stock should not be selectable (Combination stock : Global Configuration, Stock Check, Check attribute stock level)

    Given I'm at the categories page
    When I navigate to the "test category" category
    And I navigate to the product "test article 1"
    And I update the product quantity to "0"
    And I save the product
    And I navigate to the product "test article 1" options
    And I define the combinations settings as
      | Dropdown mode:        | Any order, only possible values are selectable |
      | Quantity check:       | Default (global stock options)                 |
    And I define the combination "s-gold" quantity as "0"
    And I have the following parameters configured in the settings page
      | Check stock level                 | checked   |
      | Check attribute stock level       | checked   |
      | Check stock before shopping cart? | checked   |
      | Allow Checkout                    | unchecked |

    Given I am on the homepage
    Then The product "test article 1" should be visible
    When I clicked in the product "test article 1"
    Then The product info page must be active
    And The selected product is "test article 1"
    And There is a modifier called "Size"
    And There is a option "S" for the modifier "Size"
    And The option "S" for the modifier "Size" is active
    And The option "Gold" for the modifier "Color" is active
    When I selected the option "S" for the modifier "Size"
    Then The option "Gold" for the modifier "Color" is not active
    And The option "Black" for the modifier "Color" is active

  Scenario: Combination without stock should not be selectable (Combination stock : Products quantity)

    Given I'm at the categories page
    When I navigate to the "test category" category
    And I navigate to the product "test article 1" options
    And I define the combinations settings as
      | Dropdown mode:        | Any order, only possible values are selectable |
      | Quantity check:       | Products quantity                              |
    And I define the combination "s-gold" quantity as "100"
    And I have the following parameters configured in the settings page
      | Check stock level                 | checked   |
      | Check attribute stock level       | checked   |
      | Check stock before shopping cart? | checked   |
      | Allow Checkout                    | unchecked |

    Given I am on the homepage
    Then The product "test article 1" should be visible
    When I clicked in the product "test article 1"
    Then The product info page must be active
    And The selected product is "test article 1"
    And There is no modifier called "Size"
    And There is no modifier called "Color"




