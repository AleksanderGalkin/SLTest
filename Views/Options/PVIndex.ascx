<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<SLTest.Models.VMMenu<SLTest.Models.Options>>" %>

 <h2>Добавки</h2>

    <table>
        <tr>
            <th></th>
     
            <th>
                Относится к напитку
            </th>
            <th>
                Наименование добавки
            </th>
            <th>
                Цена
            </th>
        </tr>

    <% foreach (var item in Model.items) { %>
    
        <tr>
            <td>
                 <%: Ajax.ActionLink("Edit", "pvEdit", "Options", new { id = item.OptID },
                new AjaxOptions { UpdateTargetId="aj",Url=Url.Action("Edit","Options",new { id = item.OptID })})%> |
               |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.OptID })%>
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
        <%: Html.ActionLink("Create New", "Create") %>
    </p>

     <p>
     <%:HtmlHelper.UnobtrusiveJavaScriptEnabled = true %>
       <%: Html.PageLinks(Model.paginginfo, x => Url.Action("Administration", "Home", new {modName="Options", pageNum = x }),
                                            x => Url.Action("PVIndex", "Options", new { pageNum = x }),
                                            "aj")%>

    </p>
