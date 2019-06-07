<%@ Page Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Edit-step.aspx.cs" Inherits="cp_page_step_Edit_step" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <form>
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="#">STEP</a></li>
        <li class="breadcrumb-item active">Edit Step</li>
    </ol>

     <div class="col-md-6 form-group">
        <label>Effect <span style="color:red">*</span></label>
       <input type="text" value="<%=step.effect %>" id="txteffect" class="form-control" placeholder="effect" required />
    </div>

    <div class="col-md-6 form-group">
        <label>Step Numer <span style="color:red">*</span></label>
        <input type="number" readonly value="<%=step.step_number %>" id="txtstepnumber" class="form-control" placeholder="Step Numer" required />
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
           // var number = $("#txtstepnumber").val();
          
            if (effect == "") {
                alert("Please enter Effect");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtfirstname").focus();
                return 0;
            }
             //if (number == "") {
             //   alert("please enter step number");
             //   $(input).prop("disabled", false);
             //   $(input).text("submit");
             //   document.getelementbyid("txtlastname").focus();
             //   return 0;
             //}
            else {
                $.ajax({
                    url: "/cp/do/step/eidt-step.aspx",
                method: "post",
                    data: {
                        effect: effect,
                       // number: number,
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == 1) {
                        swal("Add Success!");
                        location.href = "/cp/page/step/step.aspx";

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

