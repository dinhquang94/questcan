<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Edit-pages.aspx.cs" Inherits="cp_page_page_Edit_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="#">Page</a></li>
        <li class="breadcrumb-item active">Edit Page</li>
    </ol>

  <form>
   <div class="col-md-6 form-group">
        <label>Title <span style="color:red">*</span></label>
        <input type="text" id="txttitle" class="form-control" value="<%=page.title %>"  />
    </div>
    <div class="col-md-12 form-group">
        <label>Description <span style="color:red">*</span></label>
         <textarea class="form-control tinymce" id="txtdescription" ><%=page.description%></textarea>
    </div>
    <div class="form-group">
        <a class="btn btn-danger" href="/cp/page/news/news.aspx">Cancel</a>
        <button class="btn btn-info" id="i_submit" onclick="Submit(this,<%=page.id %>)">Submit</button>
    </div>
        </form>
    <script>
     
        function Submit(input, id) {
             $(input).prop("disabled", true);
            $(input).text("Submitting");
            var title = $("#txttitle").val();
            var desc = tinymce.get("txtdescription").getContent();
            if (title == "") {
                alert("Please enter Title");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txttitle").focus();
                return 0;
            }
            else {
                $.ajax({
                url: "/cp/do/page/edit-page.aspx",
                method: "post",
                data: {
                    id:id,
                    title: title,
                    desc: desc
                   
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == -1) {
                        //console.log(data.error);
                        swal("Error. Please try again");
                    } else {
                        swal("Edit Success!");
                        location.href = "/cp/page/pages/pages.aspx";
                    }
                    $(input).prop("disabled", false);
                    $(input).text("Submit");
                    //HideLoading();
                },
                error: function (error) {
                    $(input).prop("disabled", false);
                    $(input).text("Submit");
                    console.log(error);
                    swal("Error. Please try again");
                    //HideLoading();
                }
            })  
            }
            
        }
    </script>

</asp:Content>

