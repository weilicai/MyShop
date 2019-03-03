function userlogin(){
	var x=$("#username").val();
	if (x==null || x==""){
	  alert("请先登录用户");
	  return false;
	  }
}