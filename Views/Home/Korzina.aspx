<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<List<KeyValuePair<SLTest.Models.itCart, int>>>" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Korzina
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
       Url = Url.Action("CartSubmit","Home"),
       HttpMethod = "Post"
   }
   ))
   {%>
<%: Html.ValidationSummary(true)%>
   
    <div id="aj">

<%=Html.Action("pvKorzina", "Home")%>

    </div>
    <p></p>
   <%-- <%: Ajax.ActionLink ("Пересчитать","Korzina", "Home", new {name="sendCard" },
                            new AjaxOptions { UpdateTargetId = "aj",
                                                Url = Url.Action("pvKorzina", "Home"),
                                              HttpMethod = "Post"
                            }, new { @class = "btCart btReCalc" }) %>--%>
        
        <input type="submit" name="sendCart" value="Пересчитать" />
        <input type="submit" name="sendCart" value="Оплатить" />
    
<% 
   }//form    
}//if (Model == null || Model.Count == 0)

%>

<SCRIPT>
    function fRecalcCost() {
        alert("oops");
    }
</SCRIPT>
</asp:Content>
