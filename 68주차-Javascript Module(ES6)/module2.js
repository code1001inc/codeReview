console.log('open module2.js');

// 원본이름 그대로 사용 
import { getElementVal } from './elementResource.js';

let inputOne = getElementVal('#inputOne');
let inputTwo = getElementVal('#inputTwo');

console.log(`[getElementVal] module2.js : ( ${inputOne}, ${inputTwo} )`);

// 가져온 요소를 다시 선언하거나 재정의 한다면?
// let getElementVal = (p) => { 
// getElementVal = (p) => { 
    // let val = (document.querySelector(p)) ? document.querySelector(p).value : 'empty';
    // return val + 'pieces';
// };


// Uncaught SyntaxError: Identifier 'getElementVal' has already been declared  
// uncaught TypeError: Assignment to constant variable.


