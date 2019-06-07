<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Add-customer.aspx.cs" Inherits="cp_page_customer_Add_customer" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <form>
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="/cp/page/customer/customer.aspx">Customer</a></li>
        <li class="breadcrumb-item active">Add Customer</li>
    </ol>
     <div class="col-md-3 form-group">
        <label>Store ID</label>
        <%--<input type="text" id="txtOrder" class="form-control" />--%>
         <select id="slstoreid" class="form-control">
             <%
                 for (int i = 0; i < liststore.Count; i++)
                 {


                 %>
                <option value="<%=liststore[i].id %>"><%=liststore[i].name %></option>
            <%} %>
         </select>
    </div>
    <div class="col-md-3 form-group">
        <label>User ID</label>
        <%--<input type="text" id="txtOrder" class="form-control" />--%>
         <select id="sluserid" class="form-control">
             <%
                 for (int i = 0; i < listuser.Count; i++)
                 {


                 %>
                <option value="<%=listuser[i].id %>"><%=listuser[i].full_name %></option>
            <%} %>
         </select>
    </div>
  

    <div class="form-group">
        <a class="btn btn-danger" href="/cp/page/customer/customer.aspx">Cancel</a>
        <button class="btn btn-info" id="i_submit" onclick="Submit(this)">Submit</button>
    </div>
        </form>
    <script>

        function Submit(input) {
            $(input).prop("disabled", true);
            $(input).text("Submitting");
            var userid = $("#sluserid").val();
            var storeid = $("#slstoreid").val();
                $.ajax({
                    url: "/cp/do/customer/add-customer.aspx",
                method: "post",
                    data: {
                        userid: userid,
                        storeid:storeid
                        
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == 1) {
                        swal("Add Success!");
                        location.href = "/cp/page/customer/customer.aspx";

                    } else {
                        //console.log(data.error);
                        swal("Error. Please try again");
                    }
                    $(input).prop("disabled", false);
                    $(input).text("Submit");
                    //HideLoading();
                },
                error: function (error) {
                    $(input).prop("disabled", false);
                    console.log(error);
                    swal("Error. Please try again");
                    $(input).text("Submit");
                    //HideLoading();
                }
            })
            
            
        }
</script>
</asp:Content>
