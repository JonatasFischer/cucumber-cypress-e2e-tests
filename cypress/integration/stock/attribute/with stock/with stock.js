/*------------------------------------------------------------------------------
 - with stock.js 2020-12-07
 - Gambio GmbH
 - http://www.gambio.de
 - Copyright (c) 2020 Gambio GmbH
 - Released under the GNU General Public License (Version 2)
 - [http://www.gnu.org/licenses/gpl-2.0.html]
 -----------------------------------------------------------------------------*/

import Admin from '../../../../pages/admin/Admin'
import Categories from '../../../../pages/admin/product/Categories'
import ProductMaintenance from '../../../../pages/admin/product/ProductMaintenance'
import Modules from '../../../../pages/admin/Modules'
import Attributes from '../../../../pages/admin/Attributes'
import ProductAttributes from '../../../../pages/admin/product/ProductAttributes'

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
	Categories.deleteProductsNamedAs("[P1A1] Product with attribute with Stock")
	Categories.clickCreateProduct()
	ProductMaintenance.isActive()
	ProductMaintenance.checkField("Show on start page")
	ProductMaintenance.checkField("Show stock")
	ProductMaintenance.checkField("Show weight")
	ProductMaintenance.checkField("Show Unit Price")
	ProductMaintenance.setQuantity(10000)
	ProductMaintenance.setPrice("9.99")
	ProductMaintenance.setMinOrder("1")
	ProductMaintenance.setGraduatedQuantity("1")
	ProductMaintenance.setWeight("1000")
	ProductMaintenance.fillProdudctName("de", "[P1A1] Product with attribute with Stock")
	ProductMaintenance.fillProdudctName("en", "[P1A1] Product with attribute with Stock")
	ProductMaintenance.save()
	
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
	
	Categories.visit()
	Categories.navigateProductAttributes("[P1A1] Product with attribute with Stock")
	ProductAttributes.clickLoadOptions("Attribute EN")
	ProductAttributes.configureOption("Attribute EN", 'Yes', {'checked': 'true', "sort_order": "1", "stock": 1000})
	ProductAttributes.configureOption("Attribute EN", 'No', {'checked': 'true', "sort_order": "0", "stock": 1000})
	
});