<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<SLTest.Models.shipTo>" %>


    <fieldset>
        <legend>Оформление заказа</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.tableNum) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.tableNum) %>
            <%: Html.ValidationMessageFor(model => model.tableNum) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.formOfP) %>
        </div>
        <div class="editor-field">
         <%: Html.DropDownListFor(model => model.formOfP, new SelectList(ViewBag.stList, "ID", "Descr", 1))%>
         <%: Html.ValidationMessageFor(model => model.formOfP)%>
        </div>
        
        <div class="editor-label">
            <%: Html.LabelFor(model => model.flImmediateBill) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.flImmediateBill) %>
            <%: Html.ValidationMessageFor(model => model.flImmediateBill) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.comment) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.comment)%>
            <%: Html.ValidationMessageFor(model => model.comment)%>
        </div>
        <p>
            <input type="submit" name="sendCart" value="Оправить" />
        </p>
    </fieldset>



