﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<SLTest.Models.Options>" %>

   <h2>Создать новый ингредиент</h2>

    <% using (Ajax.BeginForm("Create","Options", new AjaxOptions { UpdateTargetId = "aj" }))
        {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Описание ингредиента</legend>

            <div class="editor-label">
                
                <%: Html.LabelFor(model => model.RecID) %>
                
            </div>
            <div class="editor-field">
           
           
     
             <%: Html.DropDownListFor(model => model.RecID, (SelectList)ViewData["RecList"])%>
             <%: Html.ValidationMessageFor(model => model.RecID) %>

               
             

            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.OptionName) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.OptionName) %>
                <%: Html.ValidationMessageFor(model => model.OptionName) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Price) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Price) %>
                <%: Html.ValidationMessageFor(model => model.Price) %>
            </div>
      


            <p>
                <input type="submit" value="Сохранить" />
            </p>
        </fieldset>

    <% } %>

    <div>
            <%: Ajax.ActionLink("Back to List", "Administration", "Home",
                    new { metName = "PVIndex",modName = "Options", pageNum = 1 },
                    new AjaxOptions { UpdateTargetId="aj", Url=Url.Action("PVIndex","Options")},
                    new { @class = "btBody btToList" })%>
    </div>
