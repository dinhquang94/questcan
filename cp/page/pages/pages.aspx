<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="pages.aspx.cs" Inherits="cp_page_page_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Page</li>
    </ol>
    <a class="btn btn-success" href="/cp/page/pages/Add-pages.aspx">Add Page</a>
    <p></p>
    <table class="table table-bordered">
        <tbody >
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center">Title</th>
                <%--<th class="text-center">Photo</th>--%>
                <th class="text-center">Description</th>
                <th class="text-center">CreateDay</th>  
                <th colspan="2" class="text-center">Action</th>
            </tr>
             <%for (int i = listpage.Count - 1 ; i > -1; i-- )
                   {%>
            <tr>
                <td><%=listpage[i].id%></td>
                  <td><%=listpage[i].title%></td>
              <%-- <td>
                    <img src="<%=listpage[i].picture %>" width="50%"/>
                </td>--%>
                <td><%=listpage[i].description%></td>
                <td><%=listpage[i].create_day%></td>
                <td class="text-center">
                    <a class="btn btn-info" href="/cp/page/pages/Edit-pages.aspx?id=<%=listpage[i].id %>">
                        <i class="fa fa-edit" style="font-size: 15px"></i>
                    </a>
                    <button class="btn" onclick="Delete(this,<%=listpage[i].id%>)">
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
                    url: "/cp/do/page/delete-page.aspx",
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

