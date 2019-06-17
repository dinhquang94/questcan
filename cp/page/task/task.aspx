<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="task.aspx.cs" Inherits="cp_page_task_task" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Task</li>
    </ol>
    <a class="btn btn-success" href="/cp/page/task/Add-task.aspx">Add Task</a>
    <p></p>
    <table class="table table-bordered">
        <tbody >
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center">Title</th>
                <th class="text-center">Point</th>
                <th class="text-center">Start Time</th>
                 <th class="text-center">End Time</th> 
                 <th class="text-center">Latitude</th>
                <th class="text-center">Longitude</th>
                <th class="text-center">Type</th>
                <th class="text-center">Content</th>
                <th class="text-center">Description</th>
                <th colspan="2" class="text-center">Action</th>
            </tr>
             <%for (int i = listtask.Count - 1 ; i > -1; i-- )
                   {%>
            <tr>
                <td><%=listtask[i].id%></td>
                  <td><%=listtask[i].title%></td>
                <td><%=listtask[i].point%></td>
                <td><%=listtask[i].start_time%></td>
                 <td><%=listtask[i].end_time%></td>
                 <td><%=listtask[i].lat%></td>
                 <td><%=listtask[i].@long%></td>
                 <td><%=listtask[i].UserTypeTBx.name%></td>
                 <td><%=listtask[i].content%></td>
                 <td><%=listtask[i].description%></td>
                <td class="text-center">
                    <a class="btn btn-info" href="/cp/page/task/Edit-task.aspx?id=<%=listtask[i].id %>">
                        <i class="fa fa-edit" style="font-size: 15px"></i>
                    </a>
                    <button class="btn" onclick="Delete(this,<%=listtask[i].id%>)">
                        <i class="fa fa-trash" style="font-size: 25px;color:red;"></i>
                    </button>
                </td>
            </tr>
            <%} %>
        </tbody>
    </table>

     <script>
        function Delete(input, id) {
            alertify.confirm('Are you sure Delete', function () {
                $(input).prop("disabled", true);
                //ShowLoading();
                $.ajax({
                    url: "/cp/do/task/delete-task.aspx",
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

