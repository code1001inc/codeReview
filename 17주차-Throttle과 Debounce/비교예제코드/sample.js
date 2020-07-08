window.onload = function() {
  // 1
  var inside1 = document.querySelector(".inside-1");
  var thing1 = document.querySelector(".thing-1");
  var count1 = document.querySelector(".count-1");
  inside1.addEventListener('scroll', function() {
    thing1.style.top = inside1.scrollTop;
    count1.innerHTML = parseInt(count1.innerHTML)+1;
  });
  
  // 2 
  var inside2 = document.querySelector(".inside-2");
  var thing2 = document.querySelector(".thing-2");
  var count2 = document.querySelector(".count-2");
  inside2.addEventListener('scroll', _.throttle(function() {
    thing2.style.top = inside2.scrollTop;
    count2.innerHTML = parseInt(count2.innerHTML)+1;
  }, 150));
  
  // 3
  var inside3 = document.querySelector(".inside-3");
  var thing3 = document.querySelector(".thing-3");
  var count3 = document.querySelector(".count-3");
  inside3.addEventListener('scroll', _.debounce(function() {
    thing3.style.top = inside3.scrollTop;
    count3.innerHTML = parseInt(count3.innerHTML)+1;
  }, 100));
}