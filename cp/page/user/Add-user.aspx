<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Add-user.aspx.cs" Inherits="cp_page_user_Add_user" %>

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
        <label>First Name <span style="color:red">*</span></label>
       <input type="text" id="txtfirstname" class="form-control" placeholder="First Name" required />
    </div>

    <div class="col-md-6 form-group">
        <label>Last Name <span style="color:red">*</span></label>
        <input type="text" id="txtlastname" class="form-control" placeholder="Last Name" required />
    </div>

    <div class="col-md-6 form-group">
        <label>Full Name <span style="color:red">*</span></label>
        <input type="text" id="txtfullname" class="form-control" placeholder="Full Name" required />
    </div>

    <div class="col-md-6 form-group">
        <label>Email <span style="color:red">*</span></label>
        <input type="text" id="txtemail" class="form-control" placeholder="abc@example" required />
    </div>

    <div class="col-md-6 form-group">
        <label>Password <span style="color:red">*</span></label>
        <input type="password" id="txtpassword" class="form-control" placeholder="************" required />
    </div>

    <div class="col-md-6 form-group">
        <label>Phone <span style="color:red">*</span></label>
        <input type="text" id="txtphone" class="form-control" placeholder="0123123123" required />
    </div>

    <div class="col-md-6 form-group">
        <label>BirthDay <span style="color:red">*</span></label>
        <input type="date" id="txtbirthday" class="form-control" required />
    </div>

     <div class="col-md-6 form-group">
        <label>Type User</label>
        <%--<input type="text" id="txtOrder" class="form-control" />--%>
         <select id="txttypeuser" class="form-control">
             <%for (int i = 0; i < listtype.Count; i++) {%>

             <option value="<%=listtype[i].id %>"><%=listtype[i].name %></option>

                 <%} %>
                 <option value="0">Employeer</option>
         </select>
    </div>

    <div class="col-md-6 form-group">
        <label>Address <span style="color:red">*</span></label>
        <input id="txtaddress" class="form-control" placeholder="113 Vietnam" required/>
    </div>

    <div class="col-md-6 form-group">
        <label>Credit <span style="color:red">*</span></label>
        <input id="txtcredit" class="form-control" placeholder="$" required/>
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
            var firstname = $("#txtfirstname").val();
            var lastname = $("#txtlastname").val();
            var fullname = $("#txtfullname").val();
            var email = $("#txtemail").val();
             var password = $("#txtpassword").val();
            var phone = $("#txtphone").val();
            var birthday = $("#txtbirthday").val();
            var typeuser = $("#txttypeuser").val();
            var address = $("#txtaddress").val();
            var credit = $("#txtcredit").val();
            if (firstname == "") {
                alert("Please enter FirstName");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtfirstname").focus();
                return 0;
            }
             if (lastname == "") {
                alert("Please enter LastName");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtlastname").focus();
                return 0;
             }
              if (fullname == "") {
                alert("Please enter FullName");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtfullname").focus();
                return 0;
              }
             if (email == "") {
                alert("Please enter Email");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtemail").focus();
                return 0;
             }
              if (password == "") {
                alert("Please enter Password");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtpassword").focus();
                return 0;
              }
              if (phone == "") {
                alert("Please enter Phone");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtphone").focus();
                return 0;
              }
            if (birthday == "") {
                alert("Please enter BirthDay");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtbirthday").focus();
                return 0;
            }
             if (address == "") {
                alert("Please enter Address");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtaddress").focus();
                return 0;
              }
            if (credit == "") {
                alert("Please enter Credit");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtcredit").focus();
                return 0;
              }
            else {
                $.ajax({
                    url: "/cp/do/user/add-user.aspx",
                method: "post",
                    data: {
                        firstname: firstname,
                        lastname: lastname,
                        fullname: fullname,
                        email: email,
                        password: password,
                        phone: phone,
                        birthday: birthday,
                        typeuser: typeuser,
                        address: address,
                        credit:credit,
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == 1) {
                        swal("Add Success!");
                        location.href = "/cp/page/user/user.aspx";

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

