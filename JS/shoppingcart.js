'use strict'

var ShoppingCart = function () {
	this.cart = [];  
	this.total = 0;
};

ShoppingCart.prototype.addItem = function(item, count) {
	// create function here to add item to shopping cart
	if (item.name === 'apple') {
		var freeApple = new Item('apple', 0);
		this.cart.push(freeApple);
	};

	this.cart.push(item);
	this.putTotal(item.price);
	this.checkDiscount(this.total) 
	console.log('We are adding ' + item.name + ' to the cart at a price of $' + item.price + ' each! The total now is : ' + this.total);
};

ShoppingCart.prototype.putTotal = function (price) {
	this.total += price;
};

ShoppingCart.prototype.checkDiscount = function(total) {
	if (this.cart.length > 5) {
		this.total = this.total * .9;
	}
};

//---------------------------------------------//

var Item = function (name, price) {
	this.name = name;
	this.price = price;
};

//---------------------------------------------//

var shoppingCart = new ShoppingCart();

var apple = new Item('apple', 10);
var orange = new Item('orange', 5);
var grapes = new Item('grapes', 15);
var banana = new Item('banana', 20);
var watermelon = new Item('watermelon', 50);
var yogurt = new Item('yogurt', 6);
var bread = new Item('bread', 7)

shoppingCart.addItem(apple);
shoppingCart.addItem(orange);	
shoppingCart.addItem(watermelon);
shoppingCart.addItem(grapes);
shoppingCart.addItem(banana);			
shoppingCart.addItem(yogurt);																																																																																																																																																															
shoppingCart.addItem(bread);

console.log(shoppingCart.cart)
