<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>新增员工信息</title>
    <link href="/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="/css/employee.css" rel="stylesheet" type="text/css"/>
</head>

<body>

<div class="place">
    <span>位置:</span>
    <ul class="placeul">
        <li><a href="index.html">首页</a></li>
        <li><a href="addjob.html">新增员工</a></li>
    </ul>
</div>

<div class="formbody">

    <div class="formtitle"><span>员工信息</span></div>
    <form id="add_form" method="post">
        <ul class="forminfo">
            <li><label>员工姓名</label><input name="name" type="text" class="dfinput""/><i
                    class="required">*</i></li>
            <li>
                <label>部门</label>
                <select name="depId">
                    <#list departments as i>
                        <option value="${i.id}">${i.depName}</option>
                    </#list>
                </select>
                <i style="color: red;">*</i>
            </li>
            <li>
                <label>职位</label>
                <select name="careerId">
                    <#list careers as i>
                        <option value="${i.id}">${i.careerName}</option>
                    </#list>
                </select>
                <i class="required">*</i>
            </li>
            <li>
                <label>性别</label>
                <select name="sex">
                    <option value="男" selected>&nbsp;&nbsp;男&nbsp;</option>
                    <option value="女">&nbsp;&nbsp;女&nbsp;</option>
                </select>
                <i class="required">*</i>
            </li>
            <li><label>年龄</label><input name="age" type="text" class="dfinput" style="width: 100px;"/><i>输入整数</i>
            </li>
            <li><label>电话</label><input name="tel" type="text" class="dfinput"/></li>
            <li><label>邮箱</label><input name="email" type="text" class="dfinput"/></li>
            <li><label>住址</label><input name="address" type="text" class="dfinput"/></li>
            <li><label>&nbsp;</label><input name="" type="button" class="btn" value="确认增加" onclick="mysubmit()"/></li>
        </ul>
    </form>

</div>
</body>
</html>
<script language="JavaScript" src="/js/jquery.js"></script>
<script>
    function mysubmit() {
        $.ajax({
            dataType: "json",
            type: "post",
            url: "/employee/do_add",
            data: $("#add_form").serialize(),
            success: function (result) {
                if (result.code === 200) {
                    alert("保存成功")
                } else {
                    alert("保存失败")
                }
            }
        })
    }
</script>
