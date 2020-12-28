<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="same/head.jsp" %>
<body>
<div class="row">
    <div class="col-md-2 col-md-offset-1"><h2>SSM-CRUD</h2></div>
</div>
<div class="row">
    <div class="col-md-4 col-md-offset-8">

        <button type="button" id='add_emp_butt' class="btn btn-success btn-primary btn-lg" data-toggle="modal" data-backdrop="static"
                data-target="#myModal" > 新增</button>
        <button type="button" class="btn btn-danger btn-primary btn-lg" id="delete_all_butt">删除</button>
    </div>
</div>
<br>
<div class="row">
    <div id="table_div" class="col-md-10 col-md-offset-1 ">
        <table class="table table-hover">
            <tr>
                <th><input type="checkbox" id="delete_all_checkbox" /></th>
                <th>#</th>
                <th>姓名</th>
                <th>邮箱</th>
                <th>年龄</th>
                <th>性别</th>
                <th>部门</th>
                <th>操作</th>
            </tr>
        </table>
    </div>
</div>
<div class="row">
    <div id="pageCount_div" class="col-md-6 col-md-offset-2">
    </div>
    <div id="pageNum_div" class="col-md-6 col-md-offset-6"></div>
</div>

<!-- 添加员工模态框 -->
<div class="modal fade" id="myModalAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span>
                </button>
                <h4 class="modal-title" id="myModalLabel_add">添加员工</h4>
            </div>
            <div class="modal-body">
                <form id="emp_form" class="form-horizontal">

                    <div id="lastname_div" class="form-group">
                        <label  class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="lastname_id" name="eName" placeholder="lastname"/>
                            <label class="control-label" id="lastname_msg" labelId="msg_show" ><</label>
                        </div>
                     </div>

                        <div id="email_div" class="form-group">
                            <label  class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="email_id"  name="eEmail" placeholder="email">
                                <label class="control-label" id="email_msg" labelId="msg_show" ></label>
                            </div>
                        </div>

                         <div id="eage_div" class="form-group">
                             <label  class="col-sm-2 control-label">年龄</label>
                             <div class="col-sm-10">
                                    <input type="text" class="form-control" id="eage_id" name="eAge" placeholder="age"/>
                                    <label class="control-label" labelId="msg_show" ></label>
                             </div>
                          </div>
                        <%--性别--%>
                        <div class="form-group">
                            <label for="esax_id" class="col-sm-2 control-label">年龄</label>
                                <div class="col-sm-10">
                                    <label class="radio-inline">
                                        <input type="radio" name="eSax" id="esax_id" value="男" checked="checked">男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="eSax"  value="女">女
                                    </label>
                              </div>
                        </div>
                        <%--部门下拉列表--%>
                        <div class="form-group">
                            <label for="did_id" class="col-sm-2 control-label">部门</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="did_id" name="dId">
                                </select>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            <button type="submit" id="emp_submit" class="btn btn-info">保存</button>
                        </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%--修改员工的模态框--%>
<div class="modal fade" id="myModalUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span>
                </button>
                <h4 class="modal-title" id="myModalLabel_update">修改员工</h4>
            </div>
            <div class="modal-body">
                <form id="emp_update_form" class="form-horizontal">
                    <div id="lastname_update_div" class="form-group">
                        <label  class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="lastname_update_id"></p>
                        </div>
                    </div>

                    <div id="email_update_div" class="form-group">
                        <label  class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="email_update_id"  name="eEmail" placeholder="email">
                            <label class="control-label" id="email_update_msg" labelId="msg_show" ></label>
                        </div>
                    </div>

                    <div id="eage_update_div" class="form-group">
                        <label  class="col-sm-2 control-label">年龄</label>
                        <div class="col-sm-10">
                        <input type="text" class="form-control" id="eage_update_id" name="eAge" placeholder="age"/>
                        <label class="control-label" labelId="msg_show" ></label>
                    </div>
                    </div>
                    <%--性别--%>
                    <div class="form-group">
                        <label for="esax_update_id" class="col-sm-2 control-label">年龄</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="eSax" id="esax_update_id" value="男" checked="checked">男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="eSax"  value="女">女
                            </label>
                        </div>
                    </div>
                    <%--部门下拉列表--%>
                    <div class="form-group">
                        <label for="select_update_id" class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="select_update_id" name="dId">
                            </select>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        <button type="submit" id="emp_update_submit" class="btn btn-info">保存</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var pages;
    $(function () {
        get_page(1);
    });

    function get_page(pn) {
        $.ajax({
            url: "emps",
            type: "GET",
            data: "pn=" + pn,
            dataType: "json",
            success: function (result) {
                /**
                 * {"code":100,"msg":{"emps":[{"eId":1,"eName":"李四","eAge":18,"eSax":"男","dId":1,
                 * "dep": {"dId":1,"dName":"养老部"}},{"eId":2,"eName":"王五","eAge":19,"eSax":"男","dId":2,
                 * "dep":{"dId":2,"dName":"娱乐部"}},{"eId":3,"eName":"bcac80","eAge":18,"eSax":"男",
                 * "dId":1,"dep":{"dId":1,"dName":"养老部"}},{"eId":4,"eName":"52dd31","eAge":18,"eSax":"男","dId":1,
                 * "dep":{"dId":1,"dName":"养老部"}},{"eId":5,"eName":"2aeb22","eAge":18,"eSax":"男","dId":1,
                 * "dep":{"dId":1,"dName":"养老部"}}]}}
                 */
                //清空之前获取的数据
                $("table tr:gt(0)").empty();
                $("#pageCount_div").empty();
                $("#pageNum_div").empty();

                var emps = result.msg.emps;
                for (var i = 0; i < emps.length; i++) {
                    //添加全选框
                    var delete_checkbox = $("<input type='checkbox' class='deleteEmpCkeck'/>");
                    var updateButt = $("<button type='button' class='btn btn-info  update-butt' updateEmpId='"+emps[i].eId+"' aria-label='Left Align'></button>").append("<span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\">修改</span>");
                    var deleteButt = $("<button type=\"button\" class=\"btn btn-danger delete-butt\" deleteEmpId='"+ emps[i].eId +"' aria-label='Left Align'></button>").append("<span class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\">删除</span>");
                    $("<tr></tr>").append($("<td></td>").append(delete_checkbox))
                                  .append("<td>" + emps[i].eId + "</td>")
                                  .append("<td>" + emps[i].eName + "</td>")
                                  .append("<td>" + emps[i].eEmail + "</td>")
                                  .append("<td>" + emps[i].eAge + "</td>")
                                  .append("<td>" + emps[i].eSax + "</td>")
                                  .append("<td>" + emps[i].dep.dName + "</td>")
                                  .append($("<td></td>").append(updateButt).append("&nbsp;").append(deleteButt))
                                  .appendTo("table");
                }
                pages = result.msg.pageMessage.pages + 1;
                $("#pageCount_div").append("当前第<kbd>" + result.msg.pageMessage.pageNum + "</kbd>页,共有<kbd>" + result.msg.pageMessage.pages + "</kbd>页,总计<kbd>" + result.msg.pageMessage.pageTotal + "</kbd>条记录");
                $("#pageNum_div").append(result.msg.page);
                //给每一个a标签绑定单击事件
                $("ul").find("a").click(function () {
                    get_page($(this).attr("page"));
                    return false;
                });
            }
        })
    }

    $("#add_emp_butt").click(function () {
        //发送ajax请求获取下拉列表
        getDeps("[name=dId]");
        //清空表单信息
        $("form")[0].reset();
        error_msg("#lastname_div","succeed","");
        error_msg("#email_div","succeed","");
        //彈出模态框
        $("#myModalAdd").modal({
            backdrop: "static"
        })
    });

    function getDeps(label) {
        $.ajax({
            url: "deps",
            type: "GET",
            dataType: "json",
            success: function (result) {
                //alert(result);
                //获取所有部门信息，并创建下拉列表
                //{"code":100,"msg":{"deps":[{"dId":1,"dName":"养老部"},{"dId":2,"dName":"娱乐部"}]}}
                var deps = result.msg.deps;
                var select = $(label).empty();
                for (var i = 0; i < deps.length; i++) {
                    select.append($("<option>" + deps[i].dName + "</option>").attr("value", deps[i].dId))
                }
            }
        });
    }

    function get_deps_selert(result) {
        //{"code":100,"msg":{"deps":[{"dId":1,"dName":"养老部"},{"dId":2,"dName":"娱乐部"}]}}
        var deps = result.msg.deps;
        var select = $("[name=dId]").empty();
        for (var i = 0; i < deps.length; i++) {
            select.append($("<option>" + deps[i].dName + "</option>").attr("value", deps[i].dId))
        }
    }
    //表单信息校验
    $("#emp_form").submit(function () {
        // alert(1111111);
        var name = $("#lastname_id").val();
        var regExp = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,6}$)/;

        if (!regExp.test(name)) {
            error_msg("#lastname_div","error","姓名必须由6-16位字母下划线或2-6位汉字组成");
            return false;
        }else {
            error_msg("#lastname_div","succeed","")
        }
        var eamil = $("#email_id").val();
        regExp = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regExp.test(eamil)) {
            error_msg("#email_div","error","邮箱格式错误");
            return false;
        }else {
            error_msg("#email_div","succeed","")
        }

        var age = $("#eage_id").val();
        regExp = /^(?:[1-9][0-9]?|1[01][0-9]|120)$/;
        if (!regExp.test(age)){
            error_msg("#eage_div","error","年龄不合法范围是1-120");
            return false;
        }else {
            error_msg("#eage_div","succeed","");
        }

        //发送ajax请求添加用户
        add_emp_ajax();

        return false;
    });

    //显示错误信息
    function error_msg(label,msg,text,style){
        var showMsg = $(label).find("label[labelId='msg_show']");

        if ("succeed" == msg){
            $(label).removeClass("has-error");
            showMsg.text(text).attr("style",style);
        }
        if ("error" == msg){
            $(label).addClass("form-group has-error");
            showMsg.text(text).attr("style","");
        }
    }

    //添加员工并跳转到最后一页
    function add_emp_ajax() {
        var formString = $("#emp_form").serialize();
        //alert(formString);
        $.ajax({
            url:"emp",
            type:"POST",
            data:formString,
            dataType:"json",
            success:function (result) {
                // console.log(result);
                if (result.code == 100){
                    $('#myModalAdd').modal('hide');
                    get_page(pages);
                }else {
                    if (result.msg.error.userNameErr != undefined){
                        error_msg("#lastname_div","error",result.msg.error.userNameErr);
                    } else {
                        if (result.msg.error.eEmail != undefined){
                            var emailErr = result.msg.error.eEmail;
                            error_msg("#email_div","error",emailErr);
                        }
                        if (result.msg.error.eName != undefined){
                            var nameErr = result.msg.error.eName;
                            error_msg("#lastname_div","error",nameErr);
                        }
                        if (result.msg.error.eAge != undefined){
                            error_msg("#eage_div","error",result.msg.error.eAge);
                        }
                    }
                }
            }
        });
    }
    //校验用户名是否可用
    $("#lastname_id").change(function () {
        var value = this.value;
        var name = $(this).attr("name");
        $.ajax({
            url:"checkUserName",
            type:"GET",
            data: name + "=" + value,
            dataType:"json",
            success:function (result) {
                if (result.code == 100){
                    error_msg("#lastname_div","succeed","用户名可用","color: #5bc0de");
                }else {
                    if (result.msg.error != undefined ){
                        error_msg("#lastname_div","error",result.msg.error);
                    }else {
                        error_msg("#lastname_div","error","用户名不可用");
                    }
                }
            }
        })
    });
    //为所有的修改按钮绑定单击事件
    $(document).on("click",".update-butt",function () {
        //获取部门信息
        getDeps("#select_update_id");
        //获去要修改的员工的信息
        getEmp($(this).attr("updateEmpid"));
        //保存当前要修改的员工的id
        $("#emp_update_submit").attr("empId",$(this).attr("updateEmpid"));
        //弹出修改员工的模态框
        $("#myModalUpdate").modal({
            backdrop: "static"
        })
    });
    //表单回显
    function getEmp(id) {
        $.ajax({
            url:"emp/" + id,
            type:"GET",
            dataType:"json",
            success:function (result) {
                var emp = result.msg.emp;
                $("#lastname_update_id").text(emp.eName);
                $("#email_update_id").val(emp.eEmail);
                $("#eage_update_id").val(emp.eAge);
                $("#myModalUpdate :radio").val([emp.eSax]);
                $("#select_update_id").val([emp.dId]);
            }
        });
    }
    //修改员工表单提交验证
    $("#emp_update_submit").click(function () {
        //验证邮箱是否合法
        var eamil = $("#email_update_id").val();
        var regExp = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regExp.test(eamil)) {
            error_msg("#email_update_div","error","邮箱格式错误");
            return false;
        }else {
            error_msg("#email_update_div","succeed","")
        }
        //验证年领是否合法
        var age = $("#eage_update_id").val();
        regExp = /^(?:[1-9][0-9]?|1[01][0-9]|120)$/;
        if (!regExp.test(age)){
            error_msg("#eage_update_div","error","年龄不合法范围是1-120");
            return false;
        }else {
            error_msg("#eage_update_div","succeed","");
        }
        //发送ajax请求修改员工信息
        var formString = $("#emp_update_form").serialize();
        updateEmp(formString);
        return false;
    });
    //发送请求保存修改的员工信息
    function updateEmp(formString) {
        console.log(formString);
        $.ajax({
            url:"emp/" + $("#emp_update_submit").attr("empId"),
            type:"PUT",
            data:formString,
            success:function (result) {
                    $("#myModalUpdate").modal('hide');
                    get_page($("#span_page").attr("spanPageNum"));
            }
        });
    }
    //为所有删除按钮绑定单击事件
    $(document).on("click",".delete-butt",function () {
        if (confirm("确定要删除[" + $(this).parent().parent().find("td:eq(2)").text() + "]员工吗?")){
            //删除员工
            delete_emp_ajax($(this).attr("deleteEmpId"));
        }
    });
    function delete_emp_ajax(ids){
        $.ajax({
            url:"emp/" + ids,
            type:"DELETE",
            success:function (result) {
                get_page($("#span_page").attr("spanPageNum"));
                $("#delete_all_checkbox").prop("checked","");
            }
        });
    }
    //全选/全不选
    $("#delete_all_checkbox").click(function () {
        $(".deleteEmpCkeck").prop("checked",$(this).prop("checked"));
    });
    //为每一个复选框绑定单击事件
    $(document).on("click",".deleteEmpCkeck",function () {
        var checkCount = $(".deleteEmpCkeck").length;
        var checkedCount = $(".deleteEmpCkeck:checked").length;
        if (checkCount == checkedCount){
            $("#delete_all_checkbox").prop("checked","checked");
        }else {
            $("#delete_all_checkbox").prop("checked","");
        }
    });
    //批量删除
    $("#delete_all_butt").click(function () {
        if (confirm("确定要删除[" + get_emps_name() + "]吗？")){
            var ids = get_ids();
            //删除所选员工
            // delete_batch_emp(ids);
            delete_emp_ajax(ids);
        }
    });
    //获取所有选中的员工姓名
    function get_emps_name() {
        var empArr = $(".deleteEmpCkeck:checked");
        var emps = "";
        $.each(empArr,function () {
            emps += $(this).parent().next().next().text() + ",";
        });
        emps = emps.substring(0,emps.length-1);
        return emps;
    }
    //获取所有选中的员工id
    // function get_ids() {
    //     var items = $(".deleteEmpCkeck:checked");
    //     var ids = "";
    //     for (var i = 0; i<items.length; i++){
    //         if (i == idArr.length - 1){
    //             ids += ("eId=" + $(items[i]).parent().next().text());
    //         }else {
    //             ids += ("eId=" + $(items[i]).parent().next().text() + "&");
    //         }
    //     }
    //     return ids;
    // }
    function get_ids() {
        var items = $(".deleteEmpCkeck:checked");
        var ids = "";
        for (var i = 0; i<items.length; i++){
            if (i == items.length - 1){
                ids += $(items[i]).parent().next().text();
            }else {
                ids += ( $(items[i]).parent().next().text() + "-");
            }
        }
        return ids;
    }
    // function delete_batch_emp(ids) {
    //     $.ajax({
    //         url:"emps",
    //         type:"POST",
    //         data: ids + "&_method=DELETE",
    //         success:function (result) {
    //             //刷新页面
    //             get_page($("#span_page").attr("spanPageNum"));
    //             $("#delete_all_checkbox").prop("checked","");
    //         }
    //     });
    // }


    </script>
</body>
</html>
