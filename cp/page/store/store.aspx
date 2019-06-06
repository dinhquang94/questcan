<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="store.aspx.cs" Inherits="cp_page_store_store" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Store</li>
    </ol>
    <a class="btn btn-success" href="/cp/page/store/Add-store.aspx">Add Store</a>
    <p></p>
    <table class="table table-bordered">
        <tbody >
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center">Name</th>
                <th class="text-center">Address</th>
                <th class="text-center">Open Time</th>
                <th class="text-center">Close Time</th>  
                <th class="text-center">Lattitude</th>  
                <th class="text-center">Longitude</th>
                <th class="text-center">Phone</th>
                <th class="text-center">Email</th>  
                <th colspan="2" class="text-center">Action</th>
            </tr>
             <%for (int i = liststore.Count - 1 ; i > -1; i-- )
                   {%>
            <tr>
                <td><%=liststore[i].id%></td>
                  <td><%=liststore[i].name%></td>
                <td><%=liststore[i].address%></td>
                <td><%=liststore[i].open_time%></td>
                 <td><%=liststore[i].close_time%></td>
                 <td><%=liststore[i].lat%></td>
                 <td><%=liststore[i].@long%></td>
                 <td><%=liststore[i].phone%></td>
                 <td><%=liststore[i].email%></td>
                <td class="text-center">
                    <a class="btn btn-info" href="/cp/page/store/Edit-store.aspx?id=<%=liststore[i].id %>">
                        <i class="fa fa-edit" style="font-size: 15px"></i>
                    </a>
                    <button class="btn" onclick="Delete(this,<%=liststore[i].id%>)">
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
                    url: "/cp/do/store/delete-store.aspx",
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

