<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="game.aspx.cs" Inherits="cp_page_game_game" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Game</li>
    </ol>
    <a class="btn btn-success" href="/cp/page/game/Add-game.aspx">Add Game</a>
    <p></p>
     <div style="overflow-x:auto;">
    <table class="table table-bordered">
        <tbody>
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center">Name</th>
                <th class="text-center" width="200px">Banner</th>
                 <th class="text-center">Link</th>
                <th class="text-center">Description</th>
                <th class="text-center">Content</th>
                <th colspan="2" class="text-center">Action</th>
            </tr>
            <%foreach (var i in listgame)
                {
            %>
            <tr>
                <td><%=i.id%></td>
                <td><%=i.name%></td>
                <td>
                    <img src="<%=i.banner %>" width="100%" />
                </td>
                <td><%=i.link %></td>
                <td><%=i.description %></td>
                <td><%=i.content %></td>
                <td class="text-center">
                    <a class="btn btn-info" href="/cp/page/game/Edit-game.aspx?id=<%=i.id %>">
                        <i class="fa fa-edit" style="font-size: 15px"></i>
                    </a>
                    <button class="btn" onclick="Delete(this,<%=i.id%>)">
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
                    url: "/cp/do/game/delete-game.aspx",
                    method: "post",
                    data: {
                        id: id
                    },
                    success: function (data) {
                        data = JSON.parse(data);
                        if (data.success == -1) {
                            console.log(data.error);
                            alertify.error("Error. Please try again");
                        } else {
                            swal("Delete Success!");
                            location.href = "/cp/page/game/game.aspx";
                        }
                        $(input).prop("disabled", true);
                        //HideLoading();
                    },
                    error: function (error) {
                        console.log(error);
                        alertify.error("Error. Please try again");
                        $(input).prop("disabled", true);
                        //HideLoading();
                    }
                })
            })
        }
    </script>
</asp:Content>

