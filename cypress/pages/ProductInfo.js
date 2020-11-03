const PRODUCT_TITLE = () => `h1.product-info-title-desktop`;

const MODIFIER_GROUP_LABEL = (modifierName) => `label.modifier-label:contains(${modifierName}:)`;

const MODIFIER_OPTION = (optionName) => `div.modifier-content > select > option:contains(${optionName})`;
const MODIFIER_OPTION_SELECT = () => `div.modifier-content > select`;

export default class ProductInfo {

    static isActive() {
        //here we wait in order to make sure that chrome runs all the page events and module register
        cy.url().should('include', '/product_info.php')
        cy.server();
        cy.route('GET', '/shop.php?do=CheckStatus/Attributes**').as('CheckStatusAttributes');
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
        cy.get(MODIFIER_GROUP_LABEL(modifierName)).parents('div.modifier-group:first').within((obj)=> {


            cy.get(MODIFIER_OPTION_SELECT()).scrollIntoView().select(optionName).wait('@CheckStatusAttributes');
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
        cy.get(`div.cart-error-msg:contains(${message})`).should('not.be.visible');
    }

    static errorMessageIsVisible(message) {
        cy.get(`div.cart-error-msg:contains(${message})`).should('be.visible');
    }

    static isAddToCartButtonDisabled() {
        cy.get(`button[name="btn-add-to-cart"]`).should('not.be.enabled');
    }
    static isAddToCartButtonEnabled() {
        cy.get(`[name="btn-add-to-cart"]`).should('be.visible').should('be.enabled');
    }
    static priceIsEquals(price) {
        cy.get(`div.current-price-container`).should($el => expect($el.text().trim()).to.equal(price));
    }
    static weightIsEquals(weight) {
        cy.get(`dd.products-details-weight-container >span`).should($el => expect($el.text().trim()).to.equal(weight));
    }

    static pageHasNoModifiers() {
        cy.get('div.modifiers-selection').should('not.visible')
    }

    static setProductQuantity(quantity) {
        cy.get('#attributes-calc-quantity').clear().type(quantity).wait('@CheckStatusAttributes')
    }

    static errorMessageDoesntExist(message) {
        cy.get(`div.cart-error-msg:contains(${message})`).should('not.exist');
    }

    static errorMessageExist(message) {
        cy.get(`div.cart-error-msg:contains(${message})`).should('exist');
    }

    static checkModifierOptionSelected(optionName, modifierName) {
        cy.get(MODIFIER_GROUP_LABEL(modifierName)).parent().find(MODIFIER_OPTION(optionName)).should('be.selected');
    }
}