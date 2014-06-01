<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SLTest.Models.VMOrder>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.OrderID) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.OrderID) %>
                <%: Html.ValidationMessageFor(model => model.OrderID) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.RecID) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.RecID) %>
                <%: Html.ValidationMessageFor(model => model.RecID) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.OrderRecID) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.OrderRecID) %>
                <%: Html.ValidationMessageFor(model => model.OrderRecID) %>
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

