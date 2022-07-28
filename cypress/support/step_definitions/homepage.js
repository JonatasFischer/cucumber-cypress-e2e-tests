import Homepage from '../pages/Homepage';
import {Given, Then, When} from '@badeball/cypress-cucumber-preprocessor';

Given('I am on the homepage', () => {
    Homepage.visit();
});

When('I clicked in the product {string}', (product) => {
    Homepage.clickInProduct(product);
});

Then('The product {string} should be visible', (product) => {
    Homepage.productIsVisible(product);
});