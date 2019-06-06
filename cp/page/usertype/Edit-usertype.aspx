<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Edit-usertype.aspx.cs" Inherits="cp_page_usertype_Edit_usertype" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <form>
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="#">Users</a></li>
        <li class="breadcrumb-item active">Add User</li>
    </ol>

     <div class="col-md-6 form-group">
        <label>Name <span style="color:red">*</span></label>
       <input type="text" id="txtname" class="form-control" value="<%=user.name %>" />
    </div>

    <div class="form-group">
        <a class="btn btn-danger" href="/cp/page/usertype/usertype.aspx">Cancel</a>
        <button class="btn btn-info" id="i_submit" onclick="Submit(this,<%=user.id %>)">Submit</button>
    </div>
        </form>
    <script>

        function Submit(input,id) {
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
                    url: "/cp/do/usertype/edit-usertype.aspx",
                method: "post",
                    data: {
                        id:id,
                        name: name
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == 1) {
                        swal("Edit Success!")
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

