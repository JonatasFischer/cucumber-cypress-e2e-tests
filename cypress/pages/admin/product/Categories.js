const CATEGORY_LINK = (name) => `td.categories_view_data > b > a:contains("${name}")`;
//div[data-config_value="BUTTON_PROPERTIES"]
const PRODUCT_LINK = (name) => `td.categories_view_data > b > a:contains("${title}")`;
const PRODUCT_ROW = (name) => `tr.dataTableRow > td > a:contains(${name})`;
const PRODUCT_ROW_UNIQUE = (name) => `tr.dataTableRow > td > a:contains(${name}):first`;
const PRODUCT_ACTIONS_BUTTON = () => `button > i.fa-caret-down`;
const PRODUCT_OPTIONS_LINK = () => `span[data-value="BUTTON_PROPERTIES"]`;
const PRODUCT_ATTRIBUTES_LINK = () => `span[data-value="BUTTON_EDIT_ATTRIBUTES"]`;
const PRODUCT_EDIT_LINK = () => `span[data-value="edit"]`;

export default class Categories {

    static editPropertiesForProduct(product) {

    }

    static visit() {
        //http://gxdev43.local/admin/categories.php
        cy.visit('/admin/categories.php?language=en')
            .waitDefaultAdminRequests()
            .route('GET', /(configurationKey=relatedProductActionDropdownBtn)/).as('relatedProductActionDropdownBtn')
            .route('GET', /(\/admin\/admin\.php\?do=ResponsiveFileManagerModuleCenterModule\/GetConfiguration)/).as('FileManagerGetConfiguration')
        // /admin/admin.php?do=ResponsiveFileManagerModuleCenterModule/GetConfiguration


    }

    static navigateCategory(categoryName) {
        cy.get(CATEGORY_LINK(categoryName))
            .should('exist')
            .click()
            .get('div.page-nav-title')
            .should('exist')
            .contains(categoryName);
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

    static navigateProductAttributes(productName) {
        cy.get(PRODUCT_ROW(productName))
            .parents('tr:first')
            .find(PRODUCT_ACTIONS_BUTTON())
            .click({force: true}).parents('div.product-dropdown-button:first').within(
            ($button) => {
                cy.get(PRODUCT_ATTRIBUTES_LINK()).click()
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

    static clickCreateProduct() {
        cy.get('div.create-new-container > div > button > i.fa-caret-down').parents('button:first').click({force: true})
        cy.get('div.create-new-container > div > ul > li > span:contains(product)').click()
            .waitDefaultAdminRequests()
            .wait('@relatedProductActionDropdownBtn')
            .wait('@FileManagerGetConfiguration')
    }

    static deleteProductsNamedAs(productName) {
        cy.get('body').then(($body)=>{
            if ($body.find(PRODUCT_ROW_UNIQUE(productName)).length > 0) {   //evaluates as true
                cy.get(PRODUCT_ROW_UNIQUE(productName)).parents('tr.dataTableRow')
                    .find('span.single-checkbox').scrollIntoView().click()
                    .then((elements) => {
                        cy.get('div[data-config_key="multiCategoryOverviewDropdownBtn"] > ul > li > span[data-value="delete"]').click({force: true})
                            .then(() => {
                                cy.waitDefaultAdminRequests()
                                    .get('div.ui-dialog-buttonset > button.btn-primary:contains("Delete")').click()
                                    .waitDefaultAdminRequests()
                                    .wait(3000)
                                    .then((obj) => {this.deleteProductsNamedAs(productName)})
                            //this.deleteProductsNamedAs(productName)
                        })

                    })
            }
        })

    }


}