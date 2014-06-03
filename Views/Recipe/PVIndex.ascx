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
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.RecID }) %> |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.RecID })%>
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
        <%: Html.ActionLink("Create New", "Create") %>
    </p>
    <p>
        <%--<%: Html.Pager((int)Html.ViewData["PageNum"], (int)Html.ViewData["itemsPerPage"], (int)Html.ViewData["recordCount"])%>--%>
        <%: Html.PageLinks(Model.paginginfo, x => Url.Action("Administration","Home",new{pageNum=x}))%>
    </p>

