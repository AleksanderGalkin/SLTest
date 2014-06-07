<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Administration
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 

<%-- <script ="<%=Url.Content("~/Scripts/jquery-1.4.4.min.js")%>" type="text/javascript"></script>
    <script ="<%=Url.Content("~/Scripts/jquery.unobtrusive-ajax.min.js")%>" type="text/javascript"></script>
--%>
    <h2>Администрирование</h2>

    <ul id="popup">
        
        <li><%: Ajax.ActionLink("Справочник напитков", "Administration", "Home",
                    new { metName = "PVIndex",modName = "Recipe", pageNum = 1 },
                    new AjaxOptions { UpdateTargetId="aj", Url=Url.Action("PVIndex","Recipe")})%></li> 
        <li><%: Ajax.ActionLink("Справочник добавок", "Administration", "Home",
                    new { metName = "PVIndex", modName = "Options", pageNum = 1 },
                    new AjaxOptions { UpdateTargetId="aj", Url=Url.Action("PVIndex","Options")})%></li>              
    </ul>
    <div id="aj">

            <%=Html.Action((string)ViewBag.mtn, (string)ViewBag.mn, new { pageNum = ViewBag.pn })%>

            

     </div>
    <p>
    <%: Html.ActionLink("Назад в магазин", "Index", "Home")%>
    </p>
</asp:Content>
