import ProductInfo from '../page_objects/ProductInfo';
//import {And, Before, Then, When} from '@badeball/cypress-cucumber-preprocessor';
import {And, Then, When} from '@badeball/cypress-cucumber-preprocessor';
/*
Before({tags: "@setup_product_stock_validation"}, function () {
    return () => {
        //alert("before something")
        //debugger
    }
}());
*/
Then('The product info page must be active to the product {string}', (productName) => {
    ProductInfo.isActive(productName);
});


And('The selected product is {string}', (product) => {
    ProductInfo.titleIsEqual(product);
});

And('There is a modifier called {string}', (modifierName) => {
    ProductInfo.checkModifierExists(modifierName);
});

And('There is no modifier called {string}', (modifierName) => {
    ProductInfo.checkModifierNotExists(modifierName);
});

And('There is an option {string} for the modifier {string}', (optionName, modifierName) => {
    ProductInfo.checkModifierOptionExists(optionName, modifierName);
});
And('There is no option {string} for the modifier {string}', (optionName, modifierName) => {
    ProductInfo.checkModifierOptionNotExists(optionName, modifierName);
});

And('The option {string} for the modifier {string} is active', (optionName, modifierName) => {
    ProductInfo.checkModifierOptionNotIsActive(optionName, modifierName);
});

And('The option {string} for the modifier {string} is selected', (optionName, modifierName) => {
    ProductInfo.checkModifierOptionSelected(optionName, modifierName);
});

And('The option {string} for the modifier {string} is not active', (optionName, modifierName) => {
    ProductInfo.checkModifierOptionIsInactive(optionName, modifierName);
});

Then(/^The button add to cart is (enabled|disabled)$/, (status) => {
    if(status === "enabled") {
        ProductInfo.isAddToCartButtonEnabled();
    } else {
        ProductInfo.isAddToCartButtonDisabled();
    }
});

Then('The product price is {string}', (price) => {
    ProductInfo.priceIsEquals(price);
});

Then('The product weight is {string}', (weight) => {
    ProductInfo.weightIsEquals(weight);
});

Then('There is no modifier  in the page', () => {
    ProductInfo.pageHasNoModifiers();
});

When('I set the quantity to {int}', (quantity) => {
    ProductInfo.setProductQuantity(quantity);
});

And('I selected the option {string} for the modifier {string}', (optionName, modifierName) => {
    ProductInfo.selectModifierOption(optionName, modifierName);
});

When(/^The error message "([^"]*)" (doesn't|does) exists$/, function (message, status) {
    if(status === "does") {
        ProductInfo.errorMessageIsVisible(message);
    } else {
        ProductInfo.errorMessageIsNotVisible(message);
    }
});