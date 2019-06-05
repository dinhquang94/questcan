<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Add-category.aspx.cs" Inherits="cp_page_category_Add_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <form>
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="#">Category</a></li>
        <li class="breadcrumb-item active">Add Category</li>
    </ol>

     <div class="col-md-6 form-group">
        <label>Category Name <span style="color:red">*</span></label>
       <input type="text" id="txtcategoryname" class="form-control" placeholder="Category name" required />
    </div>

     <div class="col-md-6 form-group">
        <label>Type</label>
        <%--<input type="text" id="txtOrder" class="form-control" />--%>
         <select id="txttype" class="form-control">
                <option value="1">Customer</option>
                 <option value="2">Employeer</option>
                <option value="3">Admin</option>
         </select>
    </div>

    <div class="form-group">
        <a class="btn btn-danger" href="/cp/page/category/category.aspx">Cancel</a>
        <button class="btn btn-info" id="i_submit" onclick="Submit(this)">Submit</button>
    </div>
        </form>
    <script>

        function Submit(input) {
            $(input).prop("disabled", true);
            $(input).text("Submitting");
            var categoryname = $("#txtcategoryname").val();
            var type = $("#txttype").val();
            if (categoryname == "") {
                alert("Please enter Category Name");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtcategoryname").focus();
                return 0;
            }
             else {
                $.ajax({
                    url: "/cp/do/category/add-category.aspx",
                method: "post",
                    data: {
                        categoryname: categoryname,
                        type:type
                        
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == 1) {
                        swal("Add Success!");
                        location.href = "/cp/page/category/category.aspx";

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
            
        }
</script>
</asp:Content>

