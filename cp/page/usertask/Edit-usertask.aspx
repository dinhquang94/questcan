<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Edit-usertask.aspx.cs" Inherits="cp_page_usertask_Edit_usertask" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <form>
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="#">Usertask</a></li>
        <li class="breadcrumb-item active">Edit Usertask</li>
    </ol>

     <div class="col-md-6 form-group">
        <label>Task Name</label>
        <%--<input type="text" id="txtOrder" class="form-control" />--%>
         <select id="txttaskname" class="form-control" >
               <%for (int j = 0; j < listtask.Count; j++)
                { %>
            <option value="<%=listtask[j].id%>" <% if (listtask[j].id == usertask.task_id)
 
         { %>selected<%} %> ><%=listtask[j].title%> </option>
 
        <%}%>
         </select>
    </div>

          <div class="col-md-6 form-group">
        <label>User Name</label>
        <%--<input type="text" id="txtOrder" class="form-control" />--%>
         <select id="txtusername" class="form-control">
                <%for (int i = 0; i < listuser.Count; i++)
                { %>
            <option value="<%=listuser[i].id%>" <% if (listuser[i].id == usertask.user_id)
 
         { %>selected<%} %> ><%=listuser[i].full_name%> </option>
 
        <%}%>
         </select>
    </div>

    <div class="form-group">
        <a class="btn btn-danger" href="/cp/page/usertask/usertask.aspx">Cancel</a>
        <button class="btn btn-info" id="i_submit" onclick="Submit(this,<%=usertask.id %>)">Submit</button>
    </div>
        </form>

     <script>

        function Submit(input,id) {
            $(input).prop("disabled", true);
            $(input).text("Submitting");
            //ShowLoading();
            var taskname = $("#txttaskname").val();
            var username = $("#txtusername").val();

            if (taskname == "") {
                alert("Please enter Name");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txttaskname").focus();
                return 0;
            }
            else {
                $.ajax({
                    url: "/cp/do/usertask/edit-usertask.aspx",
                method: "post",
                    data: {
                        id:id,
                        taskname:taskname,
                        username: username
            
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == 1) {
                        swal("Edit Success!");
                        location.href = "/cp/page/usertask/usertask.aspx";

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

