<%@ Page Language="C#" AutoEventWireup="true" CodeFile="statisticsbydate.aspx.cs" Inherits="cp_do_statistics_statisticsbydate" %>

<%if (liststa.Count == 0)
    {%>

<span>No result</span>


<%} %>
<%else
    {%>
<div style="overflow-x: auto;">
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
<%} %>