// const path = require('path');
// entry.js

// css로드
// css 파일은 확장자 생략 불가.
// style 로더, css 로더, sass 로더 사용
require('./style.css');
require('./style.sass');

// js 로드
// js 파일은 확장자를 생략할 수 있음.
var hello = require('./hello');
var world = require('./world');

document.write(hello + ', ' + world + '!');

// es6의 화살표 함수.
module.exports = es6_func = () => console.log("hello world");
	
// 외부에서 내부 모듈의 함수등을 사용하는 방법.
// 1. window 객체의 요소로 선언.
// 2. webpack.config.js에서 library를 설정하면 바로 사용가능.
window.es6_func2 = es6_func;
