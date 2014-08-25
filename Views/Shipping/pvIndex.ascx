<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<SLTest.Models.shipTo>" %>


    <fieldset>
        <legend>Оформление заказа</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.table) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.table) %>
            <%: Html.ValidationMessageFor(model => model.table) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.typeOfPay) %>
        </div>
        <div class="editor-field">
         <%: Html.DropDownListFor(model => model.typeOfPay, new SelectList(Model.typeOfPay.GetType().GetEnumNames()) )%>
         <%: Html.ValidationMessageFor(model => model.typeOfPay) %>
        </div>
        
        <div class="editor-label">
            <%: Html.LabelFor(model => model.flImmediateBill) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.flImmediateBill) %>
            <%: Html.ValidationMessageFor(model => model.flImmediateBill) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Comment) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Comment)%>
            <%: Html.ValidationMessageFor(model => model.Comment)%>
        </div>
        <p>
            <input type="submit" name="sendCart" value="Оплатить" />
        </p>
    </fieldset>



