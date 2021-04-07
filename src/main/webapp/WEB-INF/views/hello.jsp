<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title>Hello world</title>
    <script type="text/javascript" src="../../static/jquery-1.12.4.min.js"></script>
</head>
<body>
<div>
    <div style="font-weight: bold;font-size: 15px">����׼��</div>
    <input id="num" type="text" placeholder="��ȡ����" name="����" value="100">
    <button type="button" title="С��" onclick="spiderA()">С��</button>
    <button type="button" title="ˮ��" onclick="spiderB()">ˮ��</button>
    <span style="margin-left: 50">
    <button type="button" title="�����ֵ�" onclick="creatDic()">�����ֵ�</button>
    </span>
</div>
<div>
    <div style="font-weight: bold;font-size: 15px">�ʴ�ģ��</div>
    <input id="question" type="text" placeholder="����������">
    <span style="margin-left: 20px">
    <button type="button" title="��ѯ" onclick="participle()">��ѯ</button>
    </span>
    <div>
        <textarea cols="43" rows="20" id="testArea"></textarea>
    </div>
</div>
<div>
    <div style="font-weight: bold;font-size: 15px">��ʾ�ʾ�</div>
    <textarea cols="43" rows="20" readonly="readonly"
              id="testArea2"></textarea>
</div>


</body>
<script>
    $("#testArea2").val("����������С�����\n���ﾩ��244��������������\n����Ϊ�㶫��������\n���Ϊ110��������\nǧ����Ϊ38.0��������\nϵ��Ϊ����7�ŵ�������\n���������ﾩ��244\nʲô�Ǿ���244");
    function spiderA() {
        if (!/^\d+$/.test($("#num").val())) {
            alert("������������");
            return;
        }
        $.ajax({
            url: "/magic/spider/wheat?num=" + $("#num").val(),
            type: "get",
            error: function (err) {
                console.log(err);
            },
            success: function (reply) {
                console.log(reply);
            }
        });
    }

    function spiderB() {
        if (!/^\d+$/.test($("#num").val())) {
            alert("������������");
            return;
        }
        $.ajax({
            url: "/magic/spider/rice?num=" + $("#num").val(),
            type: "get",
            error: function (err) {
                console.log(err);
            },
            success: function (reply) {
                console.log(reply);
            }
        });
    }

    function creatDic() {
        $.ajax({
            url: "/front/creatDic",
            type: "get",
            error: function (err) {
                console.log(err);
            },
            success: function (reply) {
                console.log(reply);
            }
        });
    }

    function participle() {
        $("#testArea").val("��ѯ��,��ȴ�...........");
        $.ajax({
            url: "/front/participle?question=" + encodeURI(encodeURI($("#question").val())),
            type: "get",
            error: function (err) {
                console.log(err);
            },
            success: function (reply) {
                $("#testArea").val(reply);
            }
        });
    }
</script>
</html>
