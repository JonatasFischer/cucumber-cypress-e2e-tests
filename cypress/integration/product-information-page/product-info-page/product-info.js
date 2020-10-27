import ProductInfo from './../../../pages/ProductInfo';
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';

Then('The product info page must be active', () => {
    ProductInfo.isActive();
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

And('There is a option {string} for the modifier {string}', (optionName, modifierName) => {
    ProductInfo.checkModifierOptionExists(optionName, modifierName);
});
And('There is no option {string} for the modifier {string}', (optionName, modifierName) => {
    ProductInfo.checkModifierOptionNotExists(optionName, modifierName);
});

And('The option {string} for the modifier {string} is active', (optionName, modifierName) => {
    ProductInfo.checkModifierOptionNotIsActive(optionName, modifierName);
});

And('The option {string} for the modifier {string} is not active', (optionName, modifierName) => {
    ProductInfo.checkModifierOptionIsInactive(optionName, modifierName);
});
/**
 When I selected the option "S" for the modifier "Größe"
 **/
When('I selected the option {string} for the modifier {string}', (optionName, modifierName) => {
    ProductInfo.selectModifierOption(optionName, modifierName);
});
And('I selected the option {string} for the modifier {string}', (optionName, modifierName) => {
    ProductInfo.selectModifierOption(optionName, modifierName);
});
