const CATEGORY_LINK = (name) => `td.categories_view_data > b > a:contains("${name}")`;
//div[data-config_value="BUTTON_PROPERTIES"]
const PRODUCT_LINK = (name) => `td.categories_view_data > b > a:contains("${title}")`;
const PRODUCT_ROW = (name) => `tr.dataTableRow > td > a:contains(${name})`;
const PRODUCT_ACTIONS_BUTTON = () => `button > i.fa-caret-down`;
const PRODUCT_OPTIONS_LINK = () => `span[data-value="BUTTON_PROPERTIES"]`;
const PRODUCT_EDIT_LINK = () => `span[data-value="edit"]`;

export default class Categories {

    static editPropertiesForProduct(product) {

    }

    static visit() {
        //http://gxdev43.local/admin/categories.php
        cy.visit('/admin/categories.php');
    }

    static navigateCategory(categoryName) {
        cy.get(CATEGORY_LINK(categoryName)).should('exist').click();
        cy.get('div.page-nav-title').should('exist').contains(categoryName);
    }


    static navigateProductOptions(productName) {
        cy.get(PRODUCT_ROW(productName))
            .parents('tr:first')
            .find(PRODUCT_ACTIONS_BUTTON())
            .click({force: true}).parents('div.product-dropdown-button:first').within(
            ($button) => {
                cy.get(PRODUCT_OPTIONS_LINK()).click()
            }

        );
    }


    static navigateProduct(productName) {
        cy.get(PRODUCT_ROW(productName))
            .parents('tr:first')
            .find(PRODUCT_ACTIONS_BUTTON())
            .click({force: true}).parents('div.product-dropdown-button:first').within(
            ($button) => {
                cy.get(PRODUCT_EDIT_LINK()).click()
            }

        );
    }
}