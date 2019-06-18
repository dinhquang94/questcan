<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Edit-task.aspx.cs" Inherits="cp_page_task_Edit_task" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
           <form class="table-responsive" >
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="#">Task</a></li>
        <li class="breadcrumb-item active">Edit Task</li>
    </ol>
    <div class="col-md-6 form-group">
        <label>Title <span style="color:red">*</span></label>
        <input type="text" id="txttitle" class="form-control" value="<%=task.title %>" required />
    </div>
<%--    <div class="col-md-6 form-group">
        <label>Picture <span style="color:red">*</span></label>
        <img src="" id="preview" width="100%"/>
            <br />
        <div class="fileUpload btn btn-info btn-upload">
            <span>+ Add Picture</span>
            <input type="file" id="i_file" onchange="Preview(event,this)" accept="image/*" class="upload" required />
        </div>
    </div>--%>
     <div class="col-md-6 form-group">
        <label>Point <span style="color:red">*</span></label>
        <input type="text" id="txtpoint" class="form-control" value="<%=task.point %>" onkeypress="return isNumber(event)" required />
    </div>
    <div class="col-md-6 form-group">
        <label>Start Time <span style="color:red">*</span></label>
        <input type="date" id="txtstartday" class="form-control" value="<%=task.start_time %>"  required />
    </div>
    <div class="col-md-6 form-group">
        <label>End Time <span style="color:red">*</span></label>
        <input type="date" id="txtendday" class="form-control" value="<%=task.end_time %>" required />
    </div>
    
      <div class="col-md-6 form-group">
        <label>Latitude <span style="color:red">*</span></label>
        <input type="text" id="txtlat" class="form-control" value="<%=task.lat %>"  readonly />
    </div>
     <div class="col-md-6 form-group">
        <label>Longitude <span style="color:red">*</span></label>
        <input type="text" id="txtlong" class="form-control" value="<%=task.@long %>" readonly />
    </div>
    <div class="col-md-6 form-group">
        <label>Type</label>
         <select id="txttype" class="form-control">
             <%for (int i = 0; i < listtype.Count; i++) {%>

             <option value="<%=listtype[i].id %>" <%if (task.usertype_id == listtype[i].id){%>selected <%}%>><%=listtype[i].name %></option>

                 <%} %>

                 <%--<option <% if (task.usertype_id == 1) { %>selected="selected" <% } %> value="1">Customer</option>   
                 <option  <% if (task.usertype_id == 2) { %>selected="selected" <% } %> value="2">Employeer</option>
                <option  <% if (task.usertype_id == 3) { %>selected="selected" <% } %> value="3">Admin</option>--%>
         </select>
    </div>
     <div class="col-md-12 form-group">
        <label>Content <span style="color:red">*</span></label>
         <textarea class="form-control tinymce" id="txtcontent" required> <%=task.content %></textarea>
    </div>
     <div class="col-md-12 form-group">
        <label>Description <span style="color:red">*</span></label>
         <textarea class="form-control tinymce" id="txtdescription" required><%=task.description %></textarea>
    </div>


    <div class="form-group">
        <a class="btn btn-danger" href="/cp/page/task/task.aspx">Cancel</a>
        <button class="btn btn-info" id="i_submit" onclick="Submit(this,<%=task.id %>)">Submit</button>
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

      function Submit(input,id) {
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
             var desc = tinymce.get("txtdescription").getContent();
             var cont = tinymce.get("txtdescription").getContent();
           
           
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
                    url: "/cp/do/task/edit-task.aspx",
                method: "post",
                    data: {
                        id:id,
                    title: title,
                    desc: desc,
                    cont: cont,
                    sday : sday,
                    eday: eday,
                    point: point,
                    lat: lat,
                    long: long,
                    type:type
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == 1) {
                        swal("Edit Success!")
                        location.href = "/cp/page/task/task.aspx";

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

