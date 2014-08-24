<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<KeyValuePair<SLTest.Models.itCart, int>>>" %>


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
                   int n = 1;
                   for (int i = 0; i < Model.Count;i++ )
                   {%>

    
        <tr>
             <td>
              <%: n++%>
              <%: Html.HiddenFor(m => m[i].Key.drink)%> 
              <%: Html.HiddenFor(m => m[i].Key.opt)%> 
             </td>
            <td>
                <%: Model[i].Key.drinkName() + (Model[i].Key.opt != 0 ? " и " : "") + (Model[i].Key.opt != 0 ? Model[i].Key.optName() : "")%>
            </td>
            <td>
               <%: string.Format("{0:F2}", Model[i].Key.drinkPrice() + Model[i].Key.optPrice())%>
            </td>
            <td>
               <%:Html.EditorFor(p => Model[i].Value)%>
            </td>
            <td >
               <%: string.Format("{0:F2}", Model[i].Value * (Model[i].Key.drinkPrice() + Model[i].Key.optPrice()))%>
            </td>
         </tr>
               
    <%}
    %>
     </table>