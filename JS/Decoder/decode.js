/* Write a function that receives a string of numbers separated by colons. 
Have the function turn that string into an array of numbers and calculate their average. */

'use strict'

function decode(words) {
	var index = 0;
	var secretMessage = '';
	words.forEach(function (word) {
		if (index >= 5) {
		 	index = 0;
		 } 
		 secretMessage = secretMessage + word.charAt(index)
		 
		index += 1;

	})

	return secretMessage;
}

module.exports = decode;

// var words = [
// 	'January' ,
// 	'lacks' ,
// 	'caveats' ,
// 	'hazardous' ,
// 	'DOORS' ,
// 	'crying' ,
// 	'arogantly' ,
// 	'climate' ,
// 	'propoent' ,
// 	'rebuttal'
// ];

// var message = decode(words);

// console.log(message);

// console.log(words[0].charAt(0));


