<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="ads.aspx.cs" Inherits="cp_page_ads_ads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Advertise</li>
    </ol>
    <a class="btn btn-success" href="/cp/page/ads/Add-ads.aspx">Add Advertise</a>
    <p></p>
    <table class="table table-bordered">
        <tbody >
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center">Title</th>
                <th class="text-center">Picture</th>
                 <th class="text-center">Address</th>
                <th class="text-center">User</th>
                <th class="text-center">Store</th>
                 <th class="text-center">Content</th>
                <th class="text-center">Description</th>
                <th colspan="2" class="text-center">Action</th>
            </tr>
             <%for (int i = listads.Count - 1 ; i > -1; i-- )
                   {%>
            <tr>
                <td><%=listads[i].id%></td>
                  <td><%=listads[i].title%></td>
                  <td>
                    <img src="<%=listads[i].picture %>" width="50%"/>
                </td>
                 <td><%=listads[i].address%></td>
                 <td><%=listads[i].user_id%></td>
                 <td><%=listads[i].store_id%></td>
                 <td><%=listads[i].content%></td>
                <td><%=listads[i].description%></td>
                <td class="text-center">
                    <a class="btn btn-info" href="/cp/page/ads/Edit-ads.aspx?id=<%=listads[i].id %>">
                        <i class="fa fa-edit" style="font-size: 15px"></i>
                    </a>
                    <button class="btn" onclick="Delete(this,<%=listads[i].id%>)">
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
                    url: "/cp/do/ads/delete-ads.aspx",
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
