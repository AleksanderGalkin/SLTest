<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<SLTest.Models.Recipe>" %>

    <h2>Create</h2>

<% using (Ajax.BeginForm("Create","Recipe", new AjaxOptions { UpdateTargetId = "aj" }))
   {%>
<%--  <% using (Html.BeginForm()) {%>--%>
        <%: Html.ValidationSummary(true)%>

        <fieldset>
            <legend>Fields</legend>

            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.RecName)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.RecName)%>
                <%: Html.ValidationMessageFor(model => model.RecName)%>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Price)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Price)%>
                <%: Html.ValidationMessageFor(model => model.Price)%>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Describe)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Describe)%>
                <%: Html.ValidationMessageFor(model => model.Describe)%>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
         <%: Ajax.ActionLink("Back to List", "Administration", "Home",
                    new { metName = "PVIndex", modName = "Recipe", pageNum = 1 },
                    new AjaxOptions { UpdateTargetId = "aj", Url = Url.Action("PVIndex", "Recipe") },
                    new {@class="btBody btToList" })%>
    </div>
