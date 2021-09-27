/*
[ 엄격모드 Strict mode ( ↔ 느슨한모드 Sloppy mode:Default) ]
- JS의 느슨한 코딩스타일 허용으로 인한 오류 가능성을 줄이기 위해 엄격한 모드를 적용하겠다.
- (ECMAScript5 : 2009)에서 공개
- 기존 JS 사용시에 기본값은 느슨한모드이므로, 엄격모드는 선택이다.
  하지만 module 패턴을 사용한다면 무조건 엄격모드가 적용된다.

* 사용방법
 1. 전역사용
 2. 함수레벨
 3. JavaScript 모듈(ECMAScript2015) : 기본이 strict mode

* 기능
 1. 기존에는 무시되던 에러 throwing(일부)
 2. JS엔진 최적화 작업을 유발하는 실수를 사전제거할 수 있음(일부)
    변수사용의 명료화
 3. ECMAScript차기 버전에서 정의 될 문법을 미리 금지시킨다.
 */

// -------------- 사용방법 ------------------
// * 사용방법 1. 전역사용
// 'use strict'; 

// * 사용방법 2. 함수레벨
// ※하단 예제코드들은 모두 함수레벨 scope를 적용하여 예시를 사용합니다.
function strict() { 
    'use strict';
    return 'strict function!';
}

// * 사용방법 3. (but, 사실 이건 사용방법이 아니다. module에서는 기본적으로 strict mode가 적용된다. )
// export function strictModule() {  // export를 사용하려면 html page에서 script type="module"이 선언되어야한다.
//     return 'default strict module';
// }


// -------------- 기능1 ------------------
// * 기능 1.1 선언하지 않은 변수에 할당시 오류 발생
let nonDeclare = () => { 
    'use strict';

    let declareVar = 'yes define';
    console.log(declareVar);

    nonDeclareVar = 'not define'; // Uncaught ReferenceError: nonDeclareVar is not defined  
    console.log(nonDeclareVar); // 엄격 미사용시, not define 출력
};
// nonDeclare();

// * 기능 1.2 할당할 수 없는 객체에 할당시 오류 발생
let notAssignObj = () => {
    'use strict';
    let undefined = 3; // Uncaught TypeError: Cannot assign to read only property 'undefined' of object '#<Window>'
    let Infinity = 5;  // Uncaught TypeError: Cannot assign to read only property 'undefined' of object '#<Window>'
    console.log(undefined); // 엄격 미사용시, 3 출력
    console.log(Infinity);  // 엄격 미사용시, 5 출력
};
// notAssignObj();

// * 기능 1.3 읽기전용 객체 수정 불가, get 선언객체 수정불가
let objProperties = Object.defineProperties({}, {
    prop1: {
        value: 'can modify!',
        writable: true
    },
    prop2: {
        value: 'cannot modify!',
        writable: false
    },
    prop3: {
        get: function() {
            return 'cannot modify!';
        }
    }
});
let modifyObjProperties = (obj) => {
    // 'use strict';
    obj.prop1 = 'prop1: modify success test'; 
    obj.prop2 = 'prop2: modify success test'; // Uncaught TypeError: Cannot assign to read only property 'prop2' of object '#<Object>'    
    obj.prop3 = function() {
        return 'prop3: modify success test';  // index.js:61 Uncaught TypeError: Cannot set property prop3 of #<Object> which has only a getter 
    };
    console.log(`<result>
                 prop1: ${obj.prop1} 
                 prop2: ${obj.prop2}
                 prop3: ${obj.prop3}`);
};
// modifyObjProperties(objProperties);

// * 기능 1.4 확장불가객체 수정 불가
let pveObj = (name) => {
    'use strict';
    let obj = new Object();
    obj.firstName = 'SJ';    
    Object.preventExtensions(obj); // 객체에 새로운 속성추가 방지(확장불가)
    obj.lastName = 'Lee'; // Uncaught TypeError: Cannot add property name, object is not extensible
    console.log(obj);
    return obj;
}
// pveObj();

// * 기능 1.5 delete 사용 시, delete 작동하지 않는 곳에서 에러 반환(delete 상세설명은 하단링크 참조)
//   https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Operators/delete
let deleteObj = () => {
    // 'use strict';
    let obj = { 
        key: 'age',
        value: '30' 
    }
    console.log(obj);
    delete obj.key; // object의 속성 제거는 정상작동
    console.log(obj);    
    delete obj; // Uncaught SyntaxError: Delete of an unqualified identifier in strict mode.
    console.log(obj);    
}
// deleteObj();

// * 기능 1.6 함수의 파라미터는 동일한 명칭 선언 불가
//            arrow func에서는 동일 파라미터명 에러
function sameParamFunc(param1, param1) { // 엄격모드에서만, Uncaught SyntaxError: Duplicate parameter name not allowed in this context
    // 'use strict';
    return `${param1}, ${param1}`;
}
// console.log(sameParamFunc('A', 'B'));

// let sameParamFunc2 = (param1, param1) => { // 항상 오류 Uncaught SyntaxError: Duplicate parameter name not allowed in this context        
    // return `${param1}, ${param1}`;
// }
// console.log(sameParamFunc2('A', 'B'));



//* 기능 1.7 8진수 숫자 리터럴 및 이스케이프 문자 사용불가
// 0으로 시작하는 숫자리터럴 = 8진수, 0x=16진수
// https://runebook.dev/ko/docs/javascript/errors/deprecated_octal
let literalFunc = () => {
    // 'use strict';
    let octalVar;
    octalVar = 070; //Uncaught SyntaxError: Octal literals are not allowed in strict mode.
    octalVar = '\251';  //Uncaught SyntaxError: Octal escape sequences are not allowed in strict mode.
    return octalVar;
}
// console.log(literalFunc());


// * 기능 1.8 primitive values의 속성설정 불가
let modifyPrimitiveValues = () => {
    'use strict'; 
    false.true = '';   // Cannot create property 'true' on boolean 'false' at modifyPrimitiveValues
    (14).sailing = 'home'; // Cannot create property 'sailing' on number '14' at modifyPrimitiveValues
    'with'.you = 'far away'; // Cannot create property 'you' on string 'with' at modifyPrimitiveValues
}
// modifyPrimitiveValues();

// -------------- 기능2 ------------------

// * 기능 2.1 with문 사용 불가
let useWithFunc = () => {
    // 'use strict';
    let foo = {
        name: 'Kee'
    }

    with(foo){ // Uncaught SyntaxError: Strict mode code may not include a with statement
        console.log(name);
    }
}
// useWithFunc();

// * 기능 2.2 eval은 컴파일단에서 미리 구문분석 불가
//            eval을 변수 또는 함수, 매개 변수의 이름으로 사용불가
function evalFunc1() {
    // 'use strict';
    let eval = 17; // Uncaught SyntaxError: Unexpected eval or arguments in strict mode    
}
function evalFunc2() {
    // 'use strict';
    function eval() {
        console.log(`Function eval()`); // Uncaught SyntaxError: Unexpected eval or arguments in strict mode
    }
}
function evalFunc3(eval) { // Uncaught SyntaxError: Unexpected eval or arguments in strict mode
    // 'use strict';
    let p1 = eval; 
}

// * 기능 2.3 arguments를 변수 또는 함수, 매개 변수의 이름으로 사용할 수 없다.
function argsFunc1() {
    // 'use strict';
    let arguments = 17; // Uncaught SyntaxError: Unexpected eval or arguments in strict mode    
}
function argsFunc2() {
    // 'use strict';
    function arguments() {
        console.log(`Function args()`); // Uncaught SyntaxError: Unexpected eval or arguments in strict mode
    }
}
function argsFunc3(arguments) { // Uncaught SyntaxError: Unexpected eval or arguments in strict mode
    // 'use strict';
    let p1 = arguments; 
}

// * 기능 2.4 인자값 수정시 arguments의 값이 수정되지 않는다.
function modifyArguments(a) {
    'use strict';
    a = 42;
    return console.log([a, arguments[0]]); // 비엄격모드 : 42,42 엄격모드 : 42 20
}
// modifyArguments(20);

// * 기능 2.4 callee, caller를 지원하지 않는다.
function restricted() {
    'use strict';
    console.log(`restricted.caller : ${restricted.caller}`); //  'caller', 'callee', and 'arguments' properties may not be accessed on strict mode functions or the arguments objects for calls to them
    console.log(`restricted.arguments : ${restricted.arguments}`); //  'caller', 'callee', and 'arguments' properties may not be accessed on strict mode functions or the arguments objects for calls to them
}
function callRestricted(){
    'use strict';
    console.log(`callRestricted.caller : ${callRestricted.caller}`); //  'caller', 'callee', and 'arguments' properties may not be accessed on strict mode functions or the arguments objects for calls to them
    console.log(`callRestricted.arguments : ' ${callRestricted.arguments}`); //  'caller', 'callee', and 'arguments' properties may not be accessed on strict mode functions or the arguments objects for calls to them
    console.log(`arguments.callee : ${arguments.callee}`); //  'caller', 'callee', and 'arguments' properties may not be accessed on strict mode functions or the arguments objects for calls to them

    restricted();
}
// callRestricted();

// * 기능 2.5 this의 값이 null 또는 undefined인 경우 전역 객체로 변환하지 않는다.
//   call, apply : this객체값 변경 https://beomy.tistory.com/4
function callFun() {

    function fun() { 
        'use strict';
        return this; 
    }     

    console.log(fun()); 
    console.log(fun.call(2)); 
    console.log(fun.call(undefined)); 
    console.log(fun.apply(null)); 
    console.log(fun.bind(true)());
}
// callFun();

/*
---------------------------------------------------------------------------
 [ 출처 ]
https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Strict_mode
https://beomy.tistory.com/13
---------------------------------------------------------------------------
*/