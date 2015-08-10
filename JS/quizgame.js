'use strict'

var read = require('read');

var Question = function (text, answer, id, points) {
	this.text = text;
	this.answer = answer;
	this.id = 0;
	this.points = 0;
};

//--------------------------------//

var Quiz = function () {
	this.questions = [];
	this.currentQuestionIndex = 0;
	this.total = 0;
};

Quiz.prototype.addQuestion = function (question) {
	this.questions.push(question);
};

Quiz.prototype.askQuestion = function () {
	var options = {
		prompt: this.questions[this.currentQuestionIndex].text
	};
	read(options, this.checkAnswer.bind(this)); // this is a Quiz Method.
};

Quiz.prototype.checkAnswer = function (err, input) {
	console.log("You answered " + input);

	if ( input === this.questions[this.currentQuestionIndex].answer ) {
		console.log(this.questions[this.currentQuestionIndex].points)

		this.total = this.total + (this.questions[this.currentQuestionIndex].points)
		console.log("Yasssss! Your current total is " + this.total);

		this.currentQuestionIndex += 1;
	} else {
		console.log("try again ho!");
	}
	this.nextQuestion();
};

Quiz.prototype.nextQuestion = function() {
	if (quiz.currentQuestionIndex <= quiz.questions.length -1) {
		quiz.askQuestion();
	} else {
		console.log("Thanks for playing!");
	};
};

Quiz.prototype.startQuiz = function() {
	console.log("Whats up! We're going to take a quiz.\n")
	this.askQuestion(this.currentQuestionIndex);
};


//--------------------------------//

var quiz = new Quiz();

var firstq = new Question("What's 2 x 1?", "2", 1, 10);
var secondq = new Question("What's 2 x 2?", "4", 2, 20);
var thirdq = new Question("What's 2 x 3?", "6", 3, 30);
var fourthq = new Question("What's 2 x 4?", "8", 4, 40);

quiz.addQuestion(firstq);
quiz.addQuestion(secondq);
quiz.addQuestion(thirdq);
quiz.addQuestion(fourthq);
quiz.startQuiz()
