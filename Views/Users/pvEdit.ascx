<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<SLTest.Models.UserAndRoles>" %>

     <% using (Ajax.BeginForm("Edit", "UserAndRoles", new { id = Model.ID }, new AjaxOptions { UpdateTargetId = "aj" }))
        {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Пользователи данной группы</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.roleName)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.roleName)%>
                <%: Html.ValidationMessageFor(model => model.roleName)%>
            </div>
            Sorts            
            <p>
                <input type="submit" value="Сохранить" />
            </p>
        </fieldset>

    <% } %>

    <div>
         <%: Ajax.ActionLink("Back to List", "Administration", "Home",
                                 new { metName = "PVIndex", modName = "UserAndRoles", pageNum = 1 },
                                 new AjaxOptions { UpdateTargetId = "aj", Url = Url.Action("PVIndex", "UserAndRoles") },
                    new { @class = "btBody btToList" })%>
    </div>
