<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<SLTest.Models.shipTo>>" %>
<div id='menu'>
</div>

<table>
    <tr>
 
        <th>
           Номер столика
        </th>
        <th>
            Время заказа
        </th>
        <th>
            Комментарий
        </th>
        <th>
            Форма оплаты
        </th>
        <th>
            Официант
        </th>
        <th>
            Состояние
        </th>
        <th>
            Оплата
        </th>
    </tr>

<% foreach (var item in Model) { %>
    <tr class="rowDashBoard">
        <td>
            <%: item.Tables.numTable%>
        </td>
        <td>
            <%: String.Format("{0:g}", item.OrderDateTime)%>
        </td>
        <td>
            <%: item.comment%>
        </td>

        <td>
            <%: item.formOfP1.Descr.Trim()%>
        </td>
        <td>
            <%: item.Tables.Waiters.name%>  
        </td>
         <td>
            <%--<%: Html.ActionLink(item.getOState.Descr, "#", new { id = item.ID }, new { @class = "btSignal " + item.getOState.Style, onClick = "return false;" })%>--%>
            <a href="#" id=<%=item.ID%> class="btSignal btOState <%=item.getOState.Style%>"><%=item.getOState.Descr%></a>
        </td>
         <td>
            <%--<%: Html.ActionLink(item.getPState.Descr, "#", new { id = item.ID }, new { @class = "btSignal " + item.getPState.Style, onClick = "return false;" })%>--%>
            <a href="#" id=<%=item.ID%> class="btSignal btPState <%=item.getPState.Style%>"><%=item.getPState.Descr%></a>
        </td> 
     </tr>  
<% } %>

</table>


