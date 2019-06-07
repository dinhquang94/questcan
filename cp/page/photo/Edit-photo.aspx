<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Edit-photo.aspx.cs" Inherits="cp_page_photo_Edit_photo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="#">Photo</a></li>
        <li class="breadcrumb-item active">Edit Photo</li>
    </ol>

  <form>
   <div class="col-md-6 form-group">
        <label>Name <span style="color:red">*</span></label>
        <input type="text" id="txtname" class="form-control" value="<%=photo.name %>"  />
    </div>
        <div class="col-md-6 form-group">
        <label>Status</label>
        <%--<input type="text" id="txtOrder" class="form-control" />--%>
         <select id="txtstatus" class="form-control"> 
                 <option <% if (photo.status == 1) { %>selected="selected" <% } %>  value="1">Active</option>
                 <option <% if (photo.status == -1) { %>selected="selected" <% } %>  value="-1">Non-Active</option>
           
         </select>
    </div>

    <div class="form-group">
        <a class="btn btn-danger" href="/cp/page/news/news.aspx">Cancel</a>
        <button class="btn btn-info" id="i_submit" onclick="Submit(this,<%=photo.id %>)">Submit</button>
    </div>
        </form>
     <script>

         function Submit(input,id) {
             $(input).prop("disabled", true);
            $(input).text("Submit");
            //ShowLoading();
             var name = $("#txtname").val();
             var status = $("#txtstatus").val();
             
            if ( $("#txtname").val() == "" || $("#txtstatus").val() == "")
            {
                $(input).prop("disabled", false);
                console.log(error);
            }
            else {
                $.ajax({
                url: "/cp/do/photo/edit-photo.aspx",
                method: "post",
                    data: {
                    id:id,
                    status: status,
                    name: name
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == -1) {
                         console.log(data.error);
                        swal("Error. Please try again");
                    } else {
                        
                        swal("Edit Success!")
                        location.href = "/cp/page/photo/photo.aspx";
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

