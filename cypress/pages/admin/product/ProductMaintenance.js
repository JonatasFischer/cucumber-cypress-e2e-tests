
//div[data-config_value="BUTTON_PROPERTIES"]
const PRODUCT_LINK = (name) => `td.categories_view_data > b > a:contains("${title}")`;
const PRODUCT_ROW = (name) => `tr.dataTableRow > td > a:contains(${name})`;
const PRODUCT_ACTIONS_BUTTON = () => `button > i.fa-caret-down`;
const PRODUCT_OPTIONS_LINK = () => `span[data-value="BUTTON_PROPERTIES"]`;
export default class ProductMaintenance {
    static isActive() {
        cy.url().should('include', '/admin/categories.php').should('include', 'action=new_product')
    }

    static save() {
        cy.get('button[type="submit"][title="Save"]').should('exist').click({force: true})
            .wait('@AdminRequestPortGet')
            .wait('@DirectHelpProxy')
            .wait('@SessionTimeoutAjax')
            .wait('@DynamicShopMessages')
        ;
    }

    static setQuantity(quantity) {
        cy.get('input[type="text"][name="products_quantity"]').should('exist').clear().type(quantity);
    }

    static checkField(fieldLabel) {
        cy.get(`div.control-group > div > label:contains(${fieldLabel})`)
            .parents('div.control-group:first')
            .should('exist')
            .within((parent)=> {

            cy.get(`input[type="checkbox"]`).should('exist').then((checkbox) => {
                if(!checkbox.is(':checked')) {
                    cy.get('div.switcher').click().wait('@FileManagerGetConfiguration');
                }
            });


        });
    }

    static fillProdudctName(language, text) {
        //"div.frame-wrapper > div.frame-head > label > span.flag-icon-de"
        cy.get(`div.frame-wrapper > div.frame-head > label > span.flag-icon-${language}`)
            .parents('div.frame-wrapper:first')
            .within((element) => {
                cy.get('input[name*="products_name"]').type(text)
        })

    }

    static setPrice(price) {
        cy.get(`input[name="products_price"]`).clear().type(price)
    }


}