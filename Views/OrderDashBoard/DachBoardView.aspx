<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Монитор заказов
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div id="UpdateBlock">
<%Html.RenderAction("pvIndex", "OrderDashBoard"); %>
</div>


<script type="text/javascript">
    $(document).ready(function () {
        setTimeout(upd, 5000);
    });

    upd = function () {
    
        $('#UpdateBlock').load(('<%=Url.Action("pvIndex","OrderDashBoard") %>'), {
            asd: Math.random() // что б IE не кешировал
        }, function () { setTimeout(upd, 5000); });
    }
</script>

</asp:Content>
