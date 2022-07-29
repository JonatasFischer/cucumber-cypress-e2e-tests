import {Given} from '@badeball/cypress-cucumber-preprocessor';
import Modules from "../../page_objects/admin/Modules";
import Admin from "../../page_objects/admin/Admin";


Given('I have the module {string} installed', (moduleName) => {
    Admin.login();
    Modules.visit();
    Modules.installModule(moduleName)
});