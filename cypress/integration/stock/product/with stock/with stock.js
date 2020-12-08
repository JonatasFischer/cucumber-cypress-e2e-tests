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

const {
	Before,
} = require("cypress-cucumber-preprocessor/steps");

// this will get called before each scenario
before(() => {
	Admin.login();
	//create the product
	Categories.visit()
	Categories.deleteProductsNamedAs("Product with Stock")
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
	ProductMaintenance.fillProdudctName("de", "Product with Stock")
	ProductMaintenance.fillProdudctName("en", "Product with Stock")
	ProductMaintenance.save()
});