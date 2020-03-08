<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="bean.WorkDay" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>首页--在线预约挂号系统</title>
    <jsp:include page="include/headtag.jsp"/>
</head>
<body>
<jsp:include page="include/head.jsp"/>
<jsp:include page="include/menu.jsp"/>

<div style="margin-top: 100px;margin-left: 300px">
    <div id="page-inner">
        <div class="container">
            <div class="h3 alert-info ">修改密码</div>
            <div class="col-lg-8">
                <form class=" form-horizontal" action="<%=request.getContextPath()%>/modifyBaseInfo"  method="post">
                    <div class="h3 alert-danger ">${message}</div>
                    <input hidden name="action" value="patient">
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input name="email"  required value=${email}  type="text" class="form-control" id="email" placeholder="邮箱">
                            <span style="color: red">*</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input name="name" required type="text"  value=${name} class="form-control" id="name" placeholder="姓名">
                            <span style="color: red">*</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="idcard" class="col-sm-2 control-label">身份证</label>
                        <div class="col-sm-10">
                            <input name="idcard" required value=${idcard} type="text" class="form-control" id="idcard" placeholder="身份证">
                            <span style="color: red">*</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-sm-2 control-label">联系方式</label>
                        <div class="col-sm-10">
                            <input name="phone" required value=${phone} type="text" class="form-control" id="phone" placeholder="联系方式">
                            <span style="color: red">*</span>
                        </div>
                    </div>
                    <div class="row">
                        <button type="submit" class="btn btn-primary  center-block" style="width: 150px" data-toggle="modal" data-target="#myModal">确定</button>
                    </div>
                </form>
            </div>

        </div>

    </div>
</div>

</body>
</html>
