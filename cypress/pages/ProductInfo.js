const PRODUCT_TITLE = () => `h1.product-info-title-desktop`;

const MODIFIER_GROUP = (modifierName) => `label.modifier-label:contains(${modifierName}:)`;

const MODIFIER_OPTION = (optionName) => `div.modifier-content > select > option:contains(${optionName})`;
const MODIFIER_OPTION_SELECT = () => `div.modifier-content > select`;

export default class ProductInfo {

    static isActive() {
        cy.url().should('include', '/product_info.php')
    }

    static titleIsEqual(product) {
        cy.get(PRODUCT_TITLE()).should('exist').contains(product);
    }

    static checkModifierExists(modifierName) {
        cy.get(MODIFIER_GROUP(modifierName)).should('exist');
    }

    static checkModifierOptionExists(optionName, modifierName) {
        cy.get(MODIFIER_GROUP(modifierName)).parent().find(MODIFIER_OPTION(optionName)).should('exist');

    }

    static checkModifierOptionNotExists(optionName, modifierName) {
        cy.get(MODIFIER_GROUP(modifierName)).parent().find(MODIFIER_OPTION(optionName)).should('not.exist');
    }

    static checkModifierOptionNotIsActive(optionName, modifierName) {
        cy.get(MODIFIER_GROUP(modifierName)).parent().find(MODIFIER_OPTION(optionName)).should('be.enabled');
    }

    static checkModifierOptionIsInactive(optionName, modifierName) {
        cy.get(MODIFIER_GROUP(modifierName)).parent().find(MODIFIER_OPTION(optionName)).should('be.disabled');
    }

    static selectModifierOption(optionName, modifierName) {
        cy.get(MODIFIER_GROUP(modifierName)).parent().find(MODIFIER_OPTION_SELECT()).select(optionName).trigger("change").wait(1000);
    }

}