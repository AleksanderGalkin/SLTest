<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<SLTest.Models.VMMenu<SLTest.Models.Categories>>" %>



    <h2>Категории</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Наименование
            </th>
            <th>
                Сортировка
            </th>
        </tr>

    <% foreach (var item in Model.items) { %>
    
        <tr>
            <td class="btTd">
<%: Ajax.ActionLink("E", "Administration", "Home", new { metName = "Edit", modName = "Categories", id = item.ID },
                                              new AjaxOptions { UpdateTargetId = "aj",
                                                Url = Url.Action("Edit", "Categories", new { id = item.ID })},new {@class="btRecords btEdit"})%> 
                                                                |
                 <%: Ajax.ActionLink("D", "Administration", "Home", new { metName = "Delete", modName = "Categories", id = item.ID },
                            new AjaxOptions { UpdateTargetId = "aj",
                                              Url = Url.Action("Delete", "Categories", new { id = item.ID }),
                                                Confirm="Вы действительно хотите удалить эту запись?",
                                                HttpMethod="Post"},new {@class="btRecords btDelete"})%>
            </td>

            <td>
                <%: item.Category%>
            </td>
            <td>
                <%: String.Format("{0:F0}", item.Arrange) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Ajax.ActionLink("Create New", "Administration", "Home",
                                    new{metName="Create",modName="Categories"},
                                                new AjaxOptions { UpdateTargetId = "aj", Url = Url.Action("Create", "Categories") },
                                                new { @class = "btBody btInsert" })%>
    </p>
    <p>
        
        <%: Html.PageLinks(Model.paginginfo, x => Url.Action("Administration", "Home", new { modName = "Categories", pageNum = x }),
                                            x => Url.Action("PVIndex", "Categories", new { pageNum = x }),"aj")%>
    </p>

