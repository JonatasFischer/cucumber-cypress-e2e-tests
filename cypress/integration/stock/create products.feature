Feature: Create products tests
  
  Background:
	Given I am logged in the admin
  
  Scenario: Create a bunch of products
	
	
	Given  I'm at the categories page
	
	When  I click in the create product button
	Then I am redirected to the new product page
	
	When I check the field "Show on start page"
	And  I define the product quantity as "10"
	And  I define the product price as "9.99"
	And  I fill the product name for the language "de" with "German Description"
	And  I fill the product name for the language "en" with "English Description"
	And  I save the product
	
	When I delete any product with the name as "English Description"










