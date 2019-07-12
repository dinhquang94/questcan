<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="cp_page_user_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">USER</li>
    </ol>
    <a class="btn btn-success" href="/cp/page/user/Add-user.aspx">Add User</a>
    <p></p>
        <div style="overflow-x:auto;">
    <table class="table table-bordered">
        <tbody >
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center">First Name</th>
                <th class="text-center">Last Name</th>
                <th class="text-center">Full Name</th>
                <th class="text-center">Email</th>
                <th class="text-center">Phone</th>
                <th class="text-center">BirthDay</th>
                <th class="text-center">Type User</th>
                <th class="text-center">Address</th>
                <th class="text-center">Credit</th>
                <th class="text-center">Last Login</th>
              <%--  <th class="text-center">Create Day</th>--%>
                <th colspan="2" class="text-center">Action</th>
            </tr>
             <%for (int i = listuser.Count - 1 ; i > -1; i-- )
                   {%>
            <tr>
                <td><%=listuser[i].id%></td>
                  <td><%=listuser[i].first_name%></td>
                  <td><%=listuser[i].last_name%></td>
                  <td><%=listuser[i].full_name%></td>
                  <td><%=listuser[i].email%></td>
                  <td><%=listuser[i].phone%></td>
                  <td><%=listuser[i].birthday%></td>


                  <td>
                      
                      <%for (int j = 0; j < listtype.Count; j++) {%>
                      
                      
                               <%if (listuser[i].typeuser_id == listtype[j].id) {%> 
                      
                                        <%=listtype[j].name %>
                              <%}%>

                      
                      <%} %>
                     
                  </td>





                  <td><%=listuser[i].address%></td>
                  <td><%=listuser[i].credit%></td>
                  <td><%=listuser[i].last_loginday%></td>
                 <%-- <td><%=listuser[i].create_day%></td>--%>
                  
               <%-- <td>
                    <img src="<%=listplayer[i].Image %>" width="100%" />
                </td>--%>
                <td class="text-center">
                    <a class="btn btn-info" href="/cp/page/user/Edit-user.aspx?id=<%=listuser[i].id %>">
                        <i class="fa fa-edit" style="font-size: 15px"></i>
                    </a>
                    <button class="btn" onclick="Delete(this,<%=listuser[i].id%>)">
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
                    url: "/cp/do/user/delete-user.aspx",
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

