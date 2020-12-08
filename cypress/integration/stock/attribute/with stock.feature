Feature: Check Product information page and Shopping cart for products with attribute with stock
  
  Background:
	Given I am logged in the admin
	And The shopping cart is empty
  
  
  Scenario: [P1000][A111] Check Stock: FALSE | Check Stock Before Shopping Cart : FALSE | Allow Checkout: FALSE | Check attribute stock level: TRUE | Deactivate Attributes: FALSE
	Given I have the following parameters configured in the settings page
	  | Check stock level                 | unchecked |
	  | Check stock before shopping cart? | unchecked |
	  | Allow Checkout                    | unchecked |
	  | Check attribute stock level       | checked   |
	  | Deactivate Attributes             | unchecked |
	And I am on the homepage
	Then The product "[P1A1] Product with attribute with Stock" should be visible
	
	When I clicked in the product "[P1A1] Product with attribute with Stock"
	Then The product info page must be active
	And  The selected product is "[P1A1] Product with attribute with Stock"
	And There is no error message visible
	And The button add to cart is enabled
	
	When I set the quantity "2"
	Then There is no error message visible
	
	When I click in the add to cart button
	And The shopping cart is presented
	Then There is no error message in the shopping cart
  
  
  Scenario: [P1001][A111] Check Stock: FALSE | Check Stock Before Shopping Cart : FALSE | Allow Checkout: TRUE | Check attribute stock level: TRUE | Deactivate Attributes: FALSE
	Given I have the following parameters configured in the settings page
	  | Check stock level                 | unchecked |
	  | Check stock before shopping cart? | unchecked |
	  | Allow Checkout                    | checked   |
	And I am on the homepage
	Then The product "[P1A1] Product with attribute with Stock" should be visible
	When I clicked in the product "[P1A1] Product with attribute with Stock"
	Then The product info page must be active
	And  The selected product is "[P1A1] Product with attribute with Stock"
	And There is no error message visible
	And The button add to cart is enabled
	
	When I set the quantity "2"
	Then There is no error message visible
	
	When I click in the add to cart button
	And The shopping cart is presented
	Then There is no error message in the shopping cart
  
  
  Scenario: [P1010][A111] Check Stock: FALSE | Check Stock Before Shopping Cart : TRUE  | Allow Checkout: FALSE | Check attribute stock level: TRUE | Deactivate Attributes: FALSE
	Given I have the following parameters configured in the settings page
	  | Check stock level                 | unchecked |
	  | Check stock before shopping cart? | checked   |
	  | Allow Checkout                    | unchecked |
	  | Check attribute stock level       | checked   |
	  | Deactivate Attributes             | unchecked |
	And I am on the homepage
	Then The product "[P1A1] Product with attribute with Stock" should be visible
	When I clicked in the product "[P1A1] Product with attribute with Stock"
	Then The product info page must be active
	And  The selected product is "[P1A1] Product with attribute with Stock"
	And There is no error message visible
	And The button add to cart is enabled
	
	When I set the quantity "2"
	Then There is no error message visible
	
	When I click in the add to cart button
	And The shopping cart is presented
	Then There is no error message in the shopping cart
  
  
  Scenario: [P1011][A111] Check Stock: FALSE | Check Stock Before Shopping Cart : TRUE  | Allow Checkout: TRUE | Check attribute stock level: TRUE | Deactivate Attributes: FALSE
	Given I have the following parameters configured in the settings page
	  | Check stock level                 | unchecked |
	  | Check stock before shopping cart? | checked   |
	  | Allow Checkout                    | checked   |
	And I am on the homepage
	Then The product "[P1A1] Product with attribute with Stock" should be visible
	When I clicked in the product "[P1A1] Product with attribute with Stock"
	Then The product info page must be active
	And  The selected product is "[P1A1] Product with attribute with Stock"
	And There is no error message visible
	And The button add to cart is enabled
	
	When I set the quantity "2"
	Then There is no error message visible
	
	When I click in the add to cart button
	And The shopping cart is presented
	Then There is no error message in the shopping cart
  
  
  Scenario: [P1100][A111] Check Stock: TRUE  | Check Stock Before Shopping Cart : FALSE | Allow Checkout: FALSE | Check attribute stock level: TRUE | Deactivate Attributes: FALSE
	Given I have the following parameters configured in the settings page
	  | Check stock level                 | checked   |
	  | Check stock before shopping cart? | unchecked |
	  | Allow Checkout                    | unchecked |
	  | Check attribute stock level       | checked   |
	  | Deactivate Attributes             | unchecked |
	And I am on the homepage
	Then The product "[P1A1] Product with attribute with Stock" should be visible
	When I clicked in the product "[P1A1] Product with attribute with Stock"
	Then The product info page must be active
	And  The selected product is "[P1A1] Product with attribute with Stock"
	And There is no error message visible
	And The button add to cart is enabled
	
	When I set the quantity "2"
	Then There is no error message visible
	
	When I click in the add to cart button
	And The shopping cart is presented
	Then There is no error message in the shopping cart
  
  
  Scenario: [P1101][A111] Check Stock: TRUE  | Check Stock Before Shopping Cart : FALSE | Allow Checkout: TRUE | Check attribute stock level: TRUE | Deactivate Attributes: FALSE
	Given I have the following parameters configured in the settings page
	  | Check stock level                 | checked   |
	  | Check stock before shopping cart? | unchecked |
	  | Allow Checkout                    | checked   |
	And I am on the homepage
	Then The product "[P1A1] Product with attribute with Stock" should be visible
	When I clicked in the product "[P1A1] Product with attribute with Stock"
	Then The product info page must be active
	And  The selected product is "[P1A1] Product with attribute with Stock"
	And There is no error message visible
	And The button add to cart is enabled
	
	When I set the quantity "2"
	Then There is no error message visible
	
	When I click in the add to cart button
	And The shopping cart is presented
	Then There is no error message in the shopping cart
  
  
  Scenario: [P1110][A111] Check Stock: TRUE  | Check Stock Before Shopping Cart : TRUE  | Allow Checkout: FALSE | Check attribute stock level: TRUE | Deactivate Attributes: FALSE
	Given I have the following parameters configured in the settings page
	  | Check stock level                 | checked   |
	  | Check stock before shopping cart? | checked   |
	  | Allow Checkout                    | unchecked |
	  | Check attribute stock level       | checked   |
	  | Deactivate Attributes             | unchecked |
	And I am on the homepage
	Then The product "[P1A1] Product with attribute with Stock" should be visible
	When I clicked in the product "[P1A1] Product with attribute with Stock"
	Then The product info page must be active
	And  The selected product is "[P1A1] Product with attribute with Stock"
	And There is no error message visible
	And The button add to cart is enabled
	
	When I set the quantity "2"
	Then There is no error message visible
	
	When I click in the add to cart button
	And The shopping cart is presented
	Then There is no error message in the shopping cart
  
  
  Scenario: [P1111][A111] Check Stock: TRUE  | Check Stock Before Shopping Cart : TRUE  | Allow Checkout: TRUE | Check attribute stock level: TRUE | Deactivate Attributes: FALSE
	Given I have the following parameters configured in the settings page
	  | Check stock level                 | checked   |
	  | Check stock before shopping cart? | checked   |
	  | Allow Checkout                    | checked   |
	  | Check attribute stock level       | checked   |
	  | Deactivate Attributes             | unchecked |
	And I am on the homepage
	Then The product "[P1A1] Product with attribute with Stock" should be visible
	When I clicked in the product "[P1A1] Product with attribute with Stock"
	Then The product info page must be active
	And  The selected product is "[P1A1] Product with attribute with Stock"
	And There is no error message visible
	And The button add to cart is enabled
	
	When I set the quantity "2"
	Then There is no error message visible
	
	When I click in the add to cart button
	And The shopping cart is presented
	Then There is no error message in the shopping cart
 


