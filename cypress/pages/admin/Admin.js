export default class Admin {
    static login() {
        cy.visit('/en');
        cy.url().then((curUrl) => {
            if (curUrl.indexOf('/admin/') === -1) {
                cy.visit('/admin/?language=en');
                cy.url().then((url) => {
                    if (url.indexOf('/admin/') === -1) {
                        cy.visit('/login.php');
                        cy.get('#login-email_address').type(Cypress.env('ADMIN_EMAIL'))
                        cy.get('#login-password').type(Cypress.env('ADMIN_PWD'))
                        cy.get('.login-buttons > input[type="submit"]').click();
                        cy.visit('/admin/');
                        cy.url().should('include', '/admin/')
                    }
                });
            }
        });
    }
}