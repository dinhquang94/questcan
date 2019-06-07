<%@ Page Language="C#" MasterPageFile="~/cp/MasterPage.master"  AutoEventWireup="true" CodeFile="step.aspx.cs" Inherits="cp_page_step_step" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        <li class="breadcrumb-item active">STEP</li>
    </ol>
    <a class="btn btn-success" href="step-add">Add Step</a>
    <p></p>
    <table class="table table-bordered">
        <tbody >
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center"> Step Number</th>
                <th class="text-center">Effect</th>
               
              
              <th colspan="2" class="text-center">Action</th>
            </tr>
             <%for (int i = liststep.Count - 1 ; i > -1; i-- )
                   {%>
            <tr>
                <td><%=liststep[i].id%></td>
                  <td><%=liststep[i].step_number%></td>
                  <td><%=liststep[i].effect%></td>

                <td class="text-center">
                    <a class="btn btn-info" href="/cp/page/user/Edit-user.aspx?id=<%=liststep[i].id %>">
                        <i class="fa fa-edit" style="font-size: 15px"></i>
                    </a>
                    <button class="btn" onclick="Delete(this,<%=liststep[i].id%>)">
                        <i class="fa fa-trash" style="font-size: 25px;color:red;"></i>
                    </button>
                </td>
            </tr>
            <%} %>
        </tbody>
    </table>
 <script>
        function Delete(input, id) {
            alertify.confirm('Are you sure Delete', function () {
                $(input).prop("disabled", true);
                //ShowLoading();
                $.ajax({
                    url: "/cp/do/step/delete-step.aspx",
                    method: "post",
                    data: {
                        id: id
                    },
                    success: function (data) {
                        data = JSON.parse(data);
                        if (data.success == -1) {
                            console.log(data.error);
                            swal("Error. Please try again");
                        } else {
                            swal("Delete Success!");
                            location.reload();
                        }
                        $(input).prop("disabled", true);
                        //HideLoading();
                    },
                    error: function (error) {
                        console.log(error);
                        swal(error);
                        $(input).prop("disabled", true);
                        //HideLoading();
                    }
                })
            })
        }
    </script>

</asp:Content>
