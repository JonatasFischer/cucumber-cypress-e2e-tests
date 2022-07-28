import {And, Given, Then, When} from '@badeball/cypress-cucumber-preprocessor';
import Admin from "../../pages/admin/Admin";
import Settings from "../../pages/admin/Settings";

Given("I'm at the settings page", () => {
    Admin.login();
    Settings.visit()
});
When('I check the parameter {string}', (configuration) => {
    Settings.checkParameter(configuration)
});

When('I uncheck the parameter {string}', (configuration) => {
    Settings.uncheckParameter(configuration)
});
Then('The save button is enabled', () => {
    Settings.saveButtonIsEnabled()
});
Then('The save button is disabled', () => {
    Settings.saveButtonIsDisabled()
});

Then('I click in the save button', () => {
    Settings.clickSaveButton()
});


And('I have the following parameters configured in the settings page', (datatable) => {
    Settings.visit()
    datatable.rawTable.forEach((item, index) => {
        if (item[1] === 'checked') {
            Settings.uncheckParameter(item[0]);
            Settings.checkParameter(item[0]);
        } else {
            Settings.checkParameter(item[0]);
            Settings.uncheckParameter(item[0]);
        }
    })
    Settings.clickSaveButton()
    Settings.saveButtonIsDisabled()
});
