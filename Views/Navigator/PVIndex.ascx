<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<SLTest.Models.Navigator>" %>
<h2>категории</h2>

        <% using (Html.BeginForm("PVIndexPost", "Navigator",FormMethod.Post, new { id = "NavForm" }))
           {%>
        <%: Html.ValidationSummary(true)%>
<%foreach (var i in Model.list)
  { %>
      <h3><%:i.stDescr%> </h3>
      <%foreach (var j in i.GetContent())
        {%>
    <p>
         <%=Html.CheckBox(j.nmItem, j.cbItem, new { @class = "cbNavigator" })%> <%:j.nmItem%>
   </p>
        <% }
  }%>

            <ul class="buttons">
                <li>
                    <a href="#" onclick="document.forms['NavForm'].submit();">Найти</a>
                </li>
                <li>
                    <a href="#" onclick="unCheckAll();">Сбросить</a>
                </li>
            </ul>
            <%
           }
               %>


<%--<%= Html.Action("PVIndex", "Home", new { pageNum = ViewBag.pn })%>--%>

<script>

    function unCheckAll() {
        if (document.getElementsByClassName == undefined) {
            document.getElementsByClassName = function (cl) {
                var retnode = [];
                var myclass = new RegExp('\\b' + cl + '\\b');
                var elem = this.getElementsByTagName('*');
                for (var i = 0; i < elem.length; i++) {
                    var classes = elem[i].className;
                    if (myclass.test(classes)) {
                        retnode.push(elem[i]);
                    }
                }
                return retnode;
            }
        }; 
        var all = document.getElementsByClassName("cbNavigator");
       
        for (var i = 0; i < all.length; i++) {
         //   if (all.item(i).type && all.item(i).type=="checkbox") //IE>8
            //       all.item(i).checked = false;                      //IE>8
              if (all[i].type && all[i].type=="checkbox") //IE8
                     all[i].checked = false;                      //IE8
        }
        document.forms["NavForm"].submit();
} 
</script>