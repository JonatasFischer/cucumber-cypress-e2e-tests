export default class Admin {
    static login() {
        cy.server()
            .route('POST', '**/survey_questions').as('survey')
            .route('POST', /(\/admin\/admin\.php\?)/).as('AdminPost')
            .route('GET', /(\/admin\/admin\.php\?)/).as('AdminGet')
            .route('GET',/(\/admin\/request_port\.php\?)/).as('AdminRequestPortGet')
            .route('GET',/(\/admin\/admin\.php\?do=DirectHelpProxy)/).as('DirectHelpProxy')///admin/admin.php?do=DirectHelpProxy
            .route('GET',"/admin/admin.php?do=SessionTimeoutAjax").as('SessionTimeoutAjax')
            .route('GET',"/admin/admin.php?do=DynamicShopMessages").as('DynamicShopMessages')
            .route('GET',"/admin/admin.php?do=AdminInfoBoxAjax/GetAllMessages").as('GetAllMessages')
            .route('POST',/(\/admin\/request_port\.php\?)/).as('AdminRequestPortPost')



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