<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Edit-ads.aspx.cs" Inherits="cp_page_ads_Edit_ads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
         <style>
        .fileUpload {
            position: relative;
            width: fit-content;
        }

            .fileUpload .upload {
                position: absolute;
                top: 0;
                left: 0;
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100%;
                cursor: pointer;
                opacity: 0;
            }

           
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <form class="table-responsive" >
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="#">Advertise</a></li>
        <li class="breadcrumb-item active">Edit Advertise</li>
    </ol>
    <div class="col-md-6 form-group">
        <label>Title <span style="color:red">*</span></label>
        <input type="text" id="txttitle" class="form-control" value="<%=ads.title %>" required />
    </div>
      <div class="col-md-6 form-group">
        <label>Picture <span style="color:red">*</span></label>
        <img src="<%=ads.picture %>" id="preview" height="30%" width="100%" />
        <br />
        <div class="fileUpload btn btn-info btn-upload">
            <span>+ Edit Picture</span>
            <input type="file" id="i_file" onchange="Preview(event,this)" accept="image/*" class="upload" />
        </div>
    </div>
    <div class="col-md-6 form-group">
        <label>Address <span style="color:red">*</span></label>
        <input type="text" id="txtaddress" class="form-control" value="<%=ads.address %>" required />
    </div>

     <div class="col-md-12 form-group">
        <label>Content <span style="color:red">*</span></label>
         <textarea class="form-control tinymce" id="txtcontent" required><%=ads.content %></textarea>
    </div>
     <div class="col-md-12 form-group">
        <label>Description <span style="color:red">*</span></label>
         <textarea class="form-control tinymce" id="txtdescription" required><%=ads.description %></textarea>
    </div>


    <div class="form-group">
        <a class="btn btn-danger" href="/cp/page/ads/ads.aspx">Cancel</a>
        <button class="btn btn-info" id="i_submit" onclick="Submit(this,<%=ads.id %>)">Submit</button>
    </div>
        </form>


    <script>
        var base64 = "";
        function Preview(event) {
            var input = event.target;
            if (input.files) {
                var reader = new FileReader();
                reader.fileName = input.files[0].name;
                reader.onload = function (e) {
                    base64 = e.target.result.replace(/^data:image\/[a-z]+;base64,/, "");
                    $("#preview").attr("src", e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        };
       function Submit(input,id) {
             $(input).prop("disabled", true);
            $(input).text("Submitting");
            //ShowLoading();
            var title = $("#txttitle").val();
             var desc = tinymce.get("txtdescription").getContent();
             var cont = tinymce.get("txtcontent").getContent();
              var address = $("#txtaddress").val();
            if (title == "") {
                alert("Please enter Title");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txttitle").focus();
                return 0;
            }
              if (address == "") {
                alert("Please enter Address");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtaddress").focus();
                return 0;
            }
         
            else {
                $.ajax({
                url: "/cp/do/ads/edit-ads.aspx",
                method: "post",
                data: {
                    id:id,
                       base64: base64,
                    title: title,
                    desc: desc,
                    cont: cont,
                    address: address
                   
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == -1) {
                        //console.log(data.error);
                        swal("Error. Please try again");
                    } else {
                        swal("Edit Success!");
                        location.href = "/cp/page/ads/ads.aspx";
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

    <%--upload hinh anh--%>
    <script>
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
    </script>
</asp:Content>

