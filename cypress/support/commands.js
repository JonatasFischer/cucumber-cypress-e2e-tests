Cypress.Commands.add('waitDefaultAdminRequests', () => {
   return cy.wait(['@DirectHelpProxy','@DynamicShopMessages','@AdminRequestPortGet'])
})

Cypress.Commands.add('waitModuleRequests', () => {
   return cy.wait(['@DynamicShopMessages','@GetAllMessages', '@ModuleCenterGetData'])
})

