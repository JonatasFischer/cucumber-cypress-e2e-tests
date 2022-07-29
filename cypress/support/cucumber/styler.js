const getHead = () => Cypress.$(parent.window.document.head)
const isStyleLoaded = $head => $head.find('#cucumber-cypress-styler').length > 0

function loadCustomStyle (){
    const $head = getHead()
    if (isStyleLoaded($head)) {
        return
    }
    const themeFilename = `cypress/support/cucumber/styler.css`
    cy.readFile(themeFilename, {log: false})
        .then(css => {
            $head.append(`<style id="cucumber-cypress-styler">\n${css}</style>`
            )
        })
}
before(loadCustomStyle)

