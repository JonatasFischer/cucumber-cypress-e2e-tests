import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';
import Admin from './../../../pages/admin/Admin';

Given('I am logged in the admin', () => {
    Admin.login();
});
