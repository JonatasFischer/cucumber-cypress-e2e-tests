/*------------------------------------------------------------------------------
 - PackinUnit.js 2020-12-04
 - Gambio GmbH
 - http://www.gambio.de
 - Copyright (c) 2020 Gambio GmbH
 - Released under the GNU General Public License (Version 2)
 - [http://www.gnu.org/licenses/gpl-2.0.html]
 -----------------------------------------------------------------------------*/

export default class PackingUnit {
	static visit() {
		cy.visit('/admin/admin.php?do=VPE');
	}
	
	static isActive() {
		cy.url().should('include', '/admin/admin.php?do=VPE')
	}
	
	static deletePackingUnitIfExists(name) {
		this.visit();
		cy.get('body').then((body) => {
			if (body.find(`tr[data-title="${name}"]`).length > 0) {
				cy.get(`tr[data-title="${name}"]:first`).should('be.visible')
					.find('i.fa.fa-trash-o.delete:first').scrollIntoView()
					.invoke('show')
					.click({force: true}).wait(500).then(() => {
					cy.get('#remove-vpe')
						.click({force: true}).wait(1000)
						.then((obj) => {
							this.deletePackingUnitIfExists(name)
						});
				})
			}
			
		})
	}
	
	static clickAddBagButton() {
		cy.get('#add-vpe').click().wait('@AdminPost');
	}
	
	static clickSaveButton() {
		cy.get('#create-vpe').click();
	}
	
	static checkPackingUnitExists(name) {
		this.visit();
		cy.get(`tr[data-title="${name}"]`).should('exist');
	}
	
	static fillNameField(name, language) {
		cy.get(`#input-${language.toUpperCase()}`).type(name);
	}
}
