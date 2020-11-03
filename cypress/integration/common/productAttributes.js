import {When, Then} from 'cypress-cucumber-preprocessor/steps';
import ProductAttributes from "../../pages/admin/product/ProductAttributes";
import Settings from "../../pages/admin/Settings";
When("I click in the load attributes button for the attribute {string}", (attributeName) => {
    ProductAttributes.clickLoadOptions(attributeName)
});

When("I configure the attribute {string} option {string} with the following values", (attributeName, valueName, datatable) => {
    let config = {};
    datatable.rawTable.forEach((item, index) => {
        let field = item[0].match(/[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+/g).map(x =>x.toLowerCase().trim()).join('_')
        config[field] = item[1];
    })
    ProductAttributes.configureOption(attributeName, valueName, config)
});
When("I save the attribute configuration", () => {
    ProductAttributes.save()
});
