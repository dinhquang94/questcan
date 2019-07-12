<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Edit-rule.aspx.cs" Inherits="cp_page_rule_Edit_rule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <form class="table-responsive">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="#">Dashboard</a>
            </li>
            <li class="breadcrumb-item"><a href="#">Rule</a></li>
            <li class="breadcrumb-item active">Edit Rule</li>
        </ol>
        <div class="col-md-6 form-group">
            <label>Name <span style="color: red">*</span></label>
            <input type="text" id="txtname" class="form-control" value="<%=rule.name %>" required />
        </div>
        <div class="col-md-6 form-group">
            <label>Task</label>
            <select id="txttask" class="form-control">
                <%for (int i = 0; i < listtask.Count; i++)
                    {%>
                <option value="<%=listtask[i].id %>" <%if (listtask[i].id == rule.task_id){%>selected <%}%>><%=listtask[i].title%></option>

                <% } %>
            </select>
        </div>
        <div class="col-md-6 form-group">
            <label>Point <span style="color: red">*</span></label>
            <input type="text" id="txtpoint" class="form-control" placeholder="10 ,22 ...."required  value="<%=rule.point %>"/>
        </div>

        <div class="col-md-6 form-group">
            <label>Step<span style="color: red">*</span></label>
            <textarea id="txtstep" class="form-control" required><%=rule.step %></textarea>
        </div>
        <div class="col-md-12 form-group">
            <label>Content Rule<span style="color: red">*</span></label>
            <textarea id="txtcontentrule" class="form-control tinymce" required><%=rule.content %></textarea>
        </div>

        <div class="col-md-12 form-group">
            <label>Check <span style="color: red">*</span></label>
            <textarea class="form-control tinymce" id="txtcheck" required><%=rule.description %></textarea>
        </div>

        <div class="form-group">
            <a class="btn btn-danger" href="/cp/page/rule/rule.aspx">Cancel</a>
            <button class="btn btn-info" id="i_submit" onclick="Submit(this,<%=rule.id %>)">Submit</button>
        </div>
    </form>
        <script>
      
        function Submit(input, id) {
            $(input).prop("disabled", true);
            $(input).text("Submitting");
            //ShowLoading();
            var name = $("#txtname").val();
            var point = $("#txtpoint").val();
            var task = $("#txttask").val();
            var step = $("#txtstep").val();
            var check = tinymce.get("txtcheck").getContent();
            var contrule = tinymce.get("txtcontentrule").getContent();

            if (name == "") {
                alert("Please enter Title");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtname").focus();
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
                    url: "/cp/do/rule/edit-rule.aspx",
                    method: "post",
                    data: {
                        id: id,
                        name: name,
                        check: check,
                        contrule: contrule,
                        point: point,
                        task: task,
                        step: step
                    },
                    success: function (data) {
                        data = JSON.parse(data);
                        if (data.success == 1) {
                            swal("Edit Success!")
                            location.href = "/cp/page/rule/rule.aspx";

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

