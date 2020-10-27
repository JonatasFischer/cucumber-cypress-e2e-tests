const CONFIGURATION_LABEL = (name) => `li.configuration > span.label > span:contains(${name})`;
const CONFIGURATION_INPUT_CHECK = () => `div.configuration-item > label.gx-switcher > input[type="checkbox"]`;
const CONFIGURATION_CHECK_CLICK = () => `div.configuration-item > label.gx-switcher`;
const SAVE_BUTTON = () => `div.bottom-save-bar > div.vue-portal-target > button `;

export default class Settings {
    static visit() {
        cy.visit('/admin/configurations');
        cy.url().should('include','/admin/configurations');
    }

    static checkParameter(name) {
        cy.get(CONFIGURATION_LABEL(name)).should('exist').closest('li')
            .find(CONFIGURATION_INPUT_CHECK()).then((checkbox) => {
                if(!checkbox.is(':checked')) {
                    cy.get(CONFIGURATION_LABEL(name)).closest('li').find(CONFIGURATION_CHECK_CLICK()).then((label) => {
                        label.trigger("click")

                    });
                }
            });

    }
    static isParameterChecked(name) {
        cy.get(CONFIGURATION_LABEL(name)).should('exist').closest('li')
            .find(CONFIGURATION_INPUT_CHECK()).should('have.attr', 'checked');
    }

    static isParameterUnchecked(name) {
        cy.get(CONFIGURATION_LABEL(name)).should('exist').closest('li')
            .find(CONFIGURATION_INPUT_CHECK()).should('not.have.attr', 'checked');
    }

    static isSaveButtonActive() {
    }



    static uncheckParameter(name) {
        cy.get(CONFIGURATION_LABEL(name)).should('exist').closest('li')
            .find(CONFIGURATION_INPUT_CHECK()).then((checkbox) => {
            if(checkbox.is(':checked')) {
                cy.get(CONFIGURATION_LABEL(name)).closest('li').find(CONFIGURATION_CHECK_CLICK()).then((label) => {
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