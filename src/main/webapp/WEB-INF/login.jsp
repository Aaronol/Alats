<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>XXXϵͳ</title>
    <link rel="stylesheet" media="screen" href="../../static/css/style.css">
    <link rel="stylesheet" type="text/css" href="../../static/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="../../static/css/layui.css">
    <link rel="stylesheet" type="text/css" href="../../static/css/common.css">
    <link rel="stylesheet" type="text/css" href="../../static/css/modules/code.css">
    <link rel="stylesheet" type="text/css" href="../../static/css/modules/laydate/default/laydate.css">
    <link rel="stylesheet" type="text/css" href="../../static/css/modules/layer/default/layer.css">
</head>
<body>

<div id="particles-js">
    <form class="login" id="loginform" onsubmit="return validate_required(this)" action="check" method="post">
        <div class="login-top">
            ��¼
        </div>
        <div class="login-center clearfix">
            <div class="login-center-img"><img src="../../static/img/name.png"/></div>
            <div class="login-center-input">
                <input type="text" id="username" name="username" value="" placeholder="�����������û���"
                       onfocus="this.placeholder=''"
                       onblur="this.placeholder='�����������û���'"/>
                <div class="login-center-input-text">�û���</div>
            </div>
        </div>
        <div class="login-center clearfix">
            <div class="login-center-img"><img src="../../static/img/password.png"/></div>
            <div class="login-center-input">
                <input type="password" id="password" name="password" value="" placeholder="��������������"
                       onfocus="this.placeholder=''" onblur="this.placeholder='��������������'"/>
                <div class="login-center-input-text">����</div>
            </div>
        </div>
        <label style="margin-left: 100px">
            <input id="admin" type="radio" name="roleid" value="0" checked/> ����Ա
        </label>
        <label style="margin-left: 45px">
            <input id="user" type="radio" name="roleid" value="1"/> �û�
        </label>
        <button class="login-button" style="margin-left: 50px" id="loginButton" type="submit">
            ��¼
        </button>
    </form>
    <div class="sk-rotating-plane"></div>
</div>

<!-- scripts -->
<script type="text/javascript" src="../../static/js/layui.js"></script>
<script src="../../static/js/jquery-1.12.4.min.js"></script>
<script src="../../static/js/json2.js"></script>
<script src="../../static/js/particles.min.js"></script>
<script src="../../static/js/app.js"></script>

<script type="text/javascript">
    function hasClass(elem, cls) {
        cls = cls || '';
        if (cls.replace(/\s/g, '').length == 0) return false; //��clsû�в���ʱ������false
        return new RegExp(' ' + cls + ' ').test(' ' + elem.className + ' ');
    }

    function addClass(ele, cls) {
        if (!hasClass(ele, cls)) {
            ele.className = ele.className == '' ? cls : ele.className + ' ' + cls;
        }
    }

    function removeClass(ele, cls) {
        if (hasClass(ele, cls)) {
            var newClass = ' ' + ele.className.replace(/[\t\r\n]/g, '') + ' ';
            while (newClass.indexOf(' ' + cls + ' ') >= 0) {
                newClass = newClass.replace(' ' + cls + ' ', ' ');
            }
            ele.className = newClass.replace(/^\s+|\s+$/g, '');
        }
    }

    function onButtonClick() {
        addClass(document.querySelector(".login"), "active")
        setTimeout(function () {
            addClass(document.querySelector(".sk-rotating-plane"), "active")
            document.querySelector(".login").style.display = "none"
        }, 800);
    }

    function loginFormRecover() {
        removeClass(document.querySelector(".login"), "active")
        removeClass(document.querySelector(".sk-rotating-plane"), "active")
        document.querySelector(".login").style.display = "block"
    }

    var error = "${error}";
    if (error == "error") {
        layer.alert('�ʻ������������');
    }

    function validate_required(field) {
        onButtonClick();
        while (field) {
            if (!$(field[0]).val()) {
                layer.alert('������д�û���!', function (index) {
                    $("#username").focus();
                    loginFormRecover();
                    layer.close(index);
                });
                return false;
            } else if (!$(field[1]).val()) {
                layer.alert('������д����!', function (index) {
                    $("#username").focus();
                    loginFormRecover();
                    layer.close(index);
                });
                return false;
            } else {
                return true;
            }
        }
        return false;
    }

</script>
</body>
</html>
