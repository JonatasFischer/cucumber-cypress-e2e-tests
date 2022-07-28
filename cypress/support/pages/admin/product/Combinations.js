const GET_SELECT_ROW = (name) => `td.categories_view_data > b > a:contains("${name}")`;
export default class Combinations {
    static isActive() {
        cy.url().should('include', '/admin/properties_combis.php?products_id')
    }

    static setSettings(label, value) {
        cy.get('div.lightbox_combis_settings_content').within(() => {
            cy.get(`label:contains(${label})`).parents('div.row:first').within(() => {
                cy.get('select').select(value)
            })
        })
    }

    static openSettingsModal() {
        cy.get('#settings > a').click();
    }
    static saveSettingsModal() {
        cy.get('div.lightbox_combis_settings_content').parents('div.lightbox_content_container:first').within(() => {
            cy.get('div.button_right_container > a').click();
        })
    }

    static editCombination(combination) {
        cy.get(`td.properties_table_artnr:contains(${combination})`).parents('tr.box_properties_combis_row:first').within(() => {
            cy.get('a.button_propertie_combi_edit').click();
        })

    }

    static setCombinationQuantity(quantity) {
        cy.get('#combi_quantity').clear().type(quantity)
    }

    static saveCombination() {
        cy.server();
        //GET (canceled) /admin/request_port.php?module=PropertiesCombisAdmin&action=load&template=combis_table&combis_id=1&products_id=1
        cy.get('div.lightbox_properties_combis_edit').parents('div.lightbox_content_container:first').within(() => {
            cy.route('GET', '**module=PropertiesCombisAdmin&action=load**').as('PropertiesCombisAdminActionLoad');
            cy.route('POST', '**/admin/request_port.php?module=PropertiesCombisAdmin&action=save&type=combis**').as('PropertiesCombisAdminActionPOST');
            cy.get('div.button_right_container > a.save_close').click();
            cy.wait('@PropertiesCombisAdminActionPOST')
            cy.wait('@PropertiesCombisAdminActionLoad')
        })

    }
}