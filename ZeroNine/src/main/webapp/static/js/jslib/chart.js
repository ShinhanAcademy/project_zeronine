$(window).ready(function(){
   draw(80, '.pie-chart', '#F11B1B');
});

function draw(max, classname, colorname){
   var i=1;
    var func1 = setInterval(function(){
      if(i<max){
          color1(i,classname,colorname);
          i++;
      } else{
        clearInterval(func1);
      }
    },10);
};

function color1(i, classname,colorname){
   $(classname).css({
        "background":"conic-gradient("+colorname+" 0% "+i+"%, #F99E9E "+i+"% 100%)"
   });
};