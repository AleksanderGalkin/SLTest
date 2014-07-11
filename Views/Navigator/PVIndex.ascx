<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<SLTest.Models.Navigator<SLTest.Models.VMMenuItem>>" %>
<h2>Navigator menu</h2>

        <% using (Html.BeginForm("PVIndex","Navigator"))
           {%>
        <%: Html.ValidationSummary(true)%>
<%foreach (var i in Model.list)
  { %>
      <h3><%:i.stDescr%> </h3>
      <%foreach (var j in i.GetContent())
        {%>
    <p>
         <%=Html.CheckBox(j.nmItem,j.cbItem)%> <%:j.nmItem%>
   </p>
        <% }
  }%>


             <p>
                <input type="submit" value="Найти" />
                <%Html. %>
                <input type="button" value="Сбросить" />
            </p>
            <%
           }
               %>


<%--<%= Html.Action("PVIndex", "Home", new { pageNum = ViewBag.pn })%>--%>
