import {Given} from '@badeball/cypress-cucumber-preprocessor';
import Attributes from "../../pages/admin/Attributes";


Given('I have the following attribute configured', (datatable) => {
    Attributes.visit();
    datatable.rawTable.forEach((item, index) => {
        Attributes.deleteOption(item[1]);
    });
    datatable.rawTable.forEach((item, index) => {
        Attributes.typeOptionName(item[1], item[0]);
    })
    Attributes.clickInsertOption();
});

Given('I have the following options configured to the attribute {string}', (option, datatable) => {
    Attributes.visit();
    let options = {};
    datatable.rawTable.forEach((item, index) => {
        options[item[0]] = options[item[0]] ?? {};
        options[item[0]][item[1]] = item[2];
    });


    Object.entries(options).forEach(entry => {
        const [key, optionValue] = entry;
        Object.entries(optionValue).forEach(translatedText => {
            const [language, text] = translatedText;
            Attributes.typeOptionValueName(text, language)
        })
        Attributes.selectOption(option)
        Attributes.clickInsertOptionValue()
    });
});
