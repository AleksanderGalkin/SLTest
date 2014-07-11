﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<SLTest.Models.Navigator<SLTest.Models.VMMenuItem>>" %>
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
         <%=Html.CheckBox(j.nmItem, j.cbItem, new { @class = "cbNavigator" })%> <%:j.nmItem%>
   </p>
        <% }
  }%>

  
             <p>
                <input type="submit" value="Найти" />
             
                <input type="button" value="Сбросить" onclick="checkAll();" />
            </p>
            <%
           }
               %>


<%--<%= Html.Action("PVIndex", "Home", new { pageNum = ViewBag.pn })%>--%>

<script>
    function checkAll() {
        var all = document.getElementsByClassName('cbNavigator');
       
        for (var i = 0; i < all.length; i++) {
            if (all.item(i).type && all.item(i).type=="checkbox")
                all.item(i).checked = false;
        } 
} 
</script>