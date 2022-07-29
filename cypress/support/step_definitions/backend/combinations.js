import {Then, When} from '@badeball/cypress-cucumber-preprocessor';
import Combinations from "../../page_objects/admin/product/Combinations";

//admin/properties_combis.php?products_id
Then("The product combinations page is active", () => {
    Combinations.isActive()
});

When("I define the combination {string} quantity as {string}", (combination, quantity) => {
    Combinations.editCombination(combination)
    Combinations.setCombinationQuantity(quantity)
    Combinations.saveCombination()
});
When("I define the combinations settings as", (datatable) => {
    Combinations.openSettingsModal()
    datatable.rawTable.forEach((item, index) => {
        Combinations.setSettings(item[0], item[1])
    })
    Combinations.saveSettingsModal()

});


