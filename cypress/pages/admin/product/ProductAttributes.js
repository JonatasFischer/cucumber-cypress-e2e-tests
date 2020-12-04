export default class ProductAttributes {
    static visit() {
        cy.visit('/admin/products_attributes.php')
    }

    static save() {
        cy.get('div.bottom-save-bar > input[value="Save"]').click()
    }

    static clickLoadOptions(attributeName) {
          cy.get(`table[data-title="${attributeName}"]`).within(($table) => {
            cy.get('a.addValues').click()
          })
    }
    static configureOption(attributeName, optionName, config) {
          cy.get(`tr[data-title="${attributeName}"][data-value-title="${optionName}"]`).within(($table) => {
              if(config.checked !== undefined) {
                  if (config.checked) {
                      cy.get('input[name="optionValues[]"]').check()
                  } else {
                      cy.get('input[name="optionValues[]"]').uncheck()
                  }
              }
              if(config.sort_order !== undefined)
                  cy.get('input[name*="_sortorder"]').clear().type(config.sort_order)

              if(config.attribute_model !== undefined)
                  cy.get('input[name*="_model"]').clear().type(config.attribute_model)

              if(config.ean !== undefined)
                  cy.get('input[name*="_gm_ean"]').clear().type(config.ean)

              if(config.stock !== undefined)
                  cy.get('input[name*="_stock"]').clear().type(config.stock)

              if(config.vpe_value !== undefined)
                  cy.get('input[name*="_vpe_value"]').clear().type(config.vpe_value)

              if(config.vpe !== undefined)
                  cy.get('select[name*="_vpe_id"]').select(config.vpe)

              if(config.weight !== undefined)
                  cy.get('input[name*="_weight"]').clear().type(config.weight)

              if(config.weight_prefix !== undefined)
                  cy.get('select[name*="_weight_prefix"]').select(config.weight_prefix)

              if(config.price !== undefined)
                  cy.get('input[name*="_price"]').clear().type(config.price)

              if(config.price_prefix !== undefined)
                  cy.get('input[name*="_price"]').parent().find('select[name*="_prefix"]').select(config.price_prefix)

          });
    }
    static setOptionStock(attributeName, optionName) {
          cy.get(`tr[data-title="${attributeName}"][data-value-title="${optionName}"]`).within(($table) => {
            cy.get('input[name="optionValues[]"]').check()
          });
    }
}