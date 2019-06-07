<%@ Page Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Add-step.aspx.cs" Inherits="cp_page_step_Add_step" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <form>
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="#">STEP</a></li>
        <li class="breadcrumb-item active">Add Step</li>
    </ol>

     <div class="col-md-6 form-group">
        <label>Effect <span style="color:red">*</span></label>
       <input type="text" id="txteffect" class="form-control" placeholder="effect" required />
    </div>

    <div class="col-md-6 form-group">
        <label>Step Numer <span style="color:red">*</span></label>
        <input type="number" id="txtstepnumber" class="form-control" placeholder="Step Numer" required />
    </div>

      <div class="form-group">
        <a class="btn btn-danger" href="/cp/page/user/user.aspx">Cancel</a>
        <button class="btn btn-info" id="i_submit" onclick="Submit(this)">Submit</button>
    </div>

     </form>


    <script>

        function Submit(input) {
            $(input).prop("disabled", true);
            $(input).text("Submitting");
            //ShowLoading();
            var effect = $("#txteffect").val();
            var number = $("#txtstepnumber").val();
          
            if (effect == "") {
                alert("Please enter Effect");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtfirstname").focus();
                return 0;
            }
             if (number == "") {
                alert("Please enter Step Number");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtlastname").focus();
                return 0;
             }
            else {
                $.ajax({
                    url: "/cp/do/step/add-step.aspx",
                method: "post",
                    data: {
                        effect: effect,
                        number: number,
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == 1) {
                        swal("Add Success!");
                        location.href = "step";

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
                    swal(error);
                    $(input).text("Submit");
                    //HideLoading();
                }
            })
            }
            
        }
</script>

</asp:Content>
