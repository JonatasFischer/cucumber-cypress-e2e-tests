const PRODUCT_TITLE = () => `h1.product-info-title-desktop`;

const MODIFIER_GROUP_LABEL = (modifierName) => `label.modifier-label:contains(${modifierName}:)`;

const MODIFIER_OPTION = (optionName) => `div.modifier-content > select > option:contains(${optionName})`;
const MODIFIER_OPTION_SELECT = () => `div.modifier-content > select`;

export default class ProductInfo {
	
	static isActive() {
		//here we wait in order to make sure that chrome runs all the page events and module register
		cy.intercept('GET', /(\/shop.php\?do=CheckStatus)/).as('CheckStatus');
		cy.url().should('include', '/product_info.php').wait(2000);
		
		
	}
	
	static titleIsEqual(product) {
		cy.get(PRODUCT_TITLE()).should('exist').contains(product);
	}
	
	static checkModifierExists(modifierName) {
		cy.get(MODIFIER_GROUP_LABEL(modifierName)).should('exist');
	}
	
	static checkModifierOptionExists(optionName, modifierName) {
		cy.get(MODIFIER_GROUP_LABEL(modifierName)).parent().find(MODIFIER_OPTION(optionName)).should('exist');
		
	}
	
	static checkModifierOptionNotExists(optionName, modifierName) {
		cy.get(MODIFIER_GROUP_LABEL(modifierName)).parent().find(MODIFIER_OPTION(optionName)).should('not.exist');
	}
	
	static checkModifierOptionNotIsActive(optionName, modifierName) {
		cy.get(MODIFIER_GROUP_LABEL(modifierName)).parent().find(MODIFIER_OPTION(optionName)).should('be.enabled');
	}
	
	static checkModifierOptionIsInactive(optionName, modifierName) {
		cy.get(MODIFIER_GROUP_LABEL(modifierName)).parent().find(MODIFIER_OPTION(optionName)).should('be.disabled');
	}
	
	static selectModifierOption(optionName, modifierName) {
		cy.get(MODIFIER_GROUP_LABEL(modifierName)).parents('div.modifier-group:first').within((obj) => {
			
			
			cy.wait(500).get(MODIFIER_OPTION_SELECT()).scrollIntoView().select(optionName).wait('@CheckStatus');
			//this 1 second wait is to be sure that the browser had time enough to update the dom
			//cy..wait(1000);
		})
		/*        cy.window().then((wnd)=> {
					debugger;
				})
		
		 */
	}
	
	static checkModifierNotExists(modifierName) {
		cy.get(MODIFIER_GROUP_LABEL(modifierName)).should('not.exist');
	}
	
	static errorMessageIsNotVisible(message) {
		cy.get(`div.cart-error-msg:contains(${message})`).should('not.exist');
	}
	
	static errorMessageIsVisible(message) {
		cy.get(`div.cart-error-msg:contains(${message})`).should('be.visible');
	}
	
	static isAddToCartButtonDisabled() {
		cy.get(`[name="btn-add-to-cart"]`).should('be.visible').should('not.be.enabled');
	}
	
	static isAddToCartButtonEnabled() {
		cy.get(`[name="btn-add-to-cart"]`).should('be.visible').should('be.enabled');
	}
	
	static priceIsEquals(price) {
		cy.get(`div.current-price-container`).should($el => {
			let newEl = $el.clone();
			newEl.children("span").remove();
			let text = newEl.text().trim();
			return expect(text.trim()).to.equal(price)
		});
	}
	
	static weightIsEquals(weight) {
		
		cy.get(`dd.products-details-weight-container >span`).should($el => expect($el.text().trim()).to.equal(weight));
	}
	
	static modelIsEquals(model) {
		cy.get(`dd.model-number-text`).should($el => expect($el.text().trim()).to.equal(model));
	}
	
	static pageHasNoModifiers() {
		cy.get('div.modifiers-selection').should('not.visible')
	}
	
	static setProductQuantity(quantity) {
		cy.get('#attributes-calc-quantity').clear().type(quantity).wait('@CheckStatus')
	}
	
	static errorMessageDoesntExist(message) {
		if (!message) {
			cy.get(`div.cart-error-msg`).should('not.be.visible');
		} else {
			cy.get(`div.cart-error-msg:contains(${message})`).should('not.exist');
		}
	}
	
	static errorMessageExist(message) {
		cy.get(`div.cart-error-msg:contains(${message})`).should('exist');
	}
	
	static checkModifierOptionSelected(optionName, modifierName) {
		cy.get(MODIFIER_GROUP_LABEL(modifierName)).parent().find(MODIFIER_OPTION(optionName)).should('be.selected');
	}
	
	static vpeIsEquals(vpeValue) {
		cy.get(`span.gm_products_vpe`).should('be.visible').should($el => {
			let text = $el.text().trim();
			return expect(text.trim()).to.equal(vpeValue)
		});
	}
	
	static clickOnAddToCartButton() {
		cy.get('body').then(($body)=>{
			debugger;
			$body.find(`[name=btn-add-to-cart]`).click();
		});
	}
}