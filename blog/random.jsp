<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ page import="web.util.ConnectionContext"%>
    

<jsp:useBean id="member" class="web.bean.Member" />
<jsp:setProperty name="member" property="*" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>발표자 사다리타기</title>
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<style>
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
body{
  font-family:'hanna';
}
h1{
 text-align:center;
 font-family:'hanna';
 color:blue; 
}
div{
  text-align:center;
}
#ok{

  width:80px;
  font-family:'hanna';
  boder:2px blue;
  background-color:white;
  align:center;
  height:30px;
  

}
#start{
   width:100px; 
   font-family:'hanna';
  boder:2px blue;
  background-color:white;
  align:center;
  height:30px;
  

}

#main{
	background:pink;
	
	width:400px;
}

#inputName{

	background:#FFEFD5;
	
	width:400px;
	
	visibility:hidden;
}
#result{
	background:#EE82EE;
	
	width:400px;
	visibility:hidden;
}
</style>
<script>
  var idNum = 0;
  var arra=[];
  var view = ["","ㅡ"];
  var num=0;
  window.onload=function(){
  var ok=document.getElementById("ok");
  var start=document.getElementById("start");
  var moneys=[];
  ok.onclick=function(){
     inputName.style.visibility="visible";
     num=document.getElementById("num").value;
  var show="<table border id='input'>";
  show+="<tr><th>no</th><th>이름</th><th>항목</th></tr>"
  for(var i=0; i<num; i++){
     show+="<tr><td>"+(i+1)+"</td><td><input type='text' name='name'></td><td><input type='text' name='item'></td></tr>";
  }
show+="</table>";
document.getElementById("show").innerHTML=show;			
}
start.onclick=function(){
  inputName.style.visibility="hidden";
  result.style.visibility="visible";
  var name=document.getElementsByName("name");
  var item=document.getElementsByName("item");
  var show1="<center><h3>결과</h3><br>"
  show1+="<table id='output'>";
  show1+="<tr>";
  for(var i=0; i<num; i++){
     show1+="<td><input id = "+idNum+" type='button' name='b_name' value="+name[i].value+"></td>";
     idNum++;
     if(i!=num-1){
         show1+="<td> </td>";
	     idNum++;
     }

  }
  show1+="</tr>";
  for(var i=0; i<10; i++){
		show1+="<tr>";
		for(var j=0; j<num; j++){
				//show1+="<td >"+parseInt(Math.random()*2)+"</td>";
				arra[j]=parseInt(Math.random()*2);
				show1+="<td>|</td>";
				idNum++;
				if(j!=num-1){
					if(j!=0&&(arra[j-1]==1)){
						arra[j]=0;
					}
					show1+="<td>"+view[arra[j]]+"</td>"; // 0 1 2
				}
		}
		show1+="</tr>";
}

show1+="<tr>";
for(var i=0; i<num; i++){
	show1+="<td>"+item[i].value+"</td>";
	if(i!=num-1){
		show1+="<td></td>";
	}
}
show1+="</tr>";
show1+="</table>";
document.getElementById("shResult").innerHTML=show1;
var b_name = document.getElementsByName("b_name");
for(var i = 0; i <b_name.length; i++ ){
	b_name[i].onclick=chResult;
}
}

	}
function chResult(){
		var tr = document.getElementsByTagName("tr");
		var i = parseInt(num)+2;
		var j = parseInt(this.id);
		var inter = null;
		var finish=tr[i].childNodes[j].innerHTML;
		tr[i].childNodes[j].innerHTML=3;            //숫자 3으로 경로 표시
		inter=setInterval(function(){
					if(tr[i].childNodes[j-1]&&tr[i].childNodes[j-1].innerHTML=="ㅡ"){
						j=j-2;
					}
					else if(tr[i].childNodes[j+1]&&tr[i].childNodes[j+1].innerHTML=="ㅡ"){
						j=j+2;
					}
				finish=tr[++i].childNodes[j].innerHTML;
				tr[i].childNodes[j].innerHTML=3;
			if(finish!="|" && finish!="ㅡ"){
				alert(finish);
				clearInterval(inter);
			}
		},100);
}
</script>
</head>
<body>
<H1>발표자 추첨 start</H1>
  <center><div id="main">	
     <center><h3>사다리 게임</h3>
         참가할 인원: <input type="text" id="num"/></br></br>
     &nbsp;&nbsp;<input type="button" id="ok" value="확인"/>
  </div>	
  <div id="inputName">	
    <p id="show"></p>
    <input type="button" id="start" value="사다리타기"/>
  </div>
    <div id="result">	
      <p id="shResult"></p>
    </div>
</body>
</html>