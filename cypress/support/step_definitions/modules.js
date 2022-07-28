import {Given} from '@badeball/cypress-cucumber-preprocessor';
import Modules from "../../pages/admin/Modules";
import Admin from "../../pages/admin/Admin";


Given('I have the module {string} installed', (moduleName) => {
    Admin.login();
    Modules.visit();
    Modules.installModule(moduleName)
});