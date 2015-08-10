// Possible decoding types:
// "every-forwards", "even-forwards", "odd-forwards"
// "every-backwards", "even-backwards", "odd-backwards"

'use strict'

var decode = require('./decode.js');

function super_decoder (words, type) {
	/* words is a string representing the sentence, type is a string for the behavior */
	var index = 0;
	var array = words.split(' ');
	var options = type.split('-');
	
	if (options[1] === 'backwards') {
		array = array.reverse()
	} 

	if (options[0] === 'even') {
		array = array.filter(function (word, index) {
			return index % 2 === 0;
		})
	} else if (options[0] === 'odd') {
		array = array.filter(function (word, index) {
			return index % 2 === 1;
		})
	}


	return decode(array);
	
}

module.exports = super_decoder;
