<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Add-store.aspx.cs" Inherits="cp_page_store_Add_store" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <form class="table-responsive" >
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="#">Store</a></li>
        <li class="breadcrumb-item active">Add Store</li>
    </ol>
    <div class="col-md-6 form-group">
        <label>Name <span style="color:red">*</span></label>
        <input type="text" id="txtname" class="form-control" placeholder="abc name" required />
    </div>
     <div class="col-md-6 form-group">
        <label>Address <span style="color:red">*</span></label>
        <input type="text" id="txtaddress" class="form-control" placeholder="133 d.c" required />
    </div>
    <div class="col-md-6 form-group">
        <label>Open Time <span style="color:red">*</span></label>
        <input type="time" id="txtopen" class="form-control" required />
    </div>
    <div class="col-md-6 form-group">
        <label>Close Time <span style="color:red">*</span></label>
        <input type="time" id="txtclose" class="form-control" required />
    </div>
    
      <div class="col-md-6 form-group">
        <label>Latitude <span style="color:red">*</span></label>
        <input type="text" id="txtlat" class="form-control"  readonly required />
    </div>
     <div class="col-md-6 form-group">
        <label>Longitude <span style="color:red">*</span></label>
        <input type="text" id="txtlong" class="form-control" readonly required />
    </div>
    <div class="col-md-6 form-group">
        <label>Phone <span style="color:red">*</span></label>
        <input type="text" id="txtphone" class="form-control" placeholder="0999887722" onkeypress="return isNumber(event)"  required />
    </div>
    <div class="col-md-6 form-group">
        <label>Email <span style="color:red">*</span></label>
        <input type="text" id="txtemail" class="form-control" placeholder="abc@......"  required />
    </div>

    <div class="form-group">
        <a class="btn btn-danger" href="/cp/page/store/store.aspx">Cancel</a>
        <button class="btn btn-info" id="i_submit" onclick="Submit(this)">Submit</button>
    </div>
        </form>
     <script>
         function isNumber(evt) {
             evt = (evt) ? evt : window.event;
             var charCode = (evt.which) ? evt.which : evt.keyCode;
             if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                 return false;
             }
             return true;
         }
         var x = document.getElementById("txtlat");
         var y = document.getElementById("txtlong");

         function getLocation() {
              if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition);
              } else { 
                x.innerHTML = "Geolocation is not supported by this browser.";
              }
            }

            function showPosition(position) {
                x.value = position.coords.latitude;
              y.value = position.coords.longitude;
            }
         getLocation();
         function Submit(input) {
             $(input).prop("disabled", true);
            $(input).text("Submitting");
            //ShowLoading();
             var name = $("#txtname").val();
              var address = $("#txtaddress").val();
             var open = $("#txtopen").val();
             var close = $("#txtclose").val();
             var lat = $("#txtlat").val();
             var long = $("#txtlong").val();
             var phone = $("#txtphone").val();
              var email = $("#txtemail").val();
            if (name == "") {
                alert("Please enter Name");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtname").focus();
                return 0;
            }
              if (address == "") {
                alert("Please enter Address");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtaddress").focus();
                return 0;
              }
                if (open == "") {
                alert("Please enter Open Time");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtopen").focus();
                return 0;
                }
                if (close == "") {
                alert("Please enter Close Time");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtclose").focus();
                    return 0;

                }
             if (phone == "") {
                 alert("Please enter Phone");
                 $(input).prop("disabled", false);
                 $(input).text("Submit");
                 document.getElementById("txtphone").focus();
                 return 0;
             }
              if (email == "") {
                 alert("Please enter Email");
                 $(input).prop("disabled", false);
                 $(input).text("Submit");
                 document.getElementById("txtemail").focus();
                 return 0;
              }
             if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email) == false) {
                 alert("Please enter format Email: example@example.com");
                 $(input).prop("disabled", false);
                 $(input).text("Submit");
                 document.getElementById("txtemail").focus();
                 return 0;
             }

            else {
                $.ajax({
                url: "/cp/do/store/add-store.aspx",
                method: "post",
                data: {
                    name: name,
                    address: address,
                    phone: phone,
                    email: email,
                    lat: lat,
                    long: long,
                    open: open,
                    close: close,
 
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == -1) {
                         //console.log(data.error);
                        swal("Error. Please try again");
                    } else {
                        
                        swal("Add Success!")
                        location.href = "/cp/page/store/store.aspx";
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

    <%--upload hinh anh--%>
   <%-- <script>
        $('#i_submit').click( function() {
    //kiem tra trinh duyet co ho tro File API
    if (window.File && window.FileReader && window.FileList && window.Blob)
    {
        // lay dung luong va kieu file tu the input file
        var fsize = $('#i_file')[0].files[0].size;
        var ftype = $('#i_file')[0].files[0].type;
         switch(ftype)
        {
            case 'image/png':
            case 'image/gif':
            case 'image/jpeg':
            case 'image/pjpeg':
                //alert("Acceptable image file!");
                break;
            default:
                swal('Unsupported File!');
        }
 
        if(fsize>3048576) //thuc hien dieu gi do neu dung luong file vuot qua 3MB
        {
            swal(" Please select a picture below 3MB!");
        }
    }
});
    </script>--%>


</asp:Content>

