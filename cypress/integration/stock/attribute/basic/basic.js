import Admin from '../../../../pages/admin/Admin'
import Modules from '../../../../pages/admin/Modules'
import Settings from '../../../../pages/admin/Settings'
import Categories from '../../../../pages/admin/product/Categories'
import Attributes from '../../../../pages/admin/Attributes'
import ProductMaintenance from '../../../../pages/admin/product/ProductMaintenance'
import ProductAttributes from '../../../../pages/admin/product/ProductAttributes'
import PackingUnit from '../../../../pages/admin/PackinUnit'

const {
	Before,
} = require("cypress-cucumber-preprocessor/steps");

// this will get called before each scenario
before(() => {
	Admin.login();
	//install module
	Modules.visit();
	Modules.installModule("Product Options")
	
	
	//create the product
	Categories.visit()
	Categories.deleteProductsNamedAs("Product with Attribute")
	
	PackingUnit.visit();
	PackingUnit.deletePackingUnitIfExists('Bag');
	PackingUnit.clickAddBagButton();
	PackingUnit.fillNameField('Bag', 'en');
	PackingUnit.fillNameField('Bag', 'de');
	PackingUnit.clickSaveButton();
	PackingUnit.checkPackingUnitExists('Bag');
	
	//configure the product settings using uncheck/check approach
	Settings.visit()
	Settings.uncheckParameter('Check stock level');
	Settings.checkParameter('Check stock level');
	
	Settings.uncheckParameter('Check stock before shopping cart?');
	Settings.checkParameter('Check stock before shopping cart?');
	
	Settings.uncheckParameter('Allow Checkout');
	Settings.checkParameter('Allow Checkout');
	
	Settings.uncheckParameter('Deactivate Attributes');
	Settings.checkParameter('Deactivate Attributes');
	
	Settings.uncheckParameter('Show Stock Attributes');
	Settings.checkParameter('Show Stock Attributes');
	
	Settings.uncheckParameter('Check attribute stock level');
	Settings.checkParameter('Check attribute stock level');
	
	//save and check if it is saved
	Settings.clickSaveButton()
	Settings.saveButtonIsDisabled()
	
	
	
	
	Attributes.visit();
	
	//delete old options
	Attributes.deleteOption("Attribute DE");
	Attributes.deleteOption("Attribute EN");
	
	//create new options
	Attributes.typeOptionName("Attribute DE", "de");
	Attributes.typeOptionName("Attribute EN", "en");
	Attributes.clickInsertOption();
	
	//option value yes
	Attributes.typeOptionValueName("Yes", "en")
	Attributes.typeOptionValueName("Ja", "de")
	Attributes.selectOption("Attribute EN")
	Attributes.clickInsertOptionValue()
	
	//option value no
	Attributes.typeOptionValueName("No", "en")
	Attributes.typeOptionValueName("Nein", "de")
	Attributes.selectOption("Attribute EN")
	Attributes.clickInsertOptionValue()
	
	//create the new product
	Categories.visit()
	Categories.clickCreateProduct()
	ProductMaintenance.isActive()
	ProductMaintenance.checkField("Show on start page")
	ProductMaintenance.checkField("Show stock")
	ProductMaintenance.checkField("Show weight")
	ProductMaintenance.checkField("Show Unit Price")
	ProductMaintenance.setQuantity(0)
	ProductMaintenance.setPrice("9.99")
	ProductMaintenance.setModel("PWA")
	ProductMaintenance.setMinOrder("2")
	ProductMaintenance.setGraduatedQuantity("2")
	ProductMaintenance.setWeight("1000")
	ProductMaintenance.fillProdudctName("de", "Product with Attribute")
	ProductMaintenance.fillProdudctName("en", "Product with Attribute")
	ProductMaintenance.save()
	Categories.navigateProductAttributes("Product with Attribute")
	ProductAttributes.clickLoadOptions("Attribute EN")
	ProductAttributes.configureOption( "Attribute EN", 'Yes',{'checked':'true', "sort_order":"1"})
	ProductAttributes.configureOption( "Attribute EN", 'No',{'checked':'true', "sort_order":"0"})
	ProductAttributes.save()
});