<%@ page import="util.Util" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="bean.WorkDay" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线预约挂号系统（管理员)</title>
    <jsp:include page="include/headtag.jsp"/>
    <script src="<%=request.getContextPath()%>/scripts/laydate.dev.js" type="text/javascript"></script>

</head>
<body>
<jsp:include page="include/head.jsp"/>
<jsp:include page="include/menu.jsp"/>

<div style="margin-top: 100px;margin-left: 300px">
    <div id="page-inner">
        <div class="ysjs">
            <div class="title">
                <div class="t">
                    <span><a href="">${doctor.dname}</a></span>
                    <span class="gender">${doctor.gender}</span>
                    <span class="career">${doctor.career}</span>
                    <span class="career">${doctor.age}岁</span>
                </div>
                <div class="b">
                    <span>${doctor.office} （${doctor.room}）</span><span>出诊费：${doctor.fee}</span>
                </div>
                <img src="${doctor.picpath}">
            </div>
            <div class="content">
                <div >
                    <div>介绍：</div>
                    <div>${doctor.description}</div>
                </div>
            </div>
            <style>
                .ysjs{
                    margin: 20px ;
                    border-radius: 8px;
                    width: 680px;
                    border: 1px #000 solid;
                }
                .ysjs .title{
                    margin: 20px;
                    position: relative;
                }
                .ysjs .title:after{
                    visibility: hidden;
                    display: block;
                    font-size: 0;
                    content: "";
                    clear: both;
                    height: 0;
                }
                .ysjs .title .t span{
                    margin: 20px;
                    color: rgb(43,43,43);
                    font-size: 30px;
                    line-height: 30px;
                }
                .ysjs .title img{
                    position: absolute;
                    top: -20px;
                    left: 480px;
                    width: 100px;
                    height: 125px;
                }
                .ysjs .title .t .gender{
                    color:rgb(95, 156, 236);
                }
                .ysjs .title .t .career{
                    font-size: 17px;
                    margin-left: 30px;
                    color:rgb(61,175,167);
                }
                .ysjs .content {
                    border-top: 1px solid rgb(219, 219, 219);
                    margin: 30px;
                    text-align: left;
                    width: 640px;
                }
                .ysjs .content div{
                    padding-top: 10px;
                }
            </style>
        </div>
        <%--显示医生排班--%>
        <div class="schedule">
            <div class="week">
                <div class="ysjj1">
                    <div style="width: 30%;">
                        <div class="ysjj">
                            <div class="title1">医生介绍</div>
                            <img src="${doctor.picpath}">
                            <div class="title">
                                <div><span class="name">${doctor.dname}</span><span class="career">${doctor.career}</span><span class="gender">${doctor.gender}</span></div>
                                <p>介绍：${doctor.description}</p>
                            </div>
                            <div class="work">
                                <div>上午</div>
                                <div>下午</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="title2">
                    <%
                        List<WorkDay> workDays= (List<WorkDay>) request.getAttribute("workDays");
                        StringBuffer sb=new StringBuffer();
                        for(int i=0;i<7;i++){
                            sb.append("<ul><li class='date'>");
                            sb.append("星期");
                            if("0".equals(workDays.get(i*2).getWorktime())){
                                sb.append("天");
                            }else {
                                sb.append(workDays.get(i*2).getWorktime());
                            }
                            sb.append("</li>");
                            for(int j=0;j<2;j++){
                                sb.append("<li class='");
                                sb.append(workDays.get(i*2+j).getState());
                                sb.append("'><a style='display:block; height=100%' data-toggle=\"modal\" data-target=\"#myModal\" data-wid='");
                                sb.append(workDays.get(i*2+j).getWid());
                                sb.append("'><br>");
                                sb.append(workDays.get(i*2+j).getState());
                                sb.append("<br>号源数");
                                sb.append(workDays.get(i*2+j).getNsnum());
                                sb.append("</a></li>");
                            }
                            sb.append("</ul>");
                        }
                        out.write(sb.toString());
                    %>
                </div>
            </div>
            <style>
                .schedule{
                    text-align: center;
                    width: 80%;
                    border: 1px #0065AF solid;
                }
                .schedule:after{
                    content:"";
                    clear: both;
                    display: block;
                }
                .schedule .week {
                    float: left;
                    height: 250px;
                    width: 100%;
                }
                .schedule .week .title1{
                    font-size: 20px;
                }
                .schedule .week .title2{
                    width: 70%;
                }
                .schedule .week:after{
                    content: '';
                    clear: both;
                    display: block;
                }
                .ysjj{
                    width: 100%;
                    float: left;
                }
                .ysjj img{
                    width: 30%;
                    float: left;
                }
                .ysjj .title{
                    float: left;
                    width: 50%;
                    overflow: hidden;
                }
                .ysjj .title span{
                    float: left;
                    margin: 10px;
                }
                .ysjj .title .name{
                    font-size: 20px;
                }
                .ysjj .title .career{
                    font-size: 17px;
                }
                .ysjj .title .gender{
                    font-size: 15px;
                }
                .ysjj .title div:after{
                    content: '';
                    clear: both;
                    display: block;
                }
                .ysjj .title p{
                    height: 150px;
                    width: 110%;
                    overflow-y: scroll;
                }
                .ysjj .work{
                    float: left;
                    width: 20%;
                }
                .ysjj .work div{
                    width: 100%;
                    height: 100px;
                    line-height: 100px;
                    text-align: center;
                }
                .schedule .week .title2{
                    float: left;
                    height: 100%;
                }
                .schedule .week .title2 ul{
                    float: left;
                    height: 100%;
                    width: 14.2%;
                }
                .schedule .week .title2 ul li{
                    list-style: none;
                    background-color: #eeeeee;
                    height: 40%;
                    border-left: #0065AF 1px solid;
                }
                .schedule .week .title2 ul li:nth-of-type(even){
                    background: rgb(250, 250, 250);
                }
                .schedule .week .title2 .date{
                    height: 20%;
                    line-height: 3;
                }
                .schedule .week .title2 .预约{
                    background: rgb(219, 255, 211)!important;
                    color: rgb(61, 175, 167);
                    cursor: pointer;
                }
                .schedule .week .title2 .预约:hover{
                    color: rgb(255, 255, 255);
                    background: rgb(61, 175, 167)!important;
                }
                .schedule .week .title2 .停诊{
                    background: rgb(208, 222, 251)!important;
                    color: rgb(20, 82, 205)!important;
                }

                .schedule .week ul:after{
                    content: '';
                    clear: both;
                    display: block;
                }

                .work1{
                    width: 70%;
                    float: left;
                }
                .work1 ul li{
                    float: left;
                    list-style: none;
                    width: 12.303%;
                    height: 100px;
                    line-height: 100px;
                    text-align: center;
                    border: 1px dashed rgb(219, 219, 219);
                }
                .work1 ul li:nth-of-type(odd){
                    background: rgb(250, 250, 250);
                }
                .work1 ul .预约{
                    background: rgb(219, 255, 211)!important;
                    color: rgb(61, 175, 167);
                    cursor: pointer;
                }
                .work1 ul .预约:hover{
                    color: rgb(255, 255, 255);
                    background: rgb(61, 175, 167)!important;
                }
                .work1 ul .停诊{
                    background: rgb(208, 222, 251)!important;
                    color: rgb(20, 82, 205)!important;
                }
            </style>
            <%--修改排班--%>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" style="margin-top: 200px;" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">修改排班</h4>
                        </div>
                        <form class="form-horizontal" action='scheduleManage' method='post'>
                            <input id="action" hidden value="alter" name="action">
                            <input id="wid" hidden  name="wid">
                            <input  hidden  name="did" value="${doctor.did}">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="nsnum" class="col-sm-2 control-label">号源数</label>
                                    <div class="col-sm-10">
                                        <input name="nsnum" type="number" class="form-control" id="nsnum" placeholder="输入医生的号源数">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="state" class="col-sm-2 control-label">状态</label>
                                    <div class="col-sm-10" >
                                        <select class="form-control" id="state" name="state">
                                            <option>预约</option>
                                            <option>停诊</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button id="doalert" type="submit" class="btn btn-primary order">确定</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <script>
                $(function () {
                    $('#myModal').on('show.bs.modal', function (event) {
                        var  a=$(event.relatedTarget);
                        var wid =a .data('wid');
                        console.log(wid);
                        $("#wid").val(wid);
                    });
                })
            </script>
        </div>
    </div>
</div>

</body>
</html>
