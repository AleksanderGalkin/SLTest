<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

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
    <table>
        <tr>
            <th>
                №
            </th>
            <th>
                позиция
            </th>
            <th>
                цена
            </th>
            <th>
                стоимость
            </th>
        </tr>
    <% 
    int i = 1;
    foreach (var key in Model.Keys)
    {%>

    
      <tr>
            <td>
              <%i++;%>
            </td>
            <td>
               <%: key.drink %>, <%: key.opt %>
            </td>
            <td>
               
           </td>
    
            <td>
               <%: Model[key] %>
            </td>
     </tr>

        
    <%}
    %>
    </table>
<%     
}
%>
</asp:Content>
