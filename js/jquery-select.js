/*
	@ 2014/06/04  
	@ jQuery plug-in 
	@ jquery-select all text in element (like Ctrl+A)
	@ Copyright Zap
	@ use → $(element).selectText()
*/

jQuery.fn.selectText = function(){

	   var doc = document;

	   // commend "select" element 
	   var element = this[0];

	   //console.log(this, element);

	   // IE
	   if (doc.body.createTextRange) {

	   	   // Text Range Object
	       var range = document.body.createTextRange();
	       // remove selected
	       range.moveToElementText(element);
	       // select
	       range.select();

	   // Chrome
	   } else if (window.getSelection) {

	       var selection = window.getSelection();        
	       var range = document.createRange();
	       range.selectNodeContents(element);
	       selection.removeAllRanges();
	       selection.addRange(range);
	   }

	   else{
	   	  console.log("Your browser is not support!");
	   }

};