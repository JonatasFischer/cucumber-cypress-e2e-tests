export default class Admin {
    static login() {
        cy.intercept('POST', '**/survey_questions').as('survey')
            .intercept('POST', /(\/admin\/admin\.php\?)/).as('AdminPost')
            .intercept('GET', /(\/admin\/admin\.php\?)/).as('AdminGet')
            .intercept('GET',/(\/admin\/request_port\.php\?)/).as('AdminRequestPortGet')
            .intercept('GET',/(\/admin\/admin\.php\?do=DirectHelpProxy)/).as('DirectHelpProxy')///admin/admin.php?do=DirectHelpProxy
            .intercept('GET',"/admin/admin.php?do=SessionTimeoutAjax").as('SessionTimeoutAjax')
            .intercept('GET',"/admin/admin.php?do=DynamicShopMessages").as('DynamicShopMessages')
            .intercept('GET',"/admin/admin.php?do=AdminInfoBoxAjax/GetAllMessages").as('GetAllMessages')
            .intercept('POST',/(\/admin\/request_port\.php\?)/).as('AdminRequestPortPost')



        cy.visit('/admin/?language=en').url().then((curUrl) => {
            if (curUrl.indexOf('/admin/') === -1) {
                cy.visit('/login_admin.php')
                            .get('input[name="email_address"]')
                            .type(Cypress.env('ADMIN_EMAIL'))
                            .get('input[name="password"]')
                            .type(Cypress.env('ADMIN_PWD'))
                            .get('button[type="submit"]').click()
                            .wait('@survey')
                            .url().should('include', '/admin/').visit('/admin/?language=en').wait('@survey')

                    }
                });
            }
}