<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="usertype.aspx.cs" Inherits="cp_page_usertype_usertype" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">USERTYPE</li>
    </ol>
    <a class="btn btn-success" href="/cp/page/usertype/Add-usertype.aspx">Add Usertype</a>
    <p></p>
    <table class="table table-bordered">
        <tbody >
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center">Name</th>
                
                <th colspan="2" class="text-center">Action</th>
            </tr>
             <%for (int i = listusertype.Count - 1 ; i > -1; i-- )
                   {%>
            <tr>
                <td><%=listusertype[i].id%></td>
                  <td><%=listusertype[i].name%></td>
                  
                  
               <%-- <td>
                    <img src="<%=listplayer[i].Image %>" width="100%" />
                </td>--%>
                <td class="text-center">
                    <a class="btn btn-info" href="/cp/page/usertype/Edit-usertype.aspx?id=<%=listusertype[i].id %>">
                        <i class="fa fa-edit" style="font-size: 15px"></i>
                    </a>
                    <button class="btn" onclick="Delete(this,<%=listusertype[i].id%>)">
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
                    url: "/cp/do/usertype/delete-usertype.aspx",
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

