console.log(bbd);
var bbd = "오이시";
console.log(bbd);

// All the code is wrapped in the IIFE
 (function () {
	var firstName = "Richard";
	console.log("IIFE");
    function init () {
        doStuff (firstName);
        // code to start the application
    }
    function doStuff () {
        // Do stuff here
    }
    function doMoreStuff () {
        // Do more stuff here
    }
    // Start the application
    init ();
}) ();
console.log(firstName);