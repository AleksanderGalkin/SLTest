<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<SLTest.Models.VMMenu<SLTest.Models.VMMenuItem>>" %>

    <h2>Меню</h2>

        <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        

    <table class="single">
    <col  class="s_col_small">
    <col  class="s_col_middle">
    <col  class="s_col_middle">
    <col  class="s_col_middle">

        <tr>
            <th></th>   

            <th>
                Напиток
            </th>
            <th>
                Цена
            </th>
            <th>
                Добавка (опция)
            </th>
        </tr>
        
    <% foreach (var item in Model.items) { %>
    
        <tr>
            <td>
                
                <%--<%: Html.ActionLink("Details", "Details", new { /* id=item.PrimaryKey */ })%> --%>
                <%=Html.CheckBox(""+item.RecID)%> 
            

            </td>

            <td>
                <%: item.RecName %>
            </td>
            <td>
                <%: String.Format("{0:F}", item.Price) %>
            </td>
            <td>
                 <%: Html.DropDownListFor(p => item.OptID, new SelectList(item.GetSprOpt(), "OptID", "StringForSelectList"),new{@class="sel_table"})%>
                 <%--<%: Html.DropDownListFor(p => item.OptID, (SelectList)ViewData["RecList"])%>--%>
            </td>
        </tr>
    
    <% } %>

    <% for (int i = 0; i < Model.paginginfo.ItemsPerPage-Model.items.Count();i++ )
       { %>
    <tr>
            <td>
                <%=Html.CheckBox("empty",new  {disabled="disabled"})%>
            </td>
            <td>
                
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    
    <% } %>
    </table>
    <p>
        
        <%: Html.PageLinks(Model.paginginfo, x => Url.Action("Index","Navigator",new{pageNum=x}))%>
       
    </p>

             <p>
                <input type="submit" value="Поместить в заказ" />
            </p>

     <% } %>

     <%  var count = 0;
         var ses=Session["sKorzina"] as Dictionary<int, int>;
         if (ses != null)
             foreach (var key in ses.Keys)
            {
              count = count + ses[key];
            }
    %>


 <p>
                
       <%: Html.ActionLink("Ваш заказ:"+count, "Korzina")%> 
                
   </p>

