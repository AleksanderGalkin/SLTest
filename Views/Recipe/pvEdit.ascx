<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<SLTest.Models.Recipe>" %>

     <% using (Ajax.BeginForm("Edit","Recipe", new{id=Model.RecID},new AjaxOptions { UpdateTargetId = "aj" })) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.RecName) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.RecName) %>
                <%: Html.ValidationMessageFor(model => model.RecName) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Price) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Price, String.Format("{0:F}", Model.Price)) %>
                <%: Html.ValidationMessageFor(model => model.Price) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Describe) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Describe) %>
                <%: Html.ValidationMessageFor(model => model.Describe) %>
            </div>
            
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
         <%: Ajax.ActionLink("Back to List", "Administration", "Home",
                    new { metName = "PVIndex", modName = "Recipe", pageNum = 1 },
                    new AjaxOptions { UpdateTargetId = "aj", Url = Url.Action("PVIndex", "Recipe") },
                    new { @class = "btBody btToList" })%>
    </div>
