<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${office.officename}--在线预约挂号系统</title>
    <jsp:include page="include/headtag.jsp"/>
</head>
<body>
<jsp:include page="include/head.jsp"/>
<jsp:include page="include/menu.jsp"/>

<div style="margin-top: 100px;margin-left: 300px">
    <div id="page-inner">

        <div class="search">
            <h1>科室详情</h1>
        </div>

        <div class="office-info">
            <h3 class="office-name">
                ${office.officename}
            </h3>
            <h2>科室简介</h2>
            <div>
                ${office.description}
            </div>
            <div>
                该科室有${office.doctornum}位医生
            </div>
        <style>
            .office-info{
                border-top: 2px solid #1E9EB9;
            }
            .office-info .office-name{
                border: 1px solid #E8E8E8;
                background: #F7FDFE;
            }
            .office-info h2{
                border: 1px solid #E8E8E8;
                background: #F7FDFE;
            }
        </style>
        </div>
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <td>序号</td>
                <td>诊室名称</td>
                <td>医生姓名</td>
                <td>医生职称</td>
                <td>医生性别</td>
                <td>医生出诊费(元)</td>
            </tr>
            </thead>
            <c:forEach var="item" items="${list1}" varStatus="statu">
                <tr>
                    <td>${statu.index+1}</td>
                    <td>${item.room}</td>
                    <td>${item.dname}</td>
                    <td>${item.career}</td>
                    <td>${item.gender}</td>
                    <td>${item.fee}</td>
                </tr>
            </c:forEach>
        </table>

    </div>
</div>

</body>
</html>
