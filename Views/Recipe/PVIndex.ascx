<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<SLTest.Models.VMMenu<SLTest.Models.Recipe>>" %>



    <h2>Рецепты напитков</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Наименование
            </th>
            <th>
                Цена
            </th>
            <th>
                Описание
            </th>
        </tr>

    <% foreach (var item in Model.items) { %>
    
        <tr>
            <td class="btTd">
<%: Ajax.ActionLink("E", "Administration", "Home", new { metName = "Edit", modName = "Recipe", id = item.RecID },
                                              new AjaxOptions { UpdateTargetId = "aj",
                                                Url = Url.Action("Edit", "Recipe", new { id = item.RecID })},new {@class="btRecords btEdit"})%> 
                                                                |
                 <%: Ajax.ActionLink("D","Administration", "Home", new {metName="Delete",modName="Recipe", id = item.RecID },
                            new AjaxOptions { UpdateTargetId = "aj",
                                                Url = Url.Action("Delete", "Recipe", new { id = item.RecID }),
                                                Confirm="Вы действительно хотите удалить эту запись?",
                                                HttpMethod="Post"},new {@class="btRecords btDelete"})%>
            </td>

            <td>
                <%: item.RecName %>
            </td>
            <td>
                <%: String.Format("{0:F2}", item.Price) %>
            </td>
            <td>
                <%: item.Describe %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Ajax.ActionLink("Create New", "Administration", "Home",
                                    new{metName="Create",modName="Recipe"},
                                                new AjaxOptions { UpdateTargetId = "aj", Url = Url.Action("Create", "Recipe") },
                                                new { @class = "btBody btInsert" })%>
    </p>
    <p>
        
        <%: Html.PageLinks(Model.paginginfo, x => Url.Action("Administration", "Home", new { modName = "Recipe", pageNum = x }),
                                            x => Url.Action("PVIndex", "Recipe", new { pageNum = x }),"aj")%>
    </p>

