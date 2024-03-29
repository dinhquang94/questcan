﻿<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Add-task.aspx.cs" Inherits="cp_page_task_Add_task" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form class="table-responsive">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="#">Dashboard</a>
            </li>
            <li class="breadcrumb-item"><a href="#">Task</a></li>
            <li class="breadcrumb-item active">Add Task</li>
        </ol>
        <div class="col-md-6 form-group">
            <label>Title <span style="color: red">*</span></label>
            <input type="text" id="txttitle" class="form-control" placeholder="Title name" required />
        </div>
        <div class="col-md-6 form-group">
            <label>Picture <span style="color: red">*</span></label>
            <img src="" id="preview" width="100%" />
            <br />
            <div class="fileUpload btn btn-info btn-upload">
                <span>+ Add Picture</span>
                <input type="file" id="i_file" onchange="Preview(event,this)" accept="image/*" class="upload" required />
            </div>
        </div>
       <%-- <div class="col-md-6 form-group">
            <label>Point <span style="color: red">*</span></label>
            <input type="text" id="txtpoint" class="form-control" placeholder="1,2...." onkeypress="return isNumber(event)" required />
        </div>--%>

        <%--<div class="col-md-6 form-group">
            <label>Step 1 <span style="color: red">*</span></label>
            <input type="text" id="txtstep1" class="form-control" placeholder="1,2...." onkeypress="return isNumber(event)" required />
        </div>
        <div class="col-md-6 form-group">
            <label>Rule 1 <span style="color: red">*</span></label>
            <textarea  id="txtrule1" class="form-control" required ></textarea>
        </div>

        <div class="col-md-6 form-group">
            <label>Step 2 <span style="color: red">*</span></label>
            <textarea id="txtstep2" class="form-control" required ></textarea>
        </div>
        <div class="col-md-6 form-group">
            <label>Rule 2 <span style="color: red">*</span></label>
            <textarea  id="txtrule2" class="form-control" required></textarea>
        </div>--%>

        <div class="col-md-6 form-group">
            <label>Start Time <span style="color: red">*</span></label>
            <input type="date" id="txtstartday" class="form-control" required />
        </div>
        <div class="col-md-6 form-group">
            <label>End Time <span style="color: red">*</span></label>
            <input type="date" id="txtendday" class="form-control" required />
        </div>

        <div class="col-md-6 form-group">
            <label>Latitude <span style="color: red">*</span></label>
            <input type="text" id="txtlat" class="form-control" readonly />
        </div>
        <div class="col-md-6 form-group">
            <label>Longitude <span style="color: red">*</span></label>
            <input type="text" id="txtlong" class="form-control" readonly />
        </div>
        <div class="col-md-6 form-group">
            <label>Type</label>
            <%--<input type="text" id="txtOrder" class="form-control" />--%>
            <select id="txttype" class="form-control">
                <%for (int i = 0; i < listtype.Count; i++)
                    {%>
                <option value="<%=listtype[i].id %>"><%=listtype[i].name %></option>

                <% } %>
            </select>
        </div>
<%--        <div class="col-md-12 form-group">
            <label>Content <span style="color: red">*</span></label>
            <textarea class="form-control tinymce" id="txtcontent" required></textarea>
        </div>--%>
           <div class="col-md-6 form-group">
            <label>Link <span style="color: red">*</span></label>
            <textarea class="form-control " id="txtlink" required></textarea>
        </div>
        <div class="col-md-12 form-group">
            <label>Description <span style="color: red">*</span></label>
            <textarea class="form-control tinymce " id="txtdescription" required></textarea>
        </div>


        <div class="form-group">
            <a class="btn btn-danger" href="/cp/page/task/task.aspx">Cancel</a>
            <button class="btn btn-info" id="i_submit" onclick="Submit(this)">Submit</button>
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


        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }

        function Submit(input) {
            $(input).prop("disabled", true);
            $(input).text("Submitting");
            //ShowLoading();
            var title = $("#txttitle").val();
            var sday = $("#txtstartday").val();
            var eday = $("#txtendday").val();
            var point = $("#txtpoint").val();
            var lat = $("#txtlat").val();
            var long = $("#txtlong").val();
            var type = $("#txttype").val();
            //var step1 = $("#txtstep1").val();
            //var step2 = $("#txtstep2").val();
            //var rule1 = $("#txtrule1").val();
            //var rule2 = $("#txtrule2").val();
            var link = $("#txtlink").val();


            var desc = tinymce.get("txtdescription").getContent();
            //var cont = tinymce.get("txtcontent").getContent();

            if (title == "") {
                alert("Please enter Title");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txttitle").focus();
                return 0;
            }
            if (sday == "") {
                alert("Please enter Star Time");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtsday").focus();
                return 0;
            }
            if (eday == "") {
                alert("Please enter End Time");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txteday").focus();
                return 0;
            }
            if (point == "") {
                alert("Please enter Point");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtpoint").focus();
                return 0;
            }

            else {
                $.ajax({
                    url: "/cp/do/task/add-task.aspx",
                    method: "post",
                    data: {
                        //  base64: base64,
                        title: title,
                        desc: desc,
                        //cont: cont,
                        sday: sday,
                        eday: eday,
                        point: point,
                        lat: lat,
                        long: long,
                        type: type,
                        base64: base64,
                        //step1: step1,
                        //rule1: rule1,
                        //step2: step2,
                        //rule2: rule2,
                        link:link


                    },
                    success: function (data) {
                        data = JSON.parse(data);
                        if (data.success == -1) {
                            //console.log(data.error);
                            swal("Error. Please try again");
                        } else {

                            swal("Add Success!")
                            location.href = "/cp/page/task/task.aspx";
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

