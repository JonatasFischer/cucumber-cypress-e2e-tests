export default class Modules {
    static visit() {
        cy.visit('/admin/admin.php?do=ModuleCenter')
        ///admin/admin.php?do=ModuleCenter/GetData&module=ProductAttributes
            .intercept('GET',/(\/admin\/admin\.php\?do=ModuleCenter\/GetData&module=ProductAttributes)/).as('ModuleCenterGetData')
    }

    static installModule(name){
        //'Product Options'
        cy.get(`td:contains("${name}")`).click().waitModuleRequests().wait(500).get('button[name="install"][value="install"]').then((button) =>{
            if(button.is(':visible')){
                cy.get('button[name="install"][value="install"]').click().waitModuleRequests();
            }
        })
    }
}
