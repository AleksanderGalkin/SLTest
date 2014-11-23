<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<SLTest.Models.UserAndRoles>" %>

     <% using (Ajax.BeginForm("Edit", "UserAndRoles", new { id = Model.ID }, new AjaxOptions { UpdateTargetId = "aj" }))
        {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Пользователи данной группы</legend>
            <br />
            <div>
                <div style="display:inline-block;">
                    <p>Все</p>
                    <%: Html.ListBoxFor(model => model.users, new SelectList(ViewBag.AllUsers), new { style = "width:110px" })%>
                </div>  
                <div class="moveButtonBlock">
                   <div class="moveButton">      
                            <a href="#" onclick=""> >> </a>
                   </div>
                   <div class="moveButton">      
                            <a href="#" onclick=""> << </a>
                   </div>
                </div>                      
                <div style="display:inline-block;">
                    <p><%: Html.DisplayFor(model => model.roleName)%></p>
                    <%: Html.ListBoxFor(model => model.users, new SelectList(Model.users), new { style = "width:110px" })%>
                </div>
                <%: Html.ValidationMessageFor(model => model.users)%>
            </div>
        
            <p>
                <input type="submit" value="Сохранить" />
            </p>
       </fieldset>

    <% } %>

   <ul class="buttons">
      <li>
         <%: Ajax.ActionLink("Назад к списку", "Administration", "Home",
                                 new { metName = "PVIndex", modName = "Users", pageNum = 1 },
                                 new AjaxOptions { UpdateTargetId = "aj", Url = Url.Action("PVIndex", "Users") })%>
    </li>
</ul>
