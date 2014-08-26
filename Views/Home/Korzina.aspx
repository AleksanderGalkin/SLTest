<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<List<KeyValuePair<SLTest.Models.itCart, int>>>" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Ваш заказ
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Ваш заказ</h2>

   <% if (Model == null || Model.Count == 0)
{%>
    Корзина пуста
<%}
else
{
    //decimal price = 0;
    %>
<% using (Ajax.BeginForm(new AjaxOptions
   {
       UpdateTargetId = "aj",
       Url = Url.Action("CartSubmit","Shipping"),
       HttpMethod = "Post"
   }
   ))
   {%>
<%: Html.ValidationSummary(true)%>
   
    <div id="aj">

<%=Html.Action("pvKorzina", "Shipping")%>

    </div>
<% 
   }//form    
}//if (Model == null || Model.Count == 0)

%>


</asp:Content>
