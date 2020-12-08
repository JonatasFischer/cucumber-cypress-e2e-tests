Feature: Product Information Page
  
  
  Background:
	Given I am logged in the admin
  
  
  Scenario: Combination without stock should not be selectable when Combination stock : Combi quantity, Check stock level,Check stock before shopping cart?

	#updating the product quantity
	Given I'm at the categories page
	When I navigate to the "test category" category
	And I navigate to the product "test article 1"
	And I define the product quantity as "0"
	And I save the product
	#updating product combination configuration
	And I navigate to the product "test article 1" options
	And I define the combinations settings as
	  | Dropdown mode:  | Any order, only possible values are selectable |
	  | Quantity check: | Combi quantity                                 |
	And I define the combination "s-gold" quantity as "0"
	#updating shopping stock settings
	And I have the following parameters configured in the settings page
	  | Check stock level                 | checked   |
	  | Check attribute stock level       | unchecked |
	  | Check stock before shopping cart? | checked   |
	  | Allow Checkout                    | unchecked |

   #start test main routine
	Given I am on the homepage
	Then The product "test article 1" should be visible
	When I clicked in the product "test article 1"
	Then The product info page must be active
	And  The selected product is "test article 1"
	And  There is a modifier called "Size"
	And  There is an option "S" for the modifier "Size"
	And  The option "S" for the modifier "Size" is active
	And  There is an option "M" for the modifier "Size"
	And  The option "M" for the modifier "Size" is active
	And  There is an option "L" for the modifier "Size"
	And  The option "L" for the modifier "Size" is active
	And  There is a modifier called "Color"
	And  The option "Gold" for the modifier "Color" is active
	And  The option "Red" for the modifier "Color" is active
	And  The option "Black" for the modifier "Color" is active
	And  The button add to cart is disabled
	And  The product price is "From only 14,62 EUR"
	And  The error message "This product ist not available." is not visible
	And  The error message "This combination does not exist..." is not visible
	And  The error message "This combination ist not available in this quantity..." is not visible
	And  The error message "This combination is not in stock.<br />The quantity entered will be supplied by us very soon." is not visible

    #Select another combination
	When I selected the option "S" for the modifier "Size"
	And  I selected the option "Black" for the modifier "Color"
	Then The option "S" for the modifier "Size" is active
	And  The option "M" for the modifier "Size" is active
	And  The option "L" for the modifier "Size" is active
	And  The option "Gold" for the modifier "Color" is not active
	And  The option "Black" for the modifier "Color" is active
	And  The option "Red" for the modifier "Color" is active
	And  The button add to cart is enabled
	And  The product price is "Only 16,57 EUR"
	And  The error message "This product ist not available." is not visible
	And  The error message "This combination does not exist..." is not visible
	And  The error message "This combination ist not available in this quantity..." is not visible
	And  The error message "This combination is not in stock.<br />The quantity entered will be supplied by us very soon." is not visible

  Scenario: Combination without stock should not be selectable when Combination stock : Global Configuration, Stock Check, Check attribute stock level, Check stock before shopping cart?

	#updating the product quantity
	Given I'm at the categories page
	When I navigate to the "test category" category
	And I navigate to the product "test article 1"
	And I define the product quantity as "0"
	And I save the product
	#updating product combination configuration
	And I navigate to the product "test article 1" options
	And I define the combinations settings as
	  | Dropdown mode:  | Any order, only possible values are selectable |
	  | Quantity check: | Default (global stock options)                 |

	And I define the combination "s-gold" quantity as "0"
	#updating shopping stock settings
	And I have the following parameters configured in the settings page
	  | Check stock level                 | checked   |
	  | Check attribute stock level       | checked   |
	  | Check stock before shopping cart? | checked   |
	  | Allow Checkout                    | unchecked |

   #start test main routine
	Given I am on the homepage
	Then The product "test article 1" should be visible
	When I clicked in the product "test article 1"
	Then The product info page must be active
	And  The selected product is "test article 1"
	And  There is a modifier called "Size"
	And  There is an option "S" for the modifier "Size"
	And  The option "S" for the modifier "Size" is active
	And  There is an option "M" for the modifier "Size"
	And  The option "M" for the modifier "Size" is active
	And  There is an option "L" for the modifier "Size"
	And  The option "L" for the modifier "Size" is active
	And  There is a modifier called "Color"
	And  The option "Gold" for the modifier "Color" is active
	And  The option "Red" for the modifier "Color" is active
	And  The option "Black" for the modifier "Color" is active
	And  The button add to cart is disabled
	And  The product price is "From only 14,62 EUR"
	And  The error message "This product ist not available." is not visible
	And  The error message "This combination does not exist..." is not visible
	And  The error message "This combination ist not available in this quantity..." is not visible
	And  The error message "This combination is not in stock.<br />The quantity entered will be supplied by us very soon." is not visible

    #Select another combination
	When I selected the option "S" for the modifier "Size"
	And  I selected the option "Black" for the modifier "Color"
	Then The option "S" for the modifier "Size" is active
	And  The option "M" for the modifier "Size" is active
	And  The option "L" for the modifier "Size" is active
	And  The option "Gold" for the modifier "Color" is not active
	And  The option "Black" for the modifier "Color" is active
	And  The option "Red" for the modifier "Color" is active
	And  The button add to cart is enabled
	And  The product price is "Only 16,57 EUR"
	And  The error message "This product ist not available." is not visible
	And  The error message "This combination does not exist..." is not visible
	And  The error message "This combination ist not available in this quantity..." is not visible
	And  The error message "This combination is not in stock.<br />The quantity entered will be supplied by us very soon." is not visible
  
  Scenario: Combination without stock should not be visible when the product quantity is used and the product has no quantity (Combination stock : Products quantity, Stock Check, Check stock before shopping cart?)

	#updating the product quantity
	Given I'm at the categories page
	When I navigate to the "test category" category
	And I navigate to the product "test article 1"
	And I define the product quantity as "0"
	And I save the product
	#updating product combination configuration
	And I navigate to the product "test article 1" options
	And I define the combinations settings as
	  | Dropdown mode:  | Any order, only possible values are selectable |
	  | Quantity check: | Products quantity                              |
	#updating shopping stock settings
	And I have the following parameters configured in the settings page
	  | Check stock level                 | checked   |
	  | Check attribute stock level       | unchecked |
	  | Check stock before shopping cart? | checked   |
	  | Allow Checkout                    | unchecked |

   #start test main routine
	Given I am on the homepage
	Then The product "test article 1" should be visible
	When I clicked in the product "test article 1"
	Then The product info page must be active
	And  The selected product is "test article 1"
	#Size Options
	And  There is no modifier called "Size"
	And  There is no modifier called "Color"
  
  Scenario: Combination without stock should show error message (Combination stock : Global Configuration, Stock Check, Check attribute stock level, Check stock before shopping cart?, Allow Checkout)

	#updating the product quantity
	Given I'm at the categories page
	When I navigate to the "test category" category
	And I navigate to the product "test article 1"
	And I define the product quantity as "0"
	And I save the product
	#updating product combination configuration
	And I navigate to the product "test article 1" options
	And I define the combinations settings as
	  | Dropdown mode:  | Default, all values are always selectable |
	  | Quantity check: | Default (global stock options)            |
	
	And I define the combination "s-gold" quantity as "0"
	#updating shopping stock settings
	And I have the following parameters configured in the settings page
	  | Check stock level                 | checked |
	  | Check attribute stock level       | checked |
	  | Check stock before shopping cart? | checked |
	  | Allow Checkout                    | checked |

   #start test main routine
	Given I am on the homepage
	Then The product "test article 1" should be visible
	When I clicked in the product "test article 1"
	Then The product info page must be active
	And  The selected product is "test article 1"
	And  There is a modifier called "Size"
	And  There is an option "S" for the modifier "Size"
	And  The option "S" for the modifier "Size" is active
	And  There is an option "M" for the modifier "Size"
	And  The option "M" for the modifier "Size" is active
	And  There is an option "L" for the modifier "Size"
	And  The option "L" for the modifier "Size" is active
	And  There is a modifier called "Color"
	And  The option "Gold" for the modifier "Color" is active
	And  The option "Red" for the modifier "Color" is active
	And  The option "Black" for the modifier "Color" is active
	And  The button add to cart is disabled
	And  The product price is "From only 14,62 EUR"
	And  The error message "This product ist not available." is not visible
	And  The error message "This combination does not exist..." is not visible
	And  The error message "This combination ist not available in this quantity..." is not visible
	And  The error message "This combination is not in stock." is not visible
	And  The error message "The quantity entered will be supplied by us very soon." is not visible

    #Select the first option
	When I selected the option "S" for the modifier "Size"
	And  The option "Gold" for the modifier "Color" is active
	And  The option "Black" for the modifier "Color" is active
	And  The option "Red" for the modifier "Color" is active
	#select the second option
	And  I selected the option "Gold" for the modifier "Color"
	Then The option "S" for the modifier "Size" is active
	And  The option "M" for the modifier "Size" is active
	And  The option "L" for the modifier "Size" is active
	And  The option "Gold" for the modifier "Color" is active
	And  The option "Black" for the modifier "Color" is active
	And  The option "Red" for the modifier "Color" is active
	And  The button add to cart is enabled
	And  The product price is "Only 14,62 EUR"
	And  The error message "This product ist not available." is not visible
	And  The error message "This combination does not exist..." is not visible
	And  The error message "This combination ist not available in this quantity..." is not visible
	And  The error message "The quantity entered will be supplied by us very soon." is visible
	And  The error message "This combination is not in stock." is visible
  
  
  Scenario: Combination without stock should not show error message  when stock check is disabled

	#updating the product quantity
	Given I'm at the categories page
	When I navigate to the "test category" category
	And I navigate to the product "test article 1"
	And I define the product quantity as "0"
	And I save the product
	#updating product combination configuration
	And I navigate to the product "test article 1" options
	And I define the combinations settings as
	  | Dropdown mode:  | Default, all values are always selectable |
	  | Quantity check: | Default (global stock options)            |
	
	And I define the combination "s-gold" quantity as "0"
	#updating shopping stock settings
	And I have the following parameters configured in the settings page
	  | Check stock level                 | unchecked |
	  | Check attribute stock level       | checked   |
	  | Check stock before shopping cart? | checked   |
	  | Allow Checkout                    | checked   |

   #start test main routine
	Given I am on the homepage
	Then The product "test article 1" should be visible
	When I clicked in the product "test article 1"
	Then The product info page must be active
	And  The selected product is "test article 1"
	And  There is a modifier called "Size"
	And  There is an option "S" for the modifier "Size"
	And  The option "S" for the modifier "Size" is active
	And  There is an option "M" for the modifier "Size"
	And  The option "M" for the modifier "Size" is active
	And  There is an option "L" for the modifier "Size"
	And  The option "L" for the modifier "Size" is active
	And  There is a modifier called "Color"
	And  The option "Gold" for the modifier "Color" is active
	And  The option "Red" for the modifier "Color" is active
	And  The option "Black" for the modifier "Color" is active
	And  The button add to cart is disabled
	And  The product price is "From only 14,62 EUR"
	And  The error message "This product ist not available." is not visible
	And  The error message "This combination does not exist..." is not visible
	And  The error message "This combination ist not available in this quantity..." is not visible
	And  The error message "This combination is not in stock.<br />The quantity entered will be supplied by us very soon." is not visible

    #Select the first option
	When I selected the option "S" for the modifier "Size"
	And  The option "Gold" for the modifier "Color" is active
	And  The option "Black" for the modifier "Color" is active
	And  The option "Red" for the modifier "Color" is active
	#select the second option
	And  I selected the option "Gold" for the modifier "Color"
	Then The option "S" for the modifier "Size" is active
	And  The option "M" for the modifier "Size" is active
	And  The option "L" for the modifier "Size" is active
	And  The option "Gold" for the modifier "Color" is active
	And  The option "Black" for the modifier "Color" is active
	And  The option "Red" for the modifier "Color" is active
	And  The button add to cart is enabled
	And  The product price is "Only 14,62 EUR"
	And  The error message "This product ist not available." is not visible
	And  The error message "This combination does not exist..." is not visible
	And  The error message "This combination ist not available in this quantity..." is not visible
	And  The error message "The quantity entered will be supplied by us very soon." is not visible
	And  The error message "This combination is not in stock." is not visible
  
  Scenario: Combination without stock should not show error message  when stock check before shopping cart is disabled

	#updating the product quantity
	Given I'm at the categories page
	When I navigate to the "test category" category
	And I navigate to the product "test article 1"
	And I define the product quantity as "0"
	And I save the product
	#updating product combination configuration
	And I navigate to the product "test article 1" options
	And I define the combinations settings as
	  | Dropdown mode:  | Default, all values are always selectable |
	  | Quantity check: | Default (global stock options)            |
	
	And I define the combination "s-gold" quantity as "0"
	#updating shopping stock settings
	And I have the following parameters configured in the settings page
	  | Check stock level                 | checked   |
	  | Check attribute stock level       | checked   |
	  | Check stock before shopping cart? | unchecked |
	  | Allow Checkout                    | checked   |

   #start test main routine
	Given I am on the homepage
	Then The product "test article 1" should be visible
	When I clicked in the product "test article 1"
	Then The product info page must be active
	And  The selected product is "test article 1"
	And  There is a modifier called "Size"
	And  There is an option "S" for the modifier "Size"
	And  The option "S" for the modifier "Size" is active
	And  There is an option "M" for the modifier "Size"
	And  The option "M" for the modifier "Size" is active
	And  There is an option "L" for the modifier "Size"
	And  The option "L" for the modifier "Size" is active
	And  There is a modifier called "Color"
	And  The option "Gold" for the modifier "Color" is active
	And  The option "Red" for the modifier "Color" is active
	And  The option "Black" for the modifier "Color" is active
	And  The button add to cart is disabled
	And  The product price is "From only 14,62 EUR"
	And  The error message "This product ist not available." is not visible
	And  The error message "This combination does not exist..." is not visible
	And  The error message "This combination ist not available in this quantity..." is not visible
	And  The error message "This combination is not in stock.<br />The quantity entered will be supplied by us very soon." is not visible

    #Select the first option
	When I selected the option "S" for the modifier "Size"
	And  The option "Gold" for the modifier "Color" is active
	And  The option "Black" for the modifier "Color" is active
	And  The option "Red" for the modifier "Color" is active
	#select the second option
	And  I selected the option "Gold" for the modifier "Color"
	Then The option "S" for the modifier "Size" is active
	And  The option "M" for the modifier "Size" is active
	And  The option "L" for the modifier "Size" is active
	And  The option "Gold" for the modifier "Color" is active
	And  The option "Black" for the modifier "Color" is active
	And  The option "Red" for the modifier "Color" is active
	And  The button add to cart is enabled
	And  The product price is "Only 14,62 EUR"
	And  The error message "This product ist not available." is not visible
	And  The error message "This combination does not exist..." is not visible
	And  The error message "This combination ist not available in this quantity..." is not visible
	And  The error message "The quantity entered will be supplied by us very soon." is not visible
	And  The error message "This combination is not in stock." is not visible
