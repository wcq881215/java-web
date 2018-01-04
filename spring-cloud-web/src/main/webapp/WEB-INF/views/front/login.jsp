<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>登陆</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="正大海工" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Bootstrap Core CSS -->
    <link href="/front/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <!-- Custom CSS -->
    <link href="/front/css/style.css" rel='stylesheet' type='text/css' />
    <link href="/front/css/font-awesome.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="/front/js/jquery.min.js"></script>
    <!----webfonts--->
    <!---//webfonts--->
    <!-- Bootstrap Core JavaScript -->
    <script src="/front/js/bootstrap.min.js"></script>
</head>
<body id="login">
<div class="login-logo">
    <a href="index.html"><img src="/images/default_photo.png" alt=""/></a>
</div>
<h2 class="form-heading">login</h2>
<div class="app-cam">
    <form>
        <input type="text" class="text" value="" placeholder="用户名" onFocus="this.value = '';" onBlur="if (this.value == '') {alert('请输入用户名');}">
        <input type="password" value="" placeholder="密码" onFocus="this.value = '';" onBlur="if (this.value == '') {alert('请输入密码');}">
        <div class="submit"><input type="submit" onClick="myFunction()" value="登陆"></div>
    </form>
</div>

</body>
</html>
