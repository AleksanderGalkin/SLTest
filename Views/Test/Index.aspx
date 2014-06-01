<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<SLTest.Models.VMOrder>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table>
        <tr>
            <th></th>
            <th>
                OrderID
            </th>
            <th>
                ClientID
            </th>
            <th>
                NumTable
            </th>
            <th>
                OrderDataTime
            </th>
            <th>
                Comment
            </th>
           
            <th>
                RecName
            </th>
           
            <th>
                OptionName
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { /* id=item.PrimaryKey */ }) %> |
                <%: Html.ActionLink("Details", "Details", new { /* id=item.PrimaryKey */ })%> |
                <%: Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ })%>
            </td>
            <td>
                <%: item.OrderID %>
            </td>
            <td>
                <%: item.ClientID %>
            </td>
            <td>
                <%: item.NumTable %>
            </td>
            <td>
                <%: String.Format("{0:g}", item.OrderDataTime) %>
            </td>
            <td>
                <%: item.Comment %>
            </td>
     
            <td>
                <%: item.RecName %>
            </td>
                 <td>
                <%: item.OptionName %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

