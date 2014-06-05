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
                <%: Html.ActionLink("Edit", "Edit", new { id=item.OptID }) %> |
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
        <%--<%: Html.Pager((int)Html.ViewData["PageNum"], (int)Html.ViewData["itemsPerPage"], (int)Html.ViewData["recordCount"])%>--%>
       <%: Html.PageLinks(Model.paginginfo, x => Url.Action("Administration","Home",new{pageNum=x}))%>
       <%: Ajax.ActionLink("PVIndex", "PVIndex", "Options", new { pageNum = 2 }, new AjaxOptions { Confirm="sdas", UpdateTargetId = "aj", HttpMethod = "GET" })%>
    </p>
    <div>
        <%: Html.ActionLink("Назад в меню администрирования","Administration","Home") %>
    </div>