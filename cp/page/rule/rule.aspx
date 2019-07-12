<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="rule.aspx.cs" Inherits="cp_page_rule_rule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Rule</li>
    </ol>
    <a class="btn btn-success" href="/cp/page/rule/Add-rule.aspx">Add Rule</a>
    <p></p>
    <div style="overflow-x: auto;">
        <table class="table table-bordered">
            <tbody>
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">Name</th>
                    <th class="text-center">Task</th>
                    <th class="text-center">Point</th>
                    <th class="text-center">Step</th>
                    <th class="text-center">Content</th>
                    <th class="text-center">Check</th>

                    <th colspan="2" class="text-center">Action</th>
                </tr>
                <%for (int i = listrule.Count - 1; i > -1; i--)
                    {%>
                <tr>
                    <td><%=listrule[i].id%></td>
                    <td><%=listrule[i].name%></td>
                    <td>
                        <%for (int j = 0; j < listtask.Count; j++)
                            {%>
                        <%if (listrule[i].task_id == listtask[j].id)
                            {%>
                        <%=listtask[j].title %>

                        <%} %>

                        <%} %>
                    </td>
                    <td><%=listrule[i].point%></td>
                    <td><%=listrule[i].step%></td>
                    <td><%=listrule[i].content%></td>
                    <td><%=listrule[i].description%></td>
                    <td class="text-center">
                        <a class="btn btn-info" href="/cp/page/rule/Edit-rule.aspx?id=<%=listrule[i].id %>">
                            <i class="fa fa-edit" style="font-size: 15px"></i>
                        </a>
                        <button class="btn" onclick="Delete(this,<%=listrule[i].id%>)">
                            <i class="fa fa-trash" style="font-size: 25px; color: red;"></i>
                        </button>
                    </td>
                </tr>
                <%} %>
            </tbody>
        </table>
    </div>
    <script>
        function Delete(input, id) {
            alertify.confirm('Are you sure Delete', function () {
                $(input).prop("disabled", true);
                //ShowLoading();
                $.ajax({
                    url: "/cp/do/rule/delete-rule.aspx",
                    method: "post",
                    data: {
                        id: id
                    },
                    success: function (data) {
                        data = JSON.parse(data);
                        if (data.success == -1) {
                            console.log(data.error);
                            swal("Error. Please try again");
                        } else {
                            swal("Delete Success!");
                            location.reload();
                        }
                        $(input).prop("disabled", true);
                        //HideLoading();
                    },
                    error: function (error) {
                        console.log(error);
                        swal("Error. Please try again");
                        $(input).prop("disabled", true);
                        //HideLoading();
                    }
                })
            })
        }
    </script>
</asp:Content>


