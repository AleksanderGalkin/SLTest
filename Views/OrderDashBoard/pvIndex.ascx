<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<SLTest.Models.shipTo>>" %>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>
    <tr>
 
        <th>
            tableNum
        </th>
        <th>
            OrderDateTime
        </th>
        <th>
            comment
        </th>
        <th>
            formOfP
        </th>
        <th>
            waiterID
        </th>
        <th>
            PSystem
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
        <td>
            <%: item.PSystem %>
        </td>
     </tr>  
<% } %>

</table>

<script type="text/javascript">
    $(document).ready(function () {
        alert(5);
        upd = function () {
            $('UpdateBlock').load(('<%=Url.Action("pvIndex","OrderDashBoard") %>'), {
                asd: Math.random() // что б IE не кешировал
            }, function () {
                alert("timer");
                setTimeout(UpdateBlock, 5000);
            });
        }
    });
</script>
