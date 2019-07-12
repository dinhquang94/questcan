<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="customer.aspx.cs" Inherits="cp_page_customer_customer" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Customer</li>
    </ol>
    <a class="btn btn-success" href="/cp/page/customer/Add-customer.aspx">Add Customer</a>
    <p></p>
     <div style="overflow-x:auto;">
    <table class="table table-bordered">
        <tbody >
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center">Store ID</th>
                <th class="text-center">User ID</th>
              
                <th colspan="2" class="text-center">Action</th>
            </tr>
            <%for (int i = listcustomer.Count - 1 ; i > -1; i-- )
                   {%>
            <tr>
                <td><%=listcustomer[i].id%></td>
                  <td><%=listcustomer[i].StoreTBx.name%></td>
                <td><%=listcustomer[i].UserTBx.full_name%></td>
               
                <td class="text-center">
                    <a class="btn btn-info" href="/cp/page/customer/Edit-customer.aspx?id=<%=listcustomer[i].id %>">
                        <i class="fa fa-edit" style="font-size: 15px"></i>
                    </a>
                    <button class="btn" onclick="Delete(this,<%=listcustomer[i].id%>)">
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
                    url: "/cp/do/customer/delete-customer.aspx",
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


