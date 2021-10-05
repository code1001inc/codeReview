console.log('open elementResource.js');

export let getElementVal = (p) => {    
    const val = (document.querySelector(p)) ? document.querySelector(p).value : 'empty';
    return val;
}