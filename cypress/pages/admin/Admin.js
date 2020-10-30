export default class Admin {
    static login() {
        cy.server()
        cy.route('POST', '**/survey_questions').as('survey');
        cy.url().then((curUrl) => {
            if (curUrl.indexOf('/admin/') === -1) {
                cy.visit('/admin/?language=en').url().then((url) => {
                    if (url.indexOf('/admin/') === -1) {
                        cy.visit('/login_admin.php')
                            .get('input[name="email_address"]')
                            .type(Cypress.env('ADMIN_EMAIL'))
                            .get('input[name="password"]')
                            .type(Cypress.env('ADMIN_PWD'))
                            .get('button[type="submit"]').click()
                            .wait('@survey')
                            .url().should('include', '/admin/')

                    }
                });
            }
        });
    }
}