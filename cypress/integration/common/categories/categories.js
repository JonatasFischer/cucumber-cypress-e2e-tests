import {Given} from 'cypress-cucumber-preprocessor/steps';
import Admin from "../../../pages/admin/Admin";
import Categories from "../../../pages/admin/product/Categories";
import Combinations from "../../../pages/admin/product/Combinations";
import ProductAttributes from "../../../pages/admin/product/ProductAttributes";
import ProductMaintenance from "../../../pages/admin/product/ProductMaintenance";

Given("I'm at the categories page", () => {
    Categories.visit()
});
When("I navigate to the {string} category", (categoryName) => {
    Categories.navigateCategory(categoryName)
});

When("I click in the create product button", () => {
    Categories.clickCreateProduct()
});

When("I navigate to the product {string} options", (productName) => {
    Categories.navigateProductOptions(productName)
    Combinations.isActive()
});
When("I navigate to the product {string} attributes", (productName) => {
    Categories.navigateProductAttributes(productName)
});

When("I navigate to the product {string}", (productName) => {
    Categories.navigateProduct(productName)
    ProductMaintenance.isActive()
});

Then("I am redirected to the new product page", () => {
    ProductMaintenance.isActive()
});

When("I define the product quantity as {string}", (quantity) => {
    ProductMaintenance.setQuantity(quantity)
});
When("I check the field {string}", (fieldLabel) => {
    ProductMaintenance.checkField(fieldLabel)
});
When("I fill the product name for the language {string} with {string}", (language, text) => {
    ProductMaintenance.fillProdudctName(language, text)
});

When("I delete any product with the name as {string}", (productName) => {
    Categories.deleteProductsNamedAs(productName)
});

When("I save the product", (quantity) => {
    ProductMaintenance.save()
});
When("I define the product price as {string}", (price) => {
    ProductMaintenance.setPrice(price)
});
When("I define the product weight as {string}", (weight) => {
    ProductMaintenance.setWeight(weight)
});