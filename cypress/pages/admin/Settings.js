const CONFIGURATION_INPUT_CHECK = (name) => `li[data-title="${name}"] > div.configuration-item > label.gx-switcher > input[type="checkbox"]`;
const CONFIGURATION_CHECK_CLICK = (name) => `li[data-title="${name}"] > div.configuration-item > label.gx-switcher`;
const SAVE_BUTTON = () => `div.bottom-save-bar > button `;

export default class Settings {
    static visit() {
        cy.visit('/admin/configurations?language=en')
            .url()
            .should('include','/admin/configurations');
    }

    static checkParameter(name) {
        cy.get(CONFIGURATION_INPUT_CHECK(name)).should('exist').then((checkbox) => {
                if(!checkbox.is(':checked')) {
                    cy.get(CONFIGURATION_CHECK_CLICK(name)).scrollIntoView().then((label) => {
                        label.trigger("click")

                    });
                }
            });

    }
    static isParameterChecked(name) {
        cy.get(CONFIGURATION_INPUT_CHECK(name)).should('have.attr', 'checked');
    }

    static isParameterUnchecked(name) {
        cy.get(CONFIGURATION_INPUT_CHECK(name)).should('not.have.attr', 'checked');
    }

    static isSaveButtonActive() {
    }



    static uncheckParameter(name) {
        cy.get(CONFIGURATION_INPUT_CHECK(name)).should('exist').then((checkbox) => {
            if(checkbox.is(':checked')) {
                cy.get(CONFIGURATION_CHECK_CLICK(name)).scrollIntoView().then((label) => {
                    label.trigger("click")

                });
            }
        });
    }

    static saveButtonIsEnabled() {
        cy.get(SAVE_BUTTON()).should('exist').should('not.be.disabled')
    }

    static saveButtonIsDisabled() {
        cy.get(SAVE_BUTTON()).should('exist').should('be.disabled')
    }

    static clickSaveButton() {
        cy.get(SAVE_BUTTON()).should('exist').should('not.be.disabled').click();
    }
}