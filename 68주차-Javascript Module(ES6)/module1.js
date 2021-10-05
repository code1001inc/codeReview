
/*
첫번째 모듈 입니다. 
- import나 export를 사용하지 않고, script type="module"만 사용
- 그럼에도 불구하고, strict 모드가 적용 및 module scope(네임스페이스)가 적용됩니다.
- let inputOne, inputTwo변수는 nonModule/module2/module3.(m)js에서 선언한 변수와 변수명이 중복 → module scope로 인해 에러 미발생                            
*/
console.log('open module1.js');

let getElementVal = (p) => {    
    let val = (document.querySelector(p)) ? document.querySelector(p).value : 'empty';
    return val;
}
let inputOne = getElementVal('#inputOne');
let inputTwo = getElementVal('#inputTwo');

console.log(`[getElementVal] module1.js : ( ${inputOne}, ${inputTwo} )`);
