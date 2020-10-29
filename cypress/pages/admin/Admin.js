export default class Admin {
    static login() {
        cy.server()
        cy.route('POST', '**CartDropdown').as('CartDropdown');
        cy.visit('/en');
        cy.wait('@CartDropdown');
        cy.url().then((curUrl) => {
            if (curUrl.indexOf('/admin/') === -1) {
                cy.visit('/admin/?language=en');
                cy.url().then((url) => {
                    if (url.indexOf('/admin/') === -1) {
                        cy.visit('/login.php');
                        cy.wait('@CartDropdown');
                        cy.get('#login-email_address').type(Cypress.env('ADMIN_EMAIL'))
                        cy.get('#login-password').type(Cypress.env('ADMIN_PWD'))
                        cy.get('.login-buttons > input[type="submit"]').click();
                        cy.wait('@CartDropdown');
                        cy.route('POST', '**/survey_questions').as('survey');
                        cy.visit('/admin/');
                        cy.wait('@survey');
                        cy.url().should('include', '/admin/')
                    }
                });
            }
        });
    }
}