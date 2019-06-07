<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Add-pages.aspx.cs" Inherits="cp_page_page_Add_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <form class="table-responsive" >
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="#">Page</a></li>
        <li class="breadcrumb-item active">Add Page</li>
    </ol>
    <div class="col-md-6 form-group">
        <label>Title <span style="color:red">*</span></label>
        <input type="text" id="txttitle" class="form-control" placeholder="Title name" required />
    </div>
     <div class="col-md-12 form-group">
        <label>Description <span style="color:red">*</span></label>
         <textarea class="form-control tinymce" id="txtdescription" required></textarea>
    </div>

    <div class="form-group">
        <a class="btn btn-danger" href="/cp/page/pages/pages.aspx">Cancel</a>
        <button class="btn btn-info" id="i_submit" onclick="Submit(this)">Submit</button>
    </div>
        </form>
     <script>
         function Submit(input) {
             $(input).prop("disabled", true);
            $(input).text("Submitting");
            //ShowLoading();
            var title = $("#txttitle").val();
            var desc =tinymce.get("txtdescription").getContent();
            if (title == "") {
                alert("Please enter Title");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txttitle").focus();
                return 0;
            }
         
            else {
                $.ajax({
                url: "/cp/do/page/add-page.aspx",
                method: "post",
                data: {
                    title: title,
                    desc: desc
                   
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == -1) {
                         //console.log(data.error);
                        swal("Error. Please try again");
                    } else {
                        
                        swal("Add Success!")
                        location.href = "/cp/page/pages/pages.aspx";
                    }
                    $(input).prop("disabled", false);
                    $(input).text("Submit");
                    //HideLoading();
                },
                error: function (error) {
                    $(input).prop("disabled", false);
                    console.log(error);
                    swal("error. please try again");
                    $(input).text("submit");
                    //hideloading();
                }
            })
            }
            
        }
    </script>


</asp:Content>

