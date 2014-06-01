<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SLTest.Models.Recipe>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            
 <%--           <div class="editor-label">
                <%: Html.LabelFor(model => model.RecID) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.RecID) %>
                <%: Html.ValidationMessageFor(model => model.RecID) %>
            </div>--%>
            
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
                <%: Html.TextBoxFor(model => model.Price) %>
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
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

