<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<SLTest.Models.VMMenu<SLTest.Models.Options>>" %>

 <h2>Дополнительные ингредиенты</h2>

    <table>
        <tr>
            <th></th>
     
            <th>
                Относится к блюду
            </th>
            <th>
                Наименование опции
            </th>
            <th>
                Цена
            </th>
        </tr>

    <% foreach (var item in Model.items) { %>
    
        <tr>
            <td class="btTd">
                 <%: Ajax.ActionLink("E", "Administration", "Home", new { metName = "Edit", modName = "Options", id = item.OptID },
                                              new AjaxOptions { UpdateTargetId = "aj",
                                                                Url = Url.Action("Edit", "Options", new { id = item.OptID })
                                              }, new { @class = "btRecords btEdit" })%>
 |
              
                <%: Ajax.ActionLink("D","Administration", "Home", new {metName="Delete",modName="Options", id = item.OptID },
                            new AjaxOptions { UpdateTargetId = "aj",
                                                Url = Url.Action("Delete", "Options", new { id = item.OptID }),
                                                Confirm="Вы действительно хотите удалить эту запись?",
                                              HttpMethod = "Post"
                            }, new { @class = "btRecords btDelete" })%>

            </td>

            <td>
                <%: item.Recipe.RecName %>
            </td>
            <td>
                <%: item.OptionName %>
            </td>
            <td>
                <%: String.Format("{0:F2}", item.Price) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        
        <%: Ajax.ActionLink("Create New", "Administration", "Home",
                                new{metName="Create",modName="Options"},
                                            new AjaxOptions { UpdateTargetId = "aj", Url = Url.Action("Create", "Options") },
                                            new { @class = "btBody btInsert" })%>
    </p>

     <p>
     
       <%: Html.PageLinks(Model.paginginfo, x => Url.Action("Administration", "Home", new {modName="Options", pageNum = x }),
                                            x => Url.Action("PVIndex", "Options", new { pageNum = x }),
                                            "aj")%>

    </p>
