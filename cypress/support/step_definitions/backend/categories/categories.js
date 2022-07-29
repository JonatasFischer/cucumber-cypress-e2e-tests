import {Given, Then, When} from '@badeball/cypress-cucumber-preprocessor';
import Admin from "../../../page_objects/admin/Admin";
import Categories from "../../../page_objects/admin/product/Categories";
import Combinations from "../../../page_objects/admin/product/Combinations";
import ProductMaintenance from "../../../page_objects/admin/product/ProductMaintenance";

Given("I'm at the categories page", Categories.visit);
When("I navigate to the {string} category", Categories.navigateCategory);
When("I click in the create product button", Categories.clickCreateProduct);
When("I navigate to the product {string} options", (productName) => {
    Categories.navigateProductOptions(productName)
    Combinations.isActive()
});

When("I navigate to the product {string} attributes",Categories.navigateProductAttributes);
When("I navigate to the product {string}", (productName) => {
    Categories.navigateProduct(productName)
    ProductMaintenance.isActive()
});

Then("I am redirected to the new product page", ProductMaintenance.isActive);
When("I define the product quantity as {string}", ProductMaintenance.setQuantity);
When("I check the field {string} at the panel {string}", ProductMaintenance.checkField);
When("I fill the product name for the language {string} with {string}", ProductMaintenance.fillProdudctName);
When("I delete any product with the name as {string}", Categories.deleteProductsNamedAs);
When("I save the product", ProductMaintenance.save);
When("I define the product price as {string}", ProductMaintenance.setPrice);
When("I define the product weight as {string}", ProductMaintenance.setWeight);
Then(/^There is (\d+) product\(s\) named as "([^"]*)"$/, Categories.checkArticleRecordsNamesAs);
Then("I expand all the boxes", ProductMaintenance.expandAll);