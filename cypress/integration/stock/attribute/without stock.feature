Feature: Check Product information page and shopping cart for products without stock
  
  Background:
	Given I am logged in the admin
	And The shopping cart is empty
  
  Scenario: [P0000][A010] Check Stock: FALSE | Check Stock Before Shopping Cart : FALSE | Allow Checkout: FALSE | Check attribute stock level: TRUE | Deactivate Attributes: FALSE
	Given I have the following parameters configured in the settings page
	  | Check stock level                 | unchecked |
	  | Check stock before shopping cart? | unchecked |
	  | Allow Checkout                    | unchecked |
	  | Check attribute stock level       | checked   |
	  | Deactivate Attributes             | unchecked |
	And I am on the homepage
	Then The product "Product without Stock" should be visible
	When I clicked in the product "Product without Stock"
	Then The product info page must be active
	And  The selected product is "Product without Stock"
	And There is no error message visible
	And The button add to cart is enabled
	
	When I set the quantity "2"
	Then There is no error message visible
	
	When I click in the add to cart button
	And The shopping cart is presented
	Then There is no error message in the shopping cart
  
  
  Scenario: [P0001][A010] Check Stock: FALSE | Check Stock Before Shopping Cart : FALSE | Allow Checkout: TRUE | Check attribute stock level: TRUE | Deactivate Attributes: FALSE
	Given I have the following parameters configured in the settings page
	  | Check stock level                 | unchecked |
	  | Check stock before shopping cart? | unchecked |
	  | Allow Checkout                    | checked   |
	  | Check attribute stock level       | checked   |
	  | Deactivate Attributes             | unchecked |
	And I am on the homepage
	Then The product "Product without Stock" should be visible
	When I clicked in the product "Product without Stock"
	Then The product info page must be active
	And  The selected product is "Product without Stock"
	And There is no error message visible
	And The button add to cart is enabled
	
	When I set the quantity "2"
	Then There is no error message visible
	
	When I click in the add to cart button
	And The shopping cart is presented
	Then There is no error message in the shopping cart
  
  
  Scenario: [P0010][A010] Check Stock: FALSE | Check Stock Before Shopping Cart : TRUE  | Allow Checkout: FALSE | Check attribute stock level: TRUE | Deactivate Attributes: FALSE
	Given I have the following parameters configured in the settings page
	  | Check stock level                 | unchecked |
	  | Check stock before shopping cart? | checked   |
	  | Allow Checkout                    | unchecked |
	  | Check attribute stock level       | checked   |
	  | Deactivate Attributes             | unchecked |
	And I am on the homepage
	Then The product "Product without Stock" should be visible
	When I clicked in the product "Product without Stock"
	Then The product info page must be active
	And  The selected product is "Product without Stock"
	And There is no error message visible
	And The button add to cart is enabled
	
	When I set the quantity "2"
	Then There is no error message visible
	
	When I click in the add to cart button
	And The shopping cart is presented
	Then There is no error message in the shopping cart
  
  
  Scenario: [P0011][A010] Check Stock: FALSE | Check Stock Before Shopping Cart : TRUE  | Allow Checkout: TRUE | Check attribute stock level: TRUE | Deactivate Attributes: FALSE
	Given I have the following parameters configured in the settings page
	  | Check stock level                 | unchecked |
	  | Check stock before shopping cart? | checked   |
	  | Allow Checkout                    | checked   |
	  | Check attribute stock level       | checked   |
	  | Deactivate Attributes             | unchecked |
	And I am on the homepage
	Then The product "Product without Stock" should be visible
	When I clicked in the product "Product without Stock"
	Then The product info page must be active
	And  The selected product is "Product without Stock"
	And There is no error message visible
	And The button add to cart is enabled
	
	When I set the quantity "2"
	Then There is no error message visible
	
	When I click in the add to cart button
	And The shopping cart is presented
	Then There is no error message in the shopping cart
  
  
  Scenario: [P0100][A010] Check Stock: TRUE  | Check Stock Before Shopping Cart : FALSE | Allow Checkout: FALSE | Check attribute stock level: TRUE | Deactivate Attributes: FALSE
	Given I have the following parameters configured in the settings page
	  | Check stock level                 | checked   |
	  | Check stock before shopping cart? | unchecked |
	  | Allow Checkout                    | unchecked |
	  | Check attribute stock level       | checked   |
	  | Deactivate Attributes             | unchecked |
	And I am on the homepage
	Then The product "Product without Stock" should be visible
	When I clicked in the product "Product without Stock"
	Then The product info page must be active
	And  The selected product is "Product without Stock"
	And There is no error message visible
	And The button add to cart is enabled
	
	When I set the quantity "2"
	Then There is no error message visible
	
	When I click in the add to cart button
	And The shopping cart is presented
	Then There is an error message "The products marked ***, are not in stock in the quantity you requested. Please reduce the quantity of the marked products on your order. Thank you" in the shopping cart
  
  
  Scenario: [P0101][A010] Check Stock: TRUE  | Check Stock Before Shopping Cart : FALSE | Allow Checkout: TRUE | Check attribute stock level: TRUE | Deactivate Attributes: FALSE
	Given I have the following parameters configured in the settings page
	  | Check stock level                 | checked   |
	  | Check stock before shopping cart? | unchecked |
	  | Allow Checkout                    | checked   |
	  | Check attribute stock level       | checked   |
	  | Deactivate Attributes             | unchecked |
	And I am on the homepage
	Then The product "Product without Stock" should be visible
	When I clicked in the product "Product without Stock"
	Then The product info page must be active
	And  The selected product is "Product without Stock"
	And There is no error message visible
	And The button add to cart is enabled
	
	When I set the quantity "2"
	Then There is no error message visible
	
	When I click in the add to cart button
	And The shopping cart is presented
	Then There is an error message "some error goes here" in the shopping cart
  
  
  Scenario: [P0110][A010] Check Stock: TRUE  | Check Stock Before Shopping Cart : TRUE  | Allow Checkout: FALSE | Check attribute stock level: TRUE | Deactivate Attributes: FALSE
	Given I have the following parameters configured in the settings page
	  | Check stock level                 | checked   |
	  | Check stock before shopping cart? | checked   |
	  | Allow Checkout                    | unchecked |
	  | Check attribute stock level       | checked   |
	  | Deactivate Attributes             | unchecked |
	And I am on the homepage
	Then The product "Product without Stock" should be visible
	When I clicked in the product "Product without Stock"
	Then The product info page must be active
	And  The selected product is "Product without Stock"
	And The error message "This product ist not available." is visible
	And The button add to cart is disabled
	
	When I set the quantity "2"
	Then There is an error message "some error goes here" in the shopping cart
  
  
  Scenario: [P0111][A010] Check Stock: TRUE  | Check Stock Before Shopping Cart : TRUE  | Allow Checkout: TRUE | Check attribute stock level: TRUE | Deactivate Attributes: FALSE
	Given I have the following parameters configured in the settings page
	  | Check stock level                 | checked   |
	  | Check stock before shopping cart? | checked   |
	  | Allow Checkout                    | checked   |
	  | Check attribute stock level       | checked   |
	  | Deactivate Attributes             | unchecked |
	And I am on the homepage
	Then The product "Product without Stock" should be visible
	When I clicked in the product "Product without Stock"
	Then The product info page must be active
	And  The selected product is "Product without Stock"
	And The error message "This product is not in stock. The quantity entered will be supplied by us very soon." is visible
	And The button add to cart is enabled
	
	When I set the quantity "2"
	And The error message "This product is not in stock. The quantity entered will be supplied by us very soon." is visible
	
	When I click in the add to cart button
	And The shopping cart is presented
	Then There is an error message "some error goes here" in the shopping cart


