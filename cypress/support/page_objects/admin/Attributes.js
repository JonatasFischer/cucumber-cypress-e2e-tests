export default class Attributes {
    static visit() {
        cy.visit('/admin/products_attributes.php')
    }

    static deleteOption(name) {
        cy.get('body').then((body) => {
            if(body.find(`a[data-option-title="${name}"]`).length > 0) {
                cy.get(`a[data-option-title="${name}"]:first`).click({force:true}).waitDefaultAdminRequests().get('#confirm_option_delete').click().then(()=>this.deleteOption(name));
            }
        });
    }

    static typeOptionName(name, language) {
        cy.get(`#new-option-name-${language}`).type(name);
    }

    static typeOptionValueName(name, language) {
        cy.get(`#new-option-value-name-${language}`).type(name);
    }

    static selectOption(option) {
        cy.get(`select[name='option_id']`).select(option);
    }

    static clickInsertOption() {
        cy.get(`#insert-new-option`).click();
    }

    static clickInsertOptionValue() {
        cy.get(`#insert-new-option-value`).click();
    }
}
