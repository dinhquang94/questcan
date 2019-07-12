<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="usertask.aspx.cs" Inherits="cp_page_usertask_usertask" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Usertask</li>
    </ol>
    <a class="btn btn-success" href="/cp/page/usertask/Add-usertask.aspx">Add Usertask</a>
    <p></p>
     <div style="overflow-x:auto;">
    <table class="table table-bordered">
        <tbody >
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center">Task Name</th>
                <th class="text-center">User Name</th>
                <th colspan="2" class="text-center">Action</th>
            </tr>
             <%for (int i = listusertask.Count - 1 ; i > -1; i-- )
                   {%>
            <tr>
                <td><%=listusertask[i].id %></td>
                  <td>
                      <%for (int j = 0; j < listtask.Count; j++)
                          {%>
                            <%if (listtask[j].id == listusertask[i].task_id)
                                {%>
                                        <%=listtask[j].title%>
                                <%}%>

                          <%} %>
                  </td>

                <td>
                      <%for (int k = 0; k < listuser.Count; k++)
                          {%>
                            <%if (listuser[k].id == listusertask[i].user_id)
                                {%>
                                        <%=listuser[k].full_name %>
                                <%}%>

                          <%} %>
                 </td>
        
                  
               <%-- <td>
                    <img src="<%=listplayer[i].Image %>" width="100%" />
                </td>--%>
                <td class="text-center">
                    <a class="btn btn-info" href="/cp/page/usertask/Edit-usertask.aspx?id=<%=listusertask[i].id %>">
                        <i class="fa fa-edit" style="font-size: 15px"></i>
                    </a>
                    <button class="btn" onclick="Delete(this,<%=listusertask[i].id%>)">
                        <i class="fa fa-trash" style="font-size: 25px;color:red;"></i>
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
                    url: "/cp/do/usertask/delete-usertask.aspx",
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

