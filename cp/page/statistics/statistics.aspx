<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="statistics.aspx.cs" Inherits="cp_page_statistics_statistics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        <li class="breadcrumb-item active">Statistics</li>
    </ol>
    <p></p>
    <br />

    <div class="col-md-6 form-group">
        <label>Search by Date</label>
        <input type="date" id="txtdate" class="form-control" required onchange="searchdate()" />
    </div>
<%--    <a class="btn btn-success" href="/cp/page/step/Add-step.aspx">Get All</a>--%>
    <br />
    <div style="overflow-x: auto;" id="abc">
        <div class="col-md-6 form-group">
            <label>Total Player: <%=totalplayer %> </label>
        </div>
        <div class="col-md-6 form-group">
            <label>Total click Fundice: <%=totolclick %></label>
        </div>

        <table class="table table-bordered">
            <tbody>
                <tr>
                    <th class="text-center">User</th>
                    <th class="text-center">Total</th>
                    <th class="text-center">Date</th>
                </tr>
                <%for (int i = liststa.Count - 1; i > -1; i--)
                    {%>
                <tr>
                    <td>
                        <%for (int j = 0; j < listuser.Count; j++)
                            {%>
                        <%if (liststa[i].user_id == listuser[j].id)
                            {%>
                        <%=listuser[j].full_name%>
                        <%} %>
                        <%}%>
                    </td>
                    <td><%=liststa[i].totle%></td>
                    <td><%=liststa[i].date.Value.ToString("dd/MM/yyyy")%></td>

                </tr>
                <%} %>
            </tbody>
        </table>
    </div>
    <script>
        function searchdate() {

            var date = $("#txtdate").val();

            $.ajax({
                url: "/cp/do/statistics/statisticsbydate.aspx",
                method: "post",
                data: {
                    date: date
                },
                success: function (data) {

                    $('#abc').html(data);
                },
                error: function (error) {
                    console.log(error);
                    swal("error. please try again");
                }
            })
        }
    </script>
</asp:Content>

