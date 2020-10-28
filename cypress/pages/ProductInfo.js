const PRODUCT_TITLE = () => `h1.product-info-title-desktop`;

const MODIFIER_GROUP_LABEL = (modifierName) => `label.modifier-label:contains(${modifierName}:)`;

const MODIFIER_OPTION = (optionName) => `div.modifier-content > select > option:contains(${optionName})`;
const MODIFIER_OPTION_SELECT = () => `div.modifier-content > select`;

export default class ProductInfo {

    static isActive() {
        //here we wait in order to make sure that chrome runs all the page events and module register
        cy.wait(3000).url().should('include', '/product_info.php')
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
        cy.wait(2000).get(MODIFIER_GROUP_LABEL(modifierName)).parent().find(MODIFIER_OPTION(optionName)).should('be.disabled');
    }

    static selectModifierOption(optionName, modifierName) {
        cy.get(MODIFIER_GROUP_LABEL(modifierName)).parents('div.modifier-group:first').within((obj)=> {
            cy.get(MODIFIER_OPTION_SELECT()).select(optionName).trigger("change");
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

    static isAddToCartButtonDisabled(message) {
        cy.get(`button.btn-add-to-cart`).should('not.be.enabled');
    }
    static isAddToCartButtonEnabled(message) {
        cy.get(`button.btn-add-to-cart`).should('be.enabled');
    }
}