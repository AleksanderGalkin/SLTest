<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<string>>" %>

<ul>
<% foreach(var i in Model){ %>
<li>

<%=i %>
</li>
<%} %>

</ul>

<p>
        
        <%: Html.PageLinks(Model.paginginfo, x => Url.Action("Administration", "Home", new { modName = "Recipe", pageNum = x }),
                                            x => Url.Action("PVIndex", "Recipe", new { pageNum = x }),"aj")%>
    </p>