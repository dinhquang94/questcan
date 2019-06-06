<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Add-usertype.aspx.cs" Inherits="cp_page_usertype_Add_usertype" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <form>
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="#">Usertype</a></li>
        <li class="breadcrumb-item active">Add Usertype</li>
    </ol>

     <div class="col-md-6 form-group">
        <label>Name <span style="color:red">*</span></label>
       <input type="text" id="txtname" class="form-control" placeholder="abc Name" required />
    </div>
    <div class="form-group">
        <a class="btn btn-danger" href="/cp/page/usertype/usertype.aspx">Cancel</a>
        <button class="btn btn-info" id="i_submit" onclick="Submit(this)">Submit</button>
    </div>
        </form>


<script>

        function Submit(input) {
            $(input).prop("disabled", true);
            $(input).text("Submitting");
            //ShowLoading();
            var name = $("#txtname").val();

            if (name == "") {
                alert("Please enter Name");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtname").focus();
                return 0;
            }
            
            else {
                $.ajax({
                    url: "/cp/do/usertype/add-usertype.aspx",
                method: "post",
                    data: {
                       name:name,
                       
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == 1) {
                        swal("Add Success!");
                        location.href = "/cp/page/usertype/usertype.aspx";

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

