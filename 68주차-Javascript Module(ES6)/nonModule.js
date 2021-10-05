// 모듈 미사용 js 입니다.
console.log('open nonModule.js');

let getElementVals = (p) => {    
    let val = (document.querySelector(p)) ? document.querySelector(p).value : 'empty';
    return val;
}
let inputOne = getElementVals('#inputOne');
let inputTwo = getElementVals('#inputTwo');

console.log(`[getElementVal] NonModule.js : ( ${inputOne}, ${inputTwo} )`);

// let getElementVals = 3; // Uncaught SyntaxError: Identifier 'getElementVal' has already been declared 
