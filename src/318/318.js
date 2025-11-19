var container=document.getElementById("vl");
var spacer=document.getElementById("spacer");
var content=document.getElementById("content");
var itemHeight=48;
var total=20000;
var buffer=5;
var viewport=container.clientHeight;
var visible=Math.ceil(viewport/itemHeight)+buffer*2;
spacer.style.height=total*itemHeight+"px";
function render(start){
  if(start<0)start=0;
  var end=start+visible;
  if(end>total)end=total;
  var y=start*itemHeight;
  content.style.transform="translateY("+y+"px)";
  var html="";
  for(var i=start;i<end;i++){
    html+='<div class="vl-item"><span class="idx">'+(i+1)+'</span><div class="text">项目 '+(i+1)+'</div></div>';
  }
  content.innerHTML=html;
}
function onScroll(){
  var top=container.scrollTop;
  var start=Math.floor(top/itemHeight)-buffer;
  render(start);
}
container.addEventListener("scroll",onScroll);
render(0);
document.getElementById("toTop").addEventListener("click",function(){container.scrollTop=0});
document.getElementById("toMiddle").addEventListener("click",function(){container.scrollTop=(total*itemHeight/2)-viewport/2});
document.getElementById("toBottom").addEventListener("click",function(){container.scrollTop=total*itemHeight-viewport});