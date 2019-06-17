<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Edit-category.aspx.cs" Inherits="cp_page_category_Edit_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <form>
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="#">Category</a></li>
        <li class="breadcrumb-item active">Edit Category</li>
    </ol>

     <div class="col-md-6 form-group">
        <label>Category Name <span style="color:red">*</span></label>
       <input type="text" id="txtcategoryname" class="form-control" value="<%=cate.name %>"/>
    </div>

     <div class="col-md-6 form-group">
        <label>Type</label>
        <%--<input type="text" id="txtOrder" class="form-control" />--%>
         <input type="text" id="txttype" class="form-control" value="<%=cate.typecategory %>"/>
    </div>

    <div class="form-group">
        <a class="btn btn-danger" href="/cp/page/category/category.aspx">Cancel</a>
        <button class="btn btn-info" id="i_submit" onclick="Submit(this,<%=cate.id %>)">Submit</button>
    </div>
        </form>

    <script>
      function Submit(input,id) {
            $(input).prop("disabled", true);
            $(input).text("Submitting");
            //ShowLoading();
            var categoryname = $("#txtcategoryname").val();
            var type = $("#txttype").val();
           
            if (categoryname == "") {
                alert("Please enter Category Name");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtcategoryname").focus();
                return 0;
            }
          if (type == "") {
              alert("Please enter Category Type");
              $(input).prop("disabled", false);
              $(input).text("Submit");
              document.getElementById("txttype").focus();
              return 0;
          }
            else {
                $.ajax({
                    url: "/cp/do/category/edit-category.aspx",
                method: "post",
                    data: {
                        id:id,
                        categoryname: categoryname,
                        type: type,
                        id:id
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == 1) {
                        swal("Edit Success!")
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

