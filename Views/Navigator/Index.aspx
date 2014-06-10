<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SLTest.Models.Navigator<SLTest.Models.VMMenuItems>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="NavigatorContent" runat="server">

<h2>Navigator menu</h2>

        <% using (Html.BeginForm())
           {%>
       <%-- <%: Html.ValidationSummary(true)%>
<%foreach (var i in Model.list)
  { %>
      <h3><%:i.stDescr%> </h3>
      <%foreach (var j in i.GetContent())
        {%>
    <p>
         <%=Html.CheckBox(""+j.cbItem)%> 
         <%:j.nmItem%>
   </p>
        <%}--%> <%=Model.test = "sddddddd"%>
  
  
            <p>
                <input type="submit" value="Поместить в заказ" />
            </p>
          <% }  %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

<%--<%= Html.Action("Administration", "Home", new { modName = "Recipe",pageNum=1 })%>--%>

</asp:Content>