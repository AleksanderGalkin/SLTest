<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<SLTest.Models.VMMenu<SLTest.Models.Sorts>>" %>



    <h2>Виды блюд (подкатегории)</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Наименование
            </th>
        </tr>

    <% foreach (var item in Model.items) { %>
    
        <tr>
            <td class="btTd">
<%: Ajax.ActionLink("E", "Administration", "Home", new { metName = "Edit", modName = "Sorts", id = item.ID },
                                              new AjaxOptions { UpdateTargetId = "aj",
                                                Url = Url.Action("Edit", "Sorts", new { id = item.ID })},new {@class="btRecords btEdit"})%> 
                                                                |
                 <%: Ajax.ActionLink("D", "Administration", "Home", new { metName = "Delete", modName = "Sorts", id = item.ID },
                            new AjaxOptions { UpdateTargetId = "aj",
                                              Url = Url.Action("Delete", "Sorts", new { id = item.ID }),
                                                Confirm="Вы действительно хотите удалить эту запись?",
                                                HttpMethod="Post"},new {@class="btRecords btDelete"})%>
            </td>

            <td>
                <%: item.Sort %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Ajax.ActionLink("Create New", "Administration", "Home",
                                    new{metName="Create",modName="Sorts"},
                                                            new AjaxOptions { UpdateTargetId = "aj", Url = Url.Action("Create", "Sorts") },
                                                new { @class = "btBody btInsert" })%>
    </p>
    <p>
        
        <%: Html.PageLinks(Model.paginginfo, x => Url.Action("Administration", "Home", new { modName = "Sorts", pageNum = x }),
                                                        x => Url.Action("PVIndex", "Sorts", new { pageNum = x }), "aj")%>
    </p>

