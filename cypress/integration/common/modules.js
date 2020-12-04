import {Given, Then} from 'cypress-cucumber-preprocessor/steps';
import Modules from "../../pages/admin/Modules";
import Attributes from "../../pages/admin/Attributes";
import Admin from "../../pages/admin/Admin";


Given('I have the module {string} installed', (moduleName) => {
    Modules.visit();
    Modules.installModule(moduleName)
});