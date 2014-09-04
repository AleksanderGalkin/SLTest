<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<SLTest.Models.shipTo>>" %>

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
       

    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: item.tableNum %>
        </td>
        <td>
            <%: String.Format("{0:g}", item.OrderDateTime) %>
        </td>
        <td>
            <%: item.comment %>
        </td>

        <td>
            <%: item.formOfP1.Descr.Trim() %>
        </td>
        <td>
            <%: item.waiterID %>
        </td>
 
     </tr>  
<% } %>

</table>


