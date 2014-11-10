<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<SLTest.Models.Categories>" %>

     <% using (Ajax.BeginForm("Edit", "Categories", new { id = Model.ID }, new AjaxOptions { UpdateTargetId = "aj" }))
        {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Характеристика категории</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Category) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Category)%>
                <%: Html.ValidationMessageFor(model => model.Category)%>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Arrange) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Arrange, String.Format("{0:F0}", Model.Arrange)) %>
                <%: Html.ValidationMessageFor(model => model.Arrange) %>
            </div>
  
            <p>
                <input type="submit" value="Сохранить" />
            </p>
        </fieldset>

    <% } %>

    <div>
         <%: Ajax.ActionLink("Back to List", "Administration", "Home",
                                 new { metName = "PVIndex", modName = "Categories", pageNum = 1 },
                    new AjaxOptions { UpdateTargetId = "aj", Url = Url.Action("PVIndex", "Categories") },
                    new { @class = "btBody btToList" })%>
    </div>
