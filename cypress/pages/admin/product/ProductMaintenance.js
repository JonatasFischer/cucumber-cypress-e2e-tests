
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
        cy.get('button[type="submit"][title="Save"]').should('exist').click({force: true});
    }

    static setQuantity(quantity) {
        cy.get('input[type="text"][name="products_quantity"]').should('exist').clear().type(quantity);
    }
}