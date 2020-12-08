/*------------------------------------------------------------------------------
 - ShoppingCart.js 2020-12-07
 - Gambio GmbH
 - http://www.gambio.de
 - Copyright (c) 2020 Gambio GmbH
 - Released under the GNU General Public License (Version 2)
 - [http://www.gnu.org/licenses/gpl-2.0.html]
 -----------------------------------------------------------------------------*/

export default class ShoppingCart {
	static visit() {
		cy.visit('/shopping_cart.php');
	}
	
	static isActive() {
		cy.url().should('include', '/shopping_cart.php')
	}
	
	static errorMessageDoesntExist(message) {
		if (!message) {
			cy.get(`div.cart-error-msg`).should('not.exist');
		} else {
			cy.get(`div.cart-error-msg:contains(${message})`).should('not.exist');
		}
	}
	
	static errorMessageExist(message) {
		cy.get(`div.cart-error-msg:contains(${message})`).should('exist');
	}

	static warningMessageExist(message) {
		cy.get(`div.alert.alert-warning:contains(${message})`).should('exist');
	}

	static clear() {
		cy.get('body').then((body) => {
			if (body.find(`a[title="Delete"]`).length > 0) {
				cy.get(`a[title="Delete"]:first`).should('be.visible').click({force: true}).wait(500).then(() => {
					this.clear()
				});
			}
			
		})
	}
}