<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<SLTest.Models.VMMenu<SLTest.Models.UserAndRoles>>" %>


    <h2>Группы (роли)</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Наименование
            </th>
        </tr>

<tr>
<% foreach(var item in Model.items){ %>
            <td class="btTd">
                <%: Ajax.ActionLink(" ", "Administration", "Home", new { metName = "EditStr", modName = "UserAndRoles", id = item.ID },
                                              new AjaxOptions { UpdateTargetId = "aj",
                                                Url = Url.Action("EditStr", "UserAndRoles", new { id = item.ID })},new {@class="btRecords icon-pencil"})%> 
            </td>

            <td>
                <%: item.roleName%>
            </td>
<%} %>
</tr>
</table>
<p>
        
        <%: Html.PageLinks(Model.paginginfo, x => Url.Action("Administration", "Home", new { modName = "UserAndRoles", pageNum = x }),
                                            x => Url.Action("PVIndex", "UserAndRoles", new { pageNum = x }),"aj")%>
</p>