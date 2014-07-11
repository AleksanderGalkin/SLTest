﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SLTest.Models.Navigator<SLTest.Models.VMMenuItem>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="NavigatorContent" runat="server">

<h2>Navigator menu</h2>

        <% using (Html.BeginForm())
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

            
  
  
  
<%--           <%foreach (string tl in Model.tl)
              { %>
            <p><%:Html.CheckBox(tl) %> <%:tl %></p>

         <%}
            %>--%>
             <p>
                <input type="submit" value="Найти" />
            </p>
            <%
           }
               %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

<%= Html.Action("PVIndex", "Home", new { pageNum = ViewBag.pn })%>

</asp:Content>