<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SLTest.Models.VMMenu<SLTest.Models.Recipe>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

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
        <%: Html.PageLinks(Model.paginginfo, x => Url.Action("Index",new{pageNum=x}))%>
    </p>
    <div>
        <%: Html.ActionLink("Назад в меню администрирования","Administration","Home") %>
    </div>

</asp:Content>

