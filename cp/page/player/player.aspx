<%@ Page Language="C#"  MasterPageFile="~/cp/MasterPage.master"  AutoEventWireup="true" CodeFile="player.aspx.cs" Inherits="cp_page_player_player" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">PLAYER</li>
    </ol>
   
    <p></p>
    <table class="table table-bordered">
        <tbody >
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center"> Name</th>
                <th class="text-center">Dice</th>
                <th class="text-center">Total Step</th>
                <th class="text-center">Curent Step</th>
                <th class="text-center">User</th>
              
             <%-- <th colspan="2" class="text-center">Action</th>--%>
            </tr>
             <%for (int i = listplayer.Count - 1 ; i > -1; i-- )
                   {%>
            <tr>
                <td><%=listplayer[i].id%></td>
                  <td><%=listplayer[i].name%></td>
                  <td><%=listplayer[i].dice%></td>
                  <td><%=listplayer[i].total_step%></td>
                  <td><%=listplayer[i].curent_step%></td>
                  <td><%=GetUser(listplayer[i].user_id).full_name%></td>
               <%-- <td class="text-center">
                    <a class="btn btn-info" href="/cp/page/user/Edit-user.aspx?id=<%=listplayer[i].id %>">
                        <i class="fa fa-edit" style="font-size: 15px"></i>
                    </a>
                    <button class="btn" onclick="Delete(this,<%=listplayer[i].id%>)">
                        <i class="fa fa-trash" style="font-size: 25px;color:red;"></i>
                    </button>
                </td>--%>
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
