/**
 * 
 * @param method 请求方式  "get"  "post"
 * @param uri ajax的请求路径
 * @param param  请求参数  "name=value&name=value"
 * @param success  服务器响应回到xhr之后执行的函数代码.
 */
function zparkAjax(method,uri,param,success){
	//1. 创建xhr
	var xhr = new XMLHttpRequest();
	//2. 建立xhr和服务器的连接
	if(method.toUpperCase()=="GET"){
		//请求
		xhr.open(method,uri+"?"+param);
		xhr.send();
	}else if(method.toUpperCase()=="POST"){
		//post请求
		xhr.open(method,uri);
		xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
		//绑定post请求的请求参数
		xhr.send(param);
	}else{	
		alert("请求方式错误");
	}
	//3. 如果是post请求，设置请求头:
	//4. 发送请求。如果post请求。param方法send方法中。
	//5. 接受服务器的响应，并作出js代码执行。
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			//接受响应结果，
			var r = xhr.responseText;
			//根据r，做代码执行了?
			success(r);//调用success函数，函数内，根据r结果，执行一些操作。
		}
	};
	
}