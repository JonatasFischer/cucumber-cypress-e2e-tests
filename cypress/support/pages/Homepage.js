const PRODUCT_LINK = (title) => `a:visible[title="${title}"]`;

export default class Homepage {
    static visit() {
        cy.server().route('POST', '**CartDropdown').as('CartDropdown').visit('/en');

    }

    static type(query) {
        cy.get(SEARCH_FIELD) // 2 seconds
            .type(query);
    }

    static productIsVisible(product) {
        cy.get(PRODUCT_LINK(product)).should('exist');
    }

    static clickInProduct(product) {
        cy.get(PRODUCT_LINK(product)).first().click();
    }
}