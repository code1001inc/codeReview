console.log('open module3.js');

// alias사용 
import { getElementVal as a } from './elementResource.js';

let _inputOne = a('#inputOne');
let _inputTwo = a('#inputTwo');
console.log(`[a] module3.mjs : a ( ${_inputOne}, ${_inputTwo} )`);


// getElementVal로 접근할 수 있을까?

// console.log(getElementVal('#inputOne'));
// let getElementVal = (p) => {
// getElementVal = (p) => {
//     let val = (document.querySelector(p)) ? document.querySelector(p).value : 'empty';
//     return `${val} pieces`;
// };

// let inputOne = getElementVal('#inputOne');
// let inputTwo = getElementVal('#inputTwo');
// console.log(`[getElementVal] module3.js : a ( ${inputOne}, ${inputTwo} )`);



