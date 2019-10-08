/**
 * 
 * @param method ����ʽ  "get"  "post"
 * @param uri ajax������·��
 * @param param  �������  "name=value&name=value"
 * @param success  ��������Ӧ�ص�xhr֮��ִ�еĺ�������.
 */
function zparkAjax(method,uri,param,success){
	//1. ����xhr
	var xhr = new XMLHttpRequest();
	//2. ����xhr�ͷ�����������
	if(method.toUpperCase()=="GET"){
		//����
		xhr.open(method,uri+"?"+param);
		xhr.send();
	}else if(method.toUpperCase()=="POST"){
		//post����
		xhr.open(method,uri);
		xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
		//��post������������
		xhr.send(param);
	}else{	
		alert("����ʽ����");
	}
	//3. �����post������������ͷ:
	//4. �����������post����param����send�����С�
	//5. ���ܷ���������Ӧ��������js����ִ�С�
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			//������Ӧ�����
			var r = xhr.responseText;
			//����r��������ִ����?
			success(r);//����success�����������ڣ�����r�����ִ��һЩ������
		}
	};
	
}