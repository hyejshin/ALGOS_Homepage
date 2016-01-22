<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='http://fonts.googleapis.com/css?family=Luckiest+Guy' rel='stylesheet' type='text/css'>
<title>스도쿠 게임</title>
</head>
<style>
	div#sudoku {width: 600px; margin-left: 100px;}	
	div#space {margin-bottom: 800px;}
	h1#title1 {
        padding-top: 20px;
        padding-bottom: 0;
        font-family: 'Luckiest Guy', cursive;
        color:deepskyblue;
        font-weight:1px;
        font-size: 300%;
        text-align: center;
        margin-right:27px;
        margin-left:8px;
    }
	#s {width:40px; height:40px;}
    td>input {width:40px; height:40px; text-align:center; font-size:150%}
    div {float:left}
    input.btn {font-size:13px; height:23px; width:60px;}
</style>
<script language="JavaScript">
	var X = [[0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0],
			 [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0],
			 [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0]];
	
	var seed = 1;
	function random() {
	    var x = Math.sin(seed++) * 10000;
	    return x - Math.floor(x);
	}
	
	function initX(){
		var i, j;
		
		for(i=0; i<9; i++)
			for(j=0; j<9; j++)
				X[i][j] = 0;
	}
	
	function startSudoku(){
		var fr = document.getElementById("my_form");
		
		initX();
		
		if(fr.level.value=="select")
			alert("난이도를 선택하세요.");
		else if(fr.level.value=="easy")
			setInitialNum(40);
		else if(fr.level.value=="moderate")
			setInitialNum(30);
		else if(fr.level.value=="difficult")
			setInitialNum(20);
		
		printX();
	}
	
	function checkAnswer() {
		var possible = true;
		var i, j;
	
		for(i=0; i<9; i++){
			for(j=0; j<9; j++)
				if(checkValidity(i, j, X[i][j])==false){
					possible = false;
					break;
				}
			if(possible == false)
				break;
		}
		
		if(possible)
			alert("잘하셨어요! 정답입니다 :)");
		else
			alert("오답입니다. 다시 시도해 보세요!");
	}
	
	function showAnswer(){
		document.getElementById("n1").value = 12;
	}
	
	function setInitialNum(n){
		var num, k, y, x;

		while(n--){
			do{
				num = Math.floor((random() * 9) + 1);
				k = Math.floor(random() * 81);
				
				y = Math.floor(k/9);
				x = k%9;
			}while(X[y][x]!=0 || !checkValidity(y, x, num));

			X[y][x] = num;
		}
	}
	
	function checkValidity(y, x, num){
		var i, j, box;

		for(i=0; i<9; i++){
			if(X[y][i] == num)
				return false;
			if(X[i][x] == num)
				return false;
		}

		box = (Math.floor(y/3))*3 + Math.floor(x/3);
		for(i=Math.floor(box/3)*3; i<Math.floor(box/3)*3+3; i++)
	        for(j=box%3*3; j<box%3*3+3; j++)
	            if(X[i][j] == num)
	                return false;

		return true;
	}
	
	function printX(){
		var i, y, x, id;
		
		for(i=0; i<81; i++){
			y = Math.floor(i/9);
			x = i%9;
			id = "n" + i;
			
			if(X[y][x] != 0)
				document.getElementById(id).value = X[y][x];
		}
	}
</script>
</head>
<body>
	<h1 id="title1">Sudoku Game:)</h1>
	
	<form id="my_form">
	<div id="sudoku">
	<div id="table0">
	<table border="1">
		<tr>
			<td id="s"><input type="text" name="n0" id="n0"></td>
			<td id="s"><input type="text" name="n1" id="n1"></td>
			<td id="s"><input type="text" name="n2" id="n2"></td>
		</tr>
		<tr>
			<td id="s"><input type="text" name="n9" id="n9"></td>
			<td id="s"><input type="text" name="n10" id="n10"></td>
			<td id="s"><input type="text" name="n11" id="n11"></td>
		</tr>
		<tr>
			<td id="s"><input type="text" name="n18" id="n18"></td>
			<td id="s"><input type="text" name="n19" id="n19"></td>
			<td id="s"><input type="text" name="n20" id="n20"></td>
		</tr>
	</table>
	</div>
	
	<div id="table1">
	<table border="1">
		<tr>
			<td id="s"><input type="text" name="n3" id="n3"></td>
			<td id="s"><input type="text" name="n4" id="n4"></td>
			<td id="s"><input type="text" name="n5" id="n5"></td>
		</tr>
		<tr>
			<td id="s"><input type="text" name="n12" id="n12"></td>
			<td id="s"><input type="text" name="n13" id="n13"></td>
			<td id="s"><input type="text" name="n14" id="n14"></td>
		</tr>
		<tr>
			<td id="s"><input type="text" name="n21" id="n21"></td>
			<td id="s"><input type="text" name="n22" id="n22"></td>
			<td id="s"><input type="text" name="n23" id="n23"></td>
		</tr>
	</table>
	</div>
	<div id="table2">
	<table border="1">
		<tr>
			<td id="s"><input type="text" name="n6" id="n6"></td>
			<td id="s"><input type="text" name="n7" id="n7"></td>
			<td id="s"><input type="text" name="n8" id="n8"></td>
		</tr>
		<tr>
			<td id="s"><input type="text" name="n15" id="n15"></td>
			<td id="s"><input type="text" name="n16" id="n16"></td>
			<td id="s"><input type="text" name="n17" id="n17"></td>
		</tr>
		<tr>
			<td id="s"><input type="text" name="n24" id="n24"></td>
			<td id="s"><input type="text" name="n25" id="n25"></td>
			<td id="s"><input type="text" name="n26" id="n26"></td>
		</tr>
	</table>
	</div>
	
	<div id="table3">
	<table border="1">
		<tr>
			<td id="s"><input type="text" name="n27" id="n27"></td>
			<td id="s"><input type="text" name="n28" id="n28"></td>
			<td id="s"><input type="text" name="n29" id="n29"></td>
		</tr>
		<tr>
			<td id="s"><input type="text" name="n36" id="n36"></td>
			<td id="s"><input type="text" name="n37" id="n37"></td>
			<td id="s"><input type="text" name="n38" id="n38"></td>
		</tr>
		<tr>
			<td id="s"><input type="text" name="n45" id="n45"></td>
			<td id="s"><input type="text" name="n46" id="n46"></td>
			<td id="s"><input type="text" name="n47" id="n47"></td>
		</tr>
	</table>
	</div>
	<div id="table4">
	<table border="1">
		<tr>
			<td id="s"><input type="text" name="n30" id="n30"></td>
			<td id="s"><input type="text" name="n31" id="n31"></td>
			<td id="s"><input type="text" name="n32" id="n32"></td>
		</tr>
		<tr>
			<td id="s"><input type="text" name="n39" id="n39"></td>
			<td id="s"><input type="text" name="n40" id="n40"></td>
			<td id="s"><input type="text" name="n41" id="n41"></td>
		</tr>
		<tr>
			<td id="s"><input type="text" name="n48" id="n48"></td>
			<td id="s"><input type="text" name="n49" id="n49"></td>
			<td id="s"><input type="text" name="n50" id="n50"></td>
		</tr>
	</table>
	</div>
	<div id="table5">
	<table border="1">
		<tr>
			<td id="s"><input type="text" name="n33" id="n33"></td>
			<td id="s"><input type="text" name="n34" id="n34"></td>
			<td id="s"><input type="text" name="n35" id="n35"></td>
		</tr>
		<tr>
			<td id="s"><input type="text" name="n42" id="n42"></td>
			<td id="s"><input type="text" name="n43" id="n43"></td>
			<td id="s"><input type="text" name="n44" id="n44"></td>
		</tr>
		<tr>
			<td id="s"><input type="text" name="n51" id="n51"></td>
			<td id="s"><input type="text" name="n52" id="n52"></td>
			<td id="s"><input type="text" name="n53" id="n53"></td>
		</tr>
	</table>
	</div>
	
	<div id="table6">
	<table border="1">
		<tr>
			<td id="s"><input type="text" name="n54" id="n54"></td>
			<td id="s"><input type="text" name="n55" id="n55"></td>
			<td id="s"><input type="text" name="n56" id="n56"></td>
		</tr>
		<tr>
			<td id="s"><input type="text" name="n63" id="n63"></td>
			<td id="s"><input type="text" name="n64" id="n64"></td>
			<td id="s"><input type="text" name="n65" id="n65"></td>
		</tr>
		<tr>
			<td id="s"><input type="text" name="n72" id="n72"></td>
			<td id="s"><input type="text" name="n73" id="n73"></td>
			<td id="s"><input type="text" name="n74" id="n74"></td>
		</tr>
	</table>
	</div>
	<div id="table7">
	<table border="1">
		<tr>
			<td id="s"><input type="text" name="n57" id="n57"></td>
			<td id="s"><input type="text" name="n58" id="n58"></td>
			<td id="s"><input type="text" name="n59" id="n59"></td>
		</tr>
		<tr>
			<td id="s"><input type="text" name="n66" id="n66"></td>
			<td id="s"><input type="text" name="n67" id="n67"></td>
			<td id="s"><input type="text" name="n68" id="n68"></td>
		</tr>
		<tr>
			<td id="s"><input type="text" name="n75" id="n75"></td>
			<td id="s"><input type="text" name="n76" id="n76"></td>
			<td id="s"><input type="text" name="n77" id="n77"></td>
		</tr>
	</table>
	</div>
	<div id="table8">
	<table border="1">
		<tr>
			<td id="s"><input type="text" name="n60" id="n60"></td>
			<td id="s"><input type="text" name="n61" id="n61"></td>
			<td id="s"><input type="text" name="n62" id="n62"></td>
		</tr>
		<tr>
			<td id="s"><input type="text" name="n69" id="n69"></td>
			<td id="s"><input type="text" name="n70" id="n70"></td>
			<td id="s"><input type="text" name="n71" id="n71"></td>
		</tr>
		<tr>
			<td id="s"><input type="text" name="n78" id="n78"></td>
			<td id="s"><input type="text" name="n79" id="n79"></td>
			<td id="s"><input type="text" name="n80" id="n80"></td>
		</tr>
	</table>
	</div>
	
	
	<table style="width:700px;">
	<tr>
	<td style="width:330px;">
	<select name="level">
  		<option value="select" selected>select level</option>
        <option value="easy">Easy</option>
        <option value="moderate">Moderate</option>
        <option value="difficult">Difficult</option>
	</select> <input class="btn" type="button" onclick="startSudoku();" value="Start"> <input class="btn" type="reset" value="Reset"></td> 
	<td><input class="btn" type="button" onclick="showAnswer();" value="Answer"> <input class="btn" type="button" onclick="checkAnswer();" value="Check"></td>
	</tr>
	</table>
	
	</div>
	</form>
	
	<div id="space"></div>
</body>