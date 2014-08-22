<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Dictionary<SLTest.Models.itCart,int>>" %>


 <table>
        <tr>
            <th>
                №
            </th>
            <th>
                наименовние
            </th>
            <th>
                цена
            </th>
            <th>
                количество
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
              <%:i++%>
            </td>
            <td>
               <%: key.drinkName() +(key.opt!=0?" и ":"")+ (key.opt!=0?key.optName():"")%>
            </td>
            <td>
               <%: string.Format("{0:F2}", key.drinkPrice() + key.optPrice())%>
           </td>
            <td>
               <%:Html.TextBoxFor(p => Model[key], new {@class="tbItCartCount" })%>
            </td>
            <td >
               <%: string.Format("{0:F2}", Model[key] * (key.drinkPrice() + key.optPrice()))%>
            </td>
         </tr>
               
    <%}
    %>
     </table>