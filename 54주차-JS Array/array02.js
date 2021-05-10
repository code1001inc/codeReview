// < 배열 >

// [ 배열의 선언방식 ]
let arrInt = [1, 2, 3]
let arrMultiType = [1, '2', [4, 5, 6], { a: 1 }]
// console.log(arrInt);
// console.log(arrMultiType);
// → 배열의 내부는 어떠한 타입도 제약없이 사용할 수 있다.


// [ 배열요소 추가 ]
arrInt = [1, 2, 3];
arrInt[3] = 4;
arrInt[arrInt.length] = 5;
arrInt.push(6)
// console.log(arrInt);

// [ 배열요소 추가, 제거 메서드 ]
let arr = [1, 2, 3];
// 배열요소 추가, 제거 메서드
// pop    : 마지막요소 제거, 제거요소 리턴
// push   : 마지막 요소 추가, 배열 크기 리턴
// shift  : 첫번째 요소 제거, 제거요소 리턴
// unshift: 첫번째 요소 추가, 배열 크기 리턴
// splice : 특정 위치에 요소를 원하는 만큼 제거가능하고 원하는만큼 추가가능, 삭제요소 리턴

let _pop = arr.pop();
// console.log('pop : ' + _pop + ' /// ' + 'arr : ' + arr);
// pop : 3 /// arr : 1,2

let _push = arr.push('three');
// console.log('push : ' + _push + ' /// ' + 'arr : ' + arr);
// push : 3 /// arr : 1,2,three

let _shift = arr.shift();
// console.log('shift : ' + _shift + ' /// ' + 'arr : ' + arr);
// shift : 1 /// arr : 2,three

let _unshift = arr.unshift('one');
// console.log('unshift : ' + _unshift + ' /// ' + 'arr : ' + arr);
// unshift : 3 /// arr : one,2,three

// arr = ['one', 2, 'three']
let _splice = arr.splice(1, 1, 'two')
// console.log('splice : ' + _splice + ' /// ' + 'arr : ' + arr);
// splice : 2 /// arr : one,two,three

_splice = arr.splice(0, 3, 1, 2, 3)
// console.log('splice : ' + _splice + ' /// ' + 'arr : ' + arr);
// splice : one,two,three /// arr : 1,2,3

arr = [1, 2, 3];
// [ 배열 복사 및 생성 ]
// Array.from(args);
// args : 해당값을 배열로 만들어줌
let arrCopy1 = arr;
let arrCopy2 = Array.from(arr);
let arrShallowCopy = arr;          // 얕은복사 (주소참조)
let arrDeepCopy = Array.from(arr); // 깊은복사 (배열생성)
// console.log(arrShallowCopy);    // [1,2,3]
// console.log(arrDeepCopy);       // [1,2,3]
// arr.push(7);
// console.log(arrShallowCopy);    // [1,2,3,7]
// console.log(arrDeepCopy);       // [1,2,3]ar

// [ 배열 확인 ] 
let isArray1 = Array.isArray(arrInt);
let isArray2 = Array.isArray(3);
// console.log(isArray1); // true
// console.log(isArray2); // false


//[ 배열 반전, 정렬 ] 
let arrReverse = [1, 2, 3, 4, 5];
// console.log(arrReverse.reverse());
// console.log(arrReverse.reverse());

let arrSort = [1, 4, 2, 6, 5, 3, 11];
let _sort = arrSort.sort();
// let _sortF = arrSort.sort((a, b) => a - b)
// let _sort = Array.from(arrSort).sort();
// console.log(_sort);
// console.log(_sortF);


// [ concat ]
// arr.concat(value)
// 배열의 마지막요소에 추가, 하지만 새로운 배열을 반환 
arr = [1, 2, 3];
let arrPush = arr.push(4);
// console.log(arr);     // [1,2,3,4]
// console.log(arrPush); // 4 : 리턴값 배열의 크기

let arrConcat = arr.concat(5);
// console.log(arr); // [1,2,3,4]
// console.log(arrConcat); // [1,2,3,4,5] 리턴값 새로운 배열;


// [ slice ]
arr = [1, 2, 3, 4, 5];
// arr.slice(start, end)
// 지정한 만큼 요소를 잘라낸 후 배열 반환, 새로운 배열 반환
// start : 시작위치
// end   : 종료위치+1 (해당 값 앞 요소까지 자름)
let arrSlice = arr.slice(2, 4);
// console.log(arrSlice);


// [ join ]
// arr.join(seperator);
// seperator : 구분자로 사용할 문자, 기본값은 쉼표(,)
arr = ['Lee', 'Sung', 'Jin']
let arrJoin = arr.join(" ");
// console.log(arrJoin);


// [ some, every, includes ]
// arr.some(callback)
// arr.every(callback)
// arr.includes(searchElement)

// some : 하나라도 callback조건에 해당하면 true 
// every : 모든 요소가 callback조건에 해당하면 true
// includes : 특정 요소 포함여부 true/false
arr = [1, 2, 3];
let arrSome = arr.some(a => a % 2 === 0);
// console.log(arrSome);
let arrEvery = arr.every(a => a % 2 === 0)
// console.log(arrEvery);

let arrIncludes = arr.includes(6);
// console.log(arrIncludes);

