<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Administration
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Администрирование</h2>

    <ul id="popup">
                    <li><%: Html.ActionLink("Справочник напитков", "Index", "Recipe")%></li> 
                    <li><%: Html.ActionLink("Справочник добавок", "Index", "Options")%></li>              
    </ul>
    
    <p>
    <%: Html.ActionLink("Назад в магазин","Index","Home") %>
    </p>
</asp:Content>
