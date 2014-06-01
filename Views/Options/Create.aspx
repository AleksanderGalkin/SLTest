<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SLTest.Models.Options>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Создать новую добавку</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Реквизиты</legend>
            
<%--            <div class="editor-label">
                <%: Html.LabelFor(model => model.OptID) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.OptID) %>
                <%: Html.ValidationMessageFor(model => model.OptID) %>
            </div>
            --%>
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
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

