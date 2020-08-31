// entry.js

//css로드
//css 파일은 확장자 생략 불가.
//style 로더, css 로더, sass 로더 사용
require('!style-loader!css-loader!./style.css');
require('!style-loader!css-loader!sass-loader!./style.sass');

//js 로드
//js 파일은 확장자를 생략할 수 있음.
var hello = require('./hello');
var world = require('./world');

document.write(hello + ', ' + world + '!');