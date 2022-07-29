import {Given} from '@badeball/cypress-cucumber-preprocessor';
import Admin from '../../page_objects/admin/Admin';

Given('I am logged in the backend admin', () => {
    Admin.login();
});
