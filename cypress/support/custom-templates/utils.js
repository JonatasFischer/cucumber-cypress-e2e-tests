const getHead = () => Cypress.$(parent.window.document.head)
const isStyleLoaded = $head => $head.find('#cucumber-cypress-styler').length > 0

const shouldStubMediaQuery = () => Boolean(Cypress.config('darkMediaQuery'))

/**
 * returns a function that a `before` callback can call to load desired theme
 * @example before(toLoadTheme('halloween'))
 */
const loadCustomCss = () => {
    return () => {
        const $head = getHead()
        if (isStyleLoaded($head)) {
            return
        }

        const themeFilename = `cypress/support/custom-templates/sample.css`

        cy.readFile(themeFilename, {log: false})
            .then(css => {
                debugger
                $head.append(
                    `<style type="text/css" id="cucumber-cypress-styler">\n${css}</style>`
                )
            })
    }
}

module.exports = {
    loadCustomCss
}
