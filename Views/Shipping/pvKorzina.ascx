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
                   decimal amount = 0;
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
            <td >
               <%:Html.TextBoxFor(p => Model[i].Value, new { @class = "tbItCartCount" })%>
      
            </td>
            <td align="right" >
               <%: string.Format("{0:F2}", Model[i].Value * (Model[i].Key.drinkPrice() + Model[i].Key.optPrice()))%>
               <% amount=amount+Model[i].Value * (Model[i].Key.drinkPrice() + Model[i].Key.optPrice()); %>
            </td>
         </tr>
               
    <%}
    %>
    <tr>
        <td colspan="4" align="right" class="stImpInfo">
            Стоимость счёта:
        </td>
        <td align="right" class="stImpInfo">
            <%:string.Format("{0:F2}",amount) %>
        </td>
    </tr>
     </table>
     <p></p>
     <input type="submit" name="sendCart" value="Пересчитать" />
     <input type="submit" name="sendCart" value="Оформить заказ" />
     