<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Administration
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Администрирование</h2>

    <%: Html.ActionLink("Справочник напитков","Index","Recipe")%> 
    <br/>
    <%: Html.ActionLink("Справочник добавок", "Index","Options")%> 
    
    <p>
    <%: Html.ActionLink("Назад в магазин","Index","Home") %>
    </p>
</asp:Content>
