// $(window).ready(function(){
//    draw(80, '.pie-chart', '#F11B1B');
// });

function draw(max, classname, pointColorname, backgroundColorName){
   var i=1;
    var func1 = setInterval(function(){
      if(i<max){
          color1(i,classname, pointColorname, backgroundColorName);
          i++;
      } else{
        clearInterval(func1);
      }
    },10);
};

function color1(i, classname, pointColorname, backgroundColorName){
   $(classname).css({
      "background": `conic-gradient(${pointColorname} 0% ${i}%, ${backgroundColorName} ${i}% 100%)`
   });
};