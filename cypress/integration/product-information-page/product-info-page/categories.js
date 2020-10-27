import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';
import Admin from "../../../pages/admin/Admin";
import Categories from "../../../pages/admin/product/Categories";
import Combinations from "../../../pages/admin/product/Combinations";
import ProductMaintenance from "../../../pages/admin/product/ProductMaintenance";

Given("I'm at the categories page", () => {
    Admin.login();
    Categories.visit()
});
When("I navigate to the {string} category", (categoryName) => {
    Categories.navigateCategory(categoryName)
});

When("I navigate to the product {string} options", (productName) => {
    Categories.navigateProductOptions(productName)
    Combinations.isActive()
});
When("I navigate to the product {string}", (productName) => {
    Categories.navigateProduct(productName)
    ProductMaintenance.isActive()
});
When("I update the product quantity to {string}", (quantity) => {
    ProductMaintenance.setQuantity(quantity)
});
When("I save the product", (quantity) => {
    ProductMaintenance.save()
});