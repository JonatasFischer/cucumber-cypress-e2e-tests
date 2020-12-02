Feature: Check Stock Level, Check Stock Before Shopping Cart, Allow Checkout, Deactivate Attributes,Show Stock Attributes, Check attribute stock level  - Product Info Stock Validations
  
  Scenario: Selling product without stock and attribute without stock quantity
	Given I have the module "Product Options" installed
	And I have the following parameters configured in the settings page
	  | Check stock level                 | checked |
	  | Check stock before shopping cart? | checked |
	  | Allow Checkout                    | checked |
	  | Deactivate Attributes             | checked |
	  | Show Stock Attributes             | checked |
	  | Check attribute stock level       | checked |
	
	And I'm at the categories page
	When I delete any product with the name as "English Description"
	
	Given  I have the following attribute configured
	  | de | Gift Box DE |
	  | en | Gift Box EN |
	And  I have the following options configured to the attribute "Gift Box EN"
	  | 0 | en | Yes  |
	  | 0 | de | Ja   |
	  | 1 | en | No   |
	  | 1 | de | Nein |
	And  I'm at the categories page
	When  I click in the create product button
	Then I am redirected to the new product page
	
	When I check the field "Show on start page"
	When I check the field "Show stock"
	When I check the field "Show weight"
	And I define the product quantity as "0"
	And I define the product price as "9.99"
	And I define the product weight as "1000"
	And I fill the product name for the language "de" with "German Description"
	And I fill the product name for the language "en" with "English Description"
	And I save the product
	
	Given I'm at the categories page
	And I navigate to the product "English Description" attributes
	And I click in the load attributes button for the attribute "Gift Box EN"
	
	And I configure the attribute "Gift Box EN" option "No" with the following values
	  | Checked         | true |
	  | Sort Order      | 0    |
	  | Attribute Model | XPTO |
	  | EAN             | 6789 |
	  | Stock           | 0    |
	  | VPE Value       | 100  |
	  | Weight          | 10   |
	  | Weight Prefix   | +    |
	  | Price           | 10   |
	  | Price Prefix    | +    |
	And I configure the attribute "Gift Box EN" option "Yes" with the following values
	  | Checked         | true |
	  | Sort Order      | 1    |
	  | Attribute Model | XPTO |
	  | EAN             | 1234 |
	  | Stock           | 0    |
	  | VPE Value       | 100  |
	  | Weight          | 100  |
	  | Weight Prefix   | +    |
	  | Price           | 100  |
	  | Price Prefix    | +    |
	And I save the attribute configuration
	
	Given I am on the homepage
	Then The product "English Description" should be visible
	
	When I clicked in the product "English Description"
	Then The product info page must be active
	And  The selected product is "English Description"
	And  There is a modifier called "Gift Box EN"
	And  There is an option "No" for the modifier "Gift Box EN"
	And  There is an option "Yes" for the modifier "Gift Box EN"
	And  The option "No" for the modifier "Gift Box EN" is active
	And  The option "No" for the modifier "Gift Box EN" is selected
	And  The option "Yes" for the modifier "Gift Box EN" is active
	And  The product price is "19,99 EUR"
	And  The product weight is "1010"
	And  The error message "This product ist not available." does not exist
	And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." is visible
	And  The button add to cart is enabled
	
	When I selected the option "Yes" for the modifier "Gift Box EN"
	Then There is an option "No" for the modifier "Gift Box EN"
	And  There is an option "Yes" for the modifier "Gift Box EN"
	And  The option "No" for the modifier "Gift Box EN" is active
	And  The option "Yes" for the modifier "Gift Box EN" is active
	And  The option "Yes" for the modifier "Gift Box EN" is selected
	And  The product price is "109,99 EUR"
	And  The product weight is "1100"
	And  The button add to cart is enabled
	And  The error message "This product ist not available." does not exist
	And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." is visible
	And  The button add to cart is enabled
  
  
  Scenario: Selling product without stock and one attribute option with stock
	Given I have the module "Product Options" installed
	And I have the following parameters configured in the settings page
	  | Check stock level                 | checked |
	  | Check stock before shopping cart? | checked |
	  | Allow Checkout                    | checked |
	  | Deactivate Attributes             | checked |
	  | Show Stock Attributes             | checked |
	  | Check attribute stock level       | checked |
	
	Given I'm at the categories page
	When I delete any product with the name as "English Description"
	
	Given  I have the following attribute configured
	  | de | Gift Box DE |
	  | en | Gift Box EN |
	And  I have the following options configured to the attribute "Gift Box EN"
	  | 0 | en | Yes  |
	  | 0 | de | Ja   |
	  | 1 | en | No   |
	  | 1 | de | Nein |
	And  I'm at the categories page
	When  I click in the create product button
	Then I am redirected to the new product page
	
	When I check the field "Show on start page"
	When I check the field "Show stock"
	When I check the field "Show weight"
	And I define the product quantity as "0"
	And I define the product price as "9.99"
	And I define the product weight as "1000"
	And I fill the product name for the language "de" with "German Description"
	And I fill the product name for the language "en" with "English Description"
	And I save the product
	
	Given I'm at the categories page
	And I navigate to the product "English Description" attributes
	And I click in the load attributes button for the attribute "Gift Box EN"
	
	And I configure the attribute "Gift Box EN" option "No" with the following values
	  | Checked         | true |
	  | Sort Order      | 0    |
	  | Attribute Model | XPTO |
	  | EAN             | 6789 |
	  | Stock           | 100  |
	  | VPE Value       | 100  |
	  | Weight          | 10   |
	  | Weight Prefix   | +    |
	  | Price           | 10   |
	  | Price Prefix    | +    |
	And I configure the attribute "Gift Box EN" option "Yes" with the following values
	  | Checked         | true |
	  | Sort Order      | 1    |
	  | Attribute Model | XPTO |
	  | EAN             | 1234 |
	  | Stock           | 0    |
	  | VPE Value       | 100  |
	  | Weight          | 100  |
	  | Weight Prefix   | +    |
	  | Price           | 100  |
	  | Price Prefix    | +    |
	And I save the attribute configuration
	
	Given I am on the homepage
	Then The product "English Description" should be visible
	
	When I clicked in the product "English Description"
	Then The product info page must be active
	And  The selected product is "English Description"
	And  There is a modifier called "Gift Box EN"
	And  There is an option "No" for the modifier "Gift Box EN"
	And  There is an option "Yes" for the modifier "Gift Box EN"
	And  The option "No" for the modifier "Gift Box EN" is active
	And  The option "No" for the modifier "Gift Box EN" is selected
	And  The option "Yes" for the modifier "Gift Box EN" is active
	And  The product price is "19,99 EUR"
	And  The product weight is "1010"
	And  The error message "This product ist not available." does not exist
	And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." is visible
	And  The button add to cart is enabled
	
	When I selected the option "Yes" for the modifier "Gift Box EN"
	Then There is an option "No" for the modifier "Gift Box EN"
	And  There is an option "Yes" for the modifier "Gift Box EN"
	And  The option "No" for the modifier "Gift Box EN" is active
	And  The option "Yes" for the modifier "Gift Box EN" is active
	And  The option "Yes" for the modifier "Gift Box EN" is selected
	And  The product price is "109,99 EUR"
	And  The product weight is "1100"
	And  The button add to cart is enabled
	And  The error message "This product ist not available." does not exist
	And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." is visible
	And  The button add to cart is enabled
  
  
  Scenario: Selling product without stock and two attribute options with stock
	Given I have the module "Product Options" installed
	And I have the following parameters configured in the settings page
	  | Check stock level                 | checked |
	  | Check stock before shopping cart? | checked |
	  | Allow Checkout                    | checked |
	  | Deactivate Attributes             | checked |
	  | Show Stock Attributes             | checked |
	  | Check attribute stock level       | checked |
	
	And I'm at the categories page
	When I delete any product with the name as "English Description"
	
	Given  I have the following attribute configured
	  | de | Gift Box DE |
	  | en | Gift Box EN |
	And  I have the following options configured to the attribute "Gift Box EN"
	  | 0 | en | Yes  |
	  | 0 | de | Ja   |
	  | 1 | en | No   |
	  | 1 | de | Nein |
	And  I'm at the categories page
	When  I click in the create product button
	Then I am redirected to the new product page
	
	When I check the field "Show on start page"
	When I check the field "Show stock"
	When I check the field "Show weight"
	And I define the product quantity as "0"
	And I define the product price as "9.99"
	And I define the product weight as "1000"
	And I fill the product name for the language "de" with "German Description"
	And I fill the product name for the language "en" with "English Description"
	And I save the product
	
	Given I'm at the categories page
	And I navigate to the product "English Description" attributes
	And I click in the load attributes button for the attribute "Gift Box EN"
	
	And I configure the attribute "Gift Box EN" option "No" with the following values
	  | Checked         | true |
	  | Sort Order      | 0    |
	  | Attribute Model | XPTO |
	  | EAN             | 6789 |
	  | Stock           | 100  |
	  | VPE Value       | 100  |
	  | Weight          | 10   |
	  | Weight Prefix   | +    |
	  | Price           | 10   |
	  | Price Prefix    | +    |
	And I configure the attribute "Gift Box EN" option "Yes" with the following values
	  | Checked         | true |
	  | Sort Order      | 1    |
	  | Attribute Model | XPTO |
	  | EAN             | 1234 |
	  | Stock           | 1000 |
	  | VPE Value       | 100  |
	  | Weight          | 100  |
	  | Weight Prefix   | +    |
	  | Price           | 100  |
	  | Price Prefix    | +    |
	And I save the attribute configuration
	
	Given I am on the homepage
	Then The product "English Description" should be visible
	
	When I clicked in the product "English Description"
	Then The product info page must be active
	And  The selected product is "English Description"
	And  There is a modifier called "Gift Box EN"
	And  There is an option "No" for the modifier "Gift Box EN"
	And  There is an option "Yes" for the modifier "Gift Box EN"
	And  The option "No" for the modifier "Gift Box EN" is active
	And  The option "No" for the modifier "Gift Box EN" is selected
	And  The option "Yes" for the modifier "Gift Box EN" is active
	And  The product price is "19,99 EUR"
	And  The product weight is "1010"
	And  The error message "This product ist not available." does not exist
	And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." is visible
	And  The button add to cart is enabled
	
	When I selected the option "Yes" for the modifier "Gift Box EN"
	Then There is an option "No" for the modifier "Gift Box EN"
	And  There is an option "Yes" for the modifier "Gift Box EN"
	And  The option "No" for the modifier "Gift Box EN" is active
	And  The option "Yes" for the modifier "Gift Box EN" is active
	And  The option "Yes" for the modifier "Gift Box EN" is selected
	And  The product price is "109,99 EUR"
	And  The product weight is "1100"
	And  The button add to cart is enabled
	And  The error message "This product ist not available." does not exist
	And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." is visible
	And  The button add to cart is enabled
  
  
  Scenario: Selling product with stock and one attribute option with stock
	Given I have the module "Product Options" installed
	And I have the following parameters configured in the settings page
	  | Check stock level                 | checked |
	  | Check stock before shopping cart? | checked |
	  | Allow Checkout                    | checked |
	  | Deactivate Attributes             | checked |
	  | Show Stock Attributes             | checked |
	  | Check attribute stock level       | checked |
	
	And I'm at the categories page
	When I delete any product with the name as "English Description"
	
	Given  I have the following attribute configured
	  | de | Gift Box DE |
	  | en | Gift Box EN |
	And  I have the following options configured to the attribute "Gift Box EN"
	  | 0 | en | Yes  |
	  | 0 | de | Ja   |
	  | 1 | en | No   |
	  | 1 | de | Nein |
	And  I'm at the categories page
	When  I click in the create product button
	Then I am redirected to the new product page
	
	When I check the field "Show on start page"
	When I check the field "Show stock"
	When I check the field "Show weight"
	And I define the product quantity as "100"
	And I define the product price as "9.99"
	And I define the product weight as "1000"
	And I fill the product name for the language "de" with "German Description"
	And I fill the product name for the language "en" with "English Description"
	And I save the product
	
	Given I'm at the categories page
	And I navigate to the product "English Description" attributes
	And I click in the load attributes button for the attribute "Gift Box EN"
	
	And I configure the attribute "Gift Box EN" option "No" with the following values
	  | Checked         | true |
	  | Sort Order      | 0    |
	  | Attribute Model | XPTO |
	  | EAN             | 6789 |
	  | Stock           | 100  |
	  | VPE Value       | 100  |
	  | Weight          | 10   |
	  | Weight Prefix   | +    |
	  | Price           | 10   |
	  | Price Prefix    | +    |
	And I configure the attribute "Gift Box EN" option "Yes" with the following values
	  | Checked         | true |
	  | Sort Order      | 1    |
	  | Attribute Model | XPTO |
	  | EAN             | 1234 |
	  | Stock           | 0    |
	  | VPE Value       | 100  |
	  | Weight          | 100  |
	  | Weight Prefix   | +    |
	  | Price           | 100  |
	  | Price Prefix    | +    |
	And I save the attribute configuration
	
	Given I am on the homepage
	Then The product "English Description" should be visible
	# Validates initial load
	When I clicked in the product "English Description"
	Then The product info page must be active
	And  The selected product is "English Description"
	And  There is a modifier called "Gift Box EN"
	And  There is an option "No" for the modifier "Gift Box EN"
	And  There is an option "Yes" for the modifier "Gift Box EN"
	And  The option "No" for the modifier "Gift Box EN" is active
	And  The option "No" for the modifier "Gift Box EN" is selected
	And  The option "Yes" for the modifier "Gift Box EN" is active
	And  The product price is "19,99 EUR"
	And  The product weight is "1010"
	And  The error message "This product ist not available." does not exist
	And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." does not exist
	And  The button add to cart is enabled
	# Validates ajax load for a product without stock
	When I selected the option "Yes" for the modifier "Gift Box EN"
	Then There is an option "No" for the modifier "Gift Box EN"
	And  There is an option "Yes" for the modifier "Gift Box EN"
	And  The option "No" for the modifier "Gift Box EN" is active
	And  The option "Yes" for the modifier "Gift Box EN" is active
	And  The option "Yes" for the modifier "Gift Box EN" is selected
	And  The product price is "109,99 EUR"
	And  The product weight is "1100"
	And  The button add to cart is enabled
	And  The error message "This product ist not available." does not exist
	And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." is visible
	And  The button add to cart is enabled
	# Validates ajax request for a product with stock
	When I selected the option "No" for the modifier "Gift Box EN"
	Then There is an option "No" for the modifier "Gift Box EN"
	And  There is an option "Yes" for the modifier "Gift Box EN"
	And  The option "No" for the modifier "Gift Box EN" is active
	And  The option "Yes" for the modifier "Gift Box EN" is active
	And  The option "No" for the modifier "Gift Box EN" is selected
	And  The product price is "19,99 EUR"
	And  The product weight is "1010"
	And  The button add to cart is enabled
	And  The error message "This product ist not available." does not exist
	And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." does not exist
	And  The button add to cart is enabled
  
  
  Scenario: Selling product with stock and all attribute option with stock
	Given I have the module "Product Options" installed
	And I have the following parameters configured in the settings page
	  | Check stock level                 | checked |
	  | Check stock before shopping cart? | checked |
	  | Allow Checkout                    | checked |
	  | Deactivate Attributes             | checked |
	  | Show Stock Attributes             | checked |
	  | Check attribute stock level       | checked |
	
	And I'm at the categories page
	When I delete any product with the name as "English Description"
	
	Given  I have the following attribute configured
	  | de | Gift Box DE |
	  | en | Gift Box EN |
	And  I have the following options configured to the attribute "Gift Box EN"
	  | 0 | en | Yes  |
	  | 0 | de | Ja   |
	  | 1 | en | No   |
	  | 1 | de | Nein |
	And  I'm at the categories page
	When  I click in the create product button
	Then I am redirected to the new product page
	
	When I check the field "Show on start page"
	When I check the field "Show stock"
	When I check the field "Show weight"
	And I define the product quantity as "100"
	And I define the product price as "9.99"
	And I define the product weight as "1000"
	And I fill the product name for the language "de" with "German Description"
	And I fill the product name for the language "en" with "English Description"
	And I save the product
	
	Given I'm at the categories page
	And I navigate to the product "English Description" attributes
	And I click in the load attributes button for the attribute "Gift Box EN"
	
	And I configure the attribute "Gift Box EN" option "No" with the following values
	  | Checked         | true |
	  | Sort Order      | 0    |
	  | Attribute Model | XPTO |
	  | EAN             | 6789 |
	  | Stock           | 100  |
	  | VPE Value       | 100  |
	  | Weight          | 10   |
	  | Weight Prefix   | +    |
	  | Price           | 10   |
	  | Price Prefix    | +    |
	And I configure the attribute "Gift Box EN" option "Yes" with the following values
	  | Checked         | true |
	  | Sort Order      | 1    |
	  | Attribute Model | XPTO |
	  | EAN             | 1234 |
	  | Stock           | 100  |
	  | VPE Value       | 100  |
	  | Weight          | 100  |
	  | Weight Prefix   | +    |
	  | Price           | 100  |
	  | Price Prefix    | +    |
	And I save the attribute configuration
	
	Given I am on the homepage
	Then The product "English Description" should be visible
	# Validates initial load
	When I clicked in the product "English Description"
	Then The product info page must be active
	And  The selected product is "English Description"
	And  There is a modifier called "Gift Box EN"
	And  There is an option "No" for the modifier "Gift Box EN"
	And  There is an option "Yes" for the modifier "Gift Box EN"
	And  The option "No" for the modifier "Gift Box EN" is active
	And  The option "No" for the modifier "Gift Box EN" is selected
	And  The option "Yes" for the modifier "Gift Box EN" is active
	And  The product price is "19,99 EUR"
	And  The product weight is "1010"
	And  The error message "This product ist not available." does not exist
	And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." does not exist
	And  The button add to cart is enabled
	# Validates ajax load for a product without stock
	When I selected the option "Yes" for the modifier "Gift Box EN"
	Then There is an option "No" for the modifier "Gift Box EN"
	And  There is an option "Yes" for the modifier "Gift Box EN"
	And  The option "No" for the modifier "Gift Box EN" is active
	And  The option "Yes" for the modifier "Gift Box EN" is active
	And  The option "Yes" for the modifier "Gift Box EN" is selected
	And  The product price is "109,99 EUR"
	And  The product weight is "1100"
	And  The button add to cart is enabled
	And  The error message "This product ist not available." does not exist
	And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." does not exist
	And  The button add to cart is enabled
	# Validates ajax request for a product with stock
	When I selected the option "No" for the modifier "Gift Box EN"
	Then There is an option "No" for the modifier "Gift Box EN"
	And  There is an option "Yes" for the modifier "Gift Box EN"
	And  The option "No" for the modifier "Gift Box EN" is active
	And  The option "Yes" for the modifier "Gift Box EN" is active
	And  The option "No" for the modifier "Gift Box EN" is selected
	And  The product price is "19,99 EUR"
	And  The product weight is "1010"
	And  The button add to cart is enabled
	And  The error message "This product ist not available." does not exist
	And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." does not exist
	And  The button add to cart is enabled
  
  
  Scenario: Selling more than product stock and more than attributes options stock
	Given I have the module "Product Options" installed
	And I have the following parameters configured in the settings page
	  | Check stock level                 | checked |
	  | Check stock before shopping cart? | checked |
	  | Allow Checkout                    | checked |
	  | Deactivate Attributes             | checked |
	  | Show Stock Attributes             | checked |
	  | Check attribute stock level       | checked |
	
	Given I'm at the categories page
	When I delete any product with the name as "English Description"
	
	Given  I have the following attribute configured
	  | de | Gift Box DE |
	  | en | Gift Box EN |
	And  I have the following options configured to the attribute "Gift Box EN"
	  | 0 | en | Yes  |
	  | 0 | de | Ja   |
	  | 1 | en | No   |
	  | 1 | de | Nein |
	And  I'm at the categories page
	When  I click in the create product button
	Then I am redirected to the new product page
	
	When I check the field "Show on start page"
	When I check the field "Show stock"
	When I check the field "Show weight"
	And I define the product quantity as "10"
	And I define the product price as "9.99"
	And I define the product weight as "1000"
	And I fill the product name for the language "de" with "German Description"
	And I fill the product name for the language "en" with "English Description"
	And I save the product
	
	Given I'm at the categories page
	And I navigate to the product "English Description" attributes
	And I click in the load attributes button for the attribute "Gift Box EN"
	
	And I configure the attribute "Gift Box EN" option "No" with the following values
	  | Checked         | true |
	  | Sort Order      | 0    |
	  | Attribute Model | XPTO |
	  | EAN             | 6789 |
	  | Stock           | 10   |
	  | VPE Value       | 100  |
	  | Weight          | 10   |
	  | Weight Prefix   | +    |
	  | Price           | 10   |
	  | Price Prefix    | +    |
	And I configure the attribute "Gift Box EN" option "Yes" with the following values
	  | Checked         | true |
	  | Sort Order      | 1    |
	  | Attribute Model | XPTO |
	  | EAN             | 1234 |
	  | Stock           | 10   |
	  | VPE Value       | 100  |
	  | Weight          | 100  |
	  | Weight Prefix   | +    |
	  | Price           | 100  |
	  | Price Prefix    | +    |
	And I save the attribute configuration
	
	Given I am on the homepage
	Then The product "English Description" should be visible
	
	When I clicked in the product "English Description"
	Then The product info page must be active
	And  The selected product is "English Description"
	And  There is a modifier called "Gift Box EN"
	And  There is an option "No" for the modifier "Gift Box EN"
	And  There is an option "Yes" for the modifier "Gift Box EN"
	And  The option "No" for the modifier "Gift Box EN" is active
	And  The option "No" for the modifier "Gift Box EN" is selected
	And  The option "Yes" for the modifier "Gift Box EN" is active
	And  The product price is "19,99 EUR"
	And  The product weight is "1010"
	And  The error message "This product ist not available." does not exist
	And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." does not exist
	And  The button add to cart is enabled
	
	When I set the quantity "20"
	And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." is visible
	And  The button add to cart is enabled
	
	When I selected the option "Yes" for the modifier "Gift Box EN"
	And I set the quantity "10"
	Then There is an option "No" for the modifier "Gift Box EN"
	And  There is an option "Yes" for the modifier "Gift Box EN"
	And  The option "No" for the modifier "Gift Box EN" is active
	And  The option "Yes" for the modifier "Gift Box EN" is active
	And  The option "Yes" for the modifier "Gift Box EN" is selected
	And  The product price is "109,99 EUR"
	And  The product weight is "1100"
	And  The button add to cart is enabled
	And  The error message "This product ist not available." does not exist
	And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." does not exist
	And  The button add to cart is enabled
	
	When I set the quantity "20"
	And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." is visible
	And  The button add to cart is enabled
  
  
  Scenario: Selling more than product stock and more than one attribute option stock
	Given I have the module "Product Options" installed
	And I have the following parameters configured in the settings page
	  | Check stock level                 | checked |
	  | Check stock before shopping cart? | checked |
	  | Allow Checkout                    | checked |
	  | Deactivate Attributes             | checked |
	  | Show Stock Attributes             | checked |
	  | Check attribute stock level       | checked |
	
	Given I'm at the categories page
	When I delete any product with the name as "English Description"
	
	Given  I have the following attribute configured
	  | de | Gift Box DE |
	  | en | Gift Box EN |
	And  I have the following options configured to the attribute "Gift Box EN"
	  | 0 | en | Yes  |
	  | 0 | de | Ja   |
	  | 1 | en | No   |
	  | 1 | de | Nein |
	And  I'm at the categories page
	When  I click in the create product button
	Then I am redirected to the new product page
	
	When I check the field "Show on start page"
	When I check the field "Show stock"
	When I check the field "Show weight"
	And I define the product quantity as "10"
	And I define the product price as "9.99"
	And I define the product weight as "1000"
	And I fill the product name for the language "de" with "German Description"
	And I fill the product name for the language "en" with "English Description"
	And I save the product
	
	Given I'm at the categories page
	And I navigate to the product "English Description" attributes
	And I click in the load attributes button for the attribute "Gift Box EN"
	
	And I configure the attribute "Gift Box EN" option "No" with the following values
	  | Checked         | true |
	  | Sort Order      | 0    |
	  | Attribute Model | XPTO |
	  | EAN             | 6789 |
	  | Stock           | 100  |
	  | VPE Value       | 100  |
	  | Weight          | 10   |
	  | Weight Prefix   | +    |
	  | Price           | 10   |
	  | Price Prefix    | +    |
	And I configure the attribute "Gift Box EN" option "Yes" with the following values
	  | Checked         | true |
	  | Sort Order      | 1    |
	  | Attribute Model | XPTO |
	  | EAN             | 1234 |
	  | Stock           | 10   |
	  | VPE Value       | 100  |
	  | Weight          | 100  |
	  | Weight Prefix   | +    |
	  | Price           | 100  |
	  | Price Prefix    | +    |
	And I save the attribute configuration
	
	Given I am on the homepage
	Then The product "English Description" should be visible
	
	When I clicked in the product "English Description"
	Then The product info page must be active
	And  The selected product is "English Description"
	And  There is a modifier called "Gift Box EN"
	And  There is an option "No" for the modifier "Gift Box EN"
	And  There is an option "Yes" for the modifier "Gift Box EN"
	And  The option "No" for the modifier "Gift Box EN" is active
	And  The option "No" for the modifier "Gift Box EN" is selected
	And  The option "Yes" for the modifier "Gift Box EN" is active
	And  The product price is "19,99 EUR"
	And  The product weight is "1010"
	And  The error message "This product ist not available." does not exist
	And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." does not exist
	And  The button add to cart is enabled
	
	When I set the quantity "20"
	And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." is visible
	And  The button add to cart is enabled
	
	When I selected the option "Yes" for the modifier "Gift Box EN"
	And I set the quantity "10"
	Then There is an option "No" for the modifier "Gift Box EN"
	And  There is an option "Yes" for the modifier "Gift Box EN"
	And  The option "No" for the modifier "Gift Box EN" is active
	And  The option "Yes" for the modifier "Gift Box EN" is active
	And  The option "Yes" for the modifier "Gift Box EN" is selected
	And  The product price is "109,99 EUR"
	And  The product weight is "1100"
	And  The button add to cart is enabled
	And  The error message "This product ist not available." does not exist
	And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." does not exist
	And  The button add to cart is enabled
	
	When I set the quantity "20"
	And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." is visible
	And  The button add to cart is enabled
  
  
  Scenario: Selling enough product and more than one attribute option stock
	Given I have the module "Product Options" installed
	And I have the following parameters configured in the settings page
	  | Check stock level                 | checked |
	  | Check stock before shopping cart? | checked |
	  | Allow Checkout                    | checked |
	  | Deactivate Attributes             | checked |
	  | Show Stock Attributes             | checked |
	  | Check attribute stock level       | checked |
	
	Given I'm at the categories page
	When I delete any product with the name as "English Description"
	
	Given  I have the following attribute configured
	  | de | Gift Box DE |
	  | en | Gift Box EN |
	And  I have the following options configured to the attribute "Gift Box EN"
	  | 0 | en | Yes  |
	  | 0 | de | Ja   |
	  | 1 | en | No   |
	  | 1 | de | Nein |
	And  I'm at the categories page
	When  I click in the create product button
	Then I am redirected to the new product page
	
	When I check the field "Show on start page"
	When I check the field "Show stock"
	When I check the field "Show weight"
	And I define the product quantity as "100"
	And I define the product price as "9.99"
	And I define the product weight as "1000"
	And I fill the product name for the language "de" with "German Description"
	And I fill the product name for the language "en" with "English Description"
	And I save the product
	
	Given I'm at the categories page
	And I navigate to the product "English Description" attributes
	And I click in the load attributes button for the attribute "Gift Box EN"
	
	And I configure the attribute "Gift Box EN" option "No" with the following values
	  | Checked         | true |
	  | Sort Order      | 0    |
	  | Attribute Model | XPTO |
	  | EAN             | 6789 |
	  | Stock           | 100  |
	  | VPE Value       | 100  |
	  | Weight          | 10   |
	  | Weight Prefix   | +    |
	  | Price           | 10   |
	  | Price Prefix    | +    |
	And I configure the attribute "Gift Box EN" option "Yes" with the following values
	  | Checked         | true |
	  | Sort Order      | 1    |
	  | Attribute Model | XPTO |
	  | EAN             | 1234 |
	  | Stock           | 10   |
	  | VPE Value       | 100  |
	  | Weight          | 100  |
	  | Weight Prefix   | +    |
	  | Price           | 100  |
	  | Price Prefix    | +    |
	And I save the attribute configuration
	
	Given I am on the homepage
	Then The product "English Description" should be visible
	
	When I clicked in the product "English Description"
	Then The product info page must be active
	And  The selected product is "English Description"
	And  There is a modifier called "Gift Box EN"
	And  There is an option "No" for the modifier "Gift Box EN"
	And  There is an option "Yes" for the modifier "Gift Box EN"
	And  The option "No" for the modifier "Gift Box EN" is active
	And  The option "No" for the modifier "Gift Box EN" is selected
	And  The option "Yes" for the modifier "Gift Box EN" is active
	And  The product price is "19,99 EUR"
	And  The product weight is "1010"
	And  The error message "This product ist not available." does not exist
	And  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." does not exist
	And  The button add to cart is enabled
	
	When I set the quantity "20"
	Then  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." does not exist
	And  The error message "This product ist not available." does not exist
	And  The button add to cart is enabled
	
	When I set the quantity "10"
	Then  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." does not exist
	And  The error message "This product ist not available." does not exist
	And  The button add to cart is enabled
	
	When I selected the option "Yes" for the modifier "Gift Box EN"
	Then  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." does not exist
	And  The error message "This product ist not available." does not exist
	And  The button add to cart is enabled
	
	When I set the quantity "20"
	Then  The error message "This product is not in stock. The quantity entered will be supplied by us very soon." is visible
	And  The error message "This product ist not available." does not exist
	And  The button add to cart is enabled
	
	Then There is an option "No" for the modifier "Gift Box EN"
	And  There is an option "Yes" for the modifier "Gift Box EN"
	And  The option "No" for the modifier "Gift Box EN" is active
	And  The option "Yes" for the modifier "Gift Box EN" is active
	And  The option "Yes" for the modifier "Gift Box EN" is selected
	
	And  The product price is "109,99 EUR"
	And  The product weight is "1100"