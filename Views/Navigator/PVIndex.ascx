<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<SLTest.Models.Navigator>" %>
<h2>категории</h2>

        <% using (Html.BeginForm("PVIndexPost", "Navigator",FormMethod.Post, new { id = "NavForm" }))
           {%>
        <%: Html.ValidationSummary(true)%>
<ul class='navMenu'>
<%foreach (var i in Model.GetSortedList())
  { %>
      <li class='navCat'><a href='#'><%:i.stDescr%></a>
      
      <div class='navAnnot'>
        <%foreach (var j in i.GetContent())
        {
            if (j.cbItem)
            {%>
            
                <%:j.nmItem %> 
            
            <%}
        }%>
      </div>
      <ul class='navPop'>
      <%foreach (var j in i.GetContent())
        {%>
            <li>
                 <%=Html.CheckBox(j.nmItem, j.cbItem, new { @class = "cbNavigator" })%> <%:j.nmItem%>
            </li>
        <% }%>
      </ul>
      </li>
  <%}%>
  </ul>

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
    $(document).ready(function () {
        $('.cbNavigator').click(function (event) {
            var currentAnnotation = $(this).parents('li.navCat').children('.navAnnot').text();
            $(this).parents('li.navCat').children('.navAnnot').text(currentAnnotation + ' ' + $(this).attr('name'))
        });
    });

    $(document).ready(function () {

        // Вешаем слушатель события нажатие кнопок мыши для всего документа:
        $(document).mouseout(function (event) {
            if (event.relatedTarget !== null) {
                alert(event.relatedTarget.className);
            }
            if (event.target.className.indexOf("navCat") >= 0) {
                alert(event.target);
            }
        });
    });
</script>