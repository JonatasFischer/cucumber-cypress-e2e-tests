/*------------------------------------------------------------------------------
 - shoppingCart.js 2020-12-07
 - Gambio GmbH
 - http://www.gambio.de
 - Copyright (c) 2020 Gambio GmbH
 - Released under the GNU General Public License (Version 2)
 - [http://www.gnu.org/licenses/gpl-2.0.html]
 -----------------------------------------------------------------------------*/

import ShoppingCart from './../../pages/ShoppingCart';
import {Given, Then} from 'cypress-cucumber-preprocessor/steps';
import ProductInfo from '../../pages/ProductInfo'

Given('The shopping cart is empty', () => {
	ShoppingCart.visit();
	ShoppingCart.clear();
});

Then('There is no error message in the shopping cart', () => {
	ShoppingCart.errorMessageDoesntExist('');
});
Then('There is an error message {string} in the shopping cart', (message) => {
	ShoppingCart.errorMessageExist(message);
});
Then('There is a warning message {string} in the shopping cart', (message) => {
	ShoppingCart.warningMessageExist(message);
});
Then('I visit the shopping cart', () => {
	ShoppingCart.visit();
});
Then('The shopping cart is presented', () => {
	ShoppingCart.isActive();
});
