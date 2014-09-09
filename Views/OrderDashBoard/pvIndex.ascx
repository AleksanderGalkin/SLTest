<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<SLTest.Models.shipTo>>" %>
<div id='menu'>
</div>

<table>
    <tr>
 
        <th>
           Номер столика
        </th>
        <th>
            Время заказа
        </th>
        <th>
            Комментарий
        </th>
        <th>
            Форма оплаты
        </th>
        <th>
            Официант
        </th>
        <th>
            Состояние
        </th>
        <th>
            Оплата
        </th>
    </tr>

<% foreach (var item in Model) { %>
    <tr class="rowDashBoard">
        <td>
            <%: item.tableNum%>
        </td>
        <td>
            <%: String.Format("{0:g}", item.OrderDateTime)%>
        </td>
        <td>
            <%: item.comment%>
        </td>

        <td>
            <%: item.formOfP1.Descr.Trim()%>
        </td>
        <td>
            <%: item.waiterID%>  
        </td>
         <td>
            <%--<%: Html.ActionLink(item.getOState.Descr, "#", new { id = item.ID }, new { @class = "btSignal " + item.getOState.Style, onClick = "return false;" })%>--%>
            <a href="#" id=<%=item.ID%> class="btSignal btBlink <%=item.getOState.Style%>"><%=item.getOState.Descr%></a>
        </td>
         <td>
            <%--<%: Html.ActionLink(item.getPState.Descr, "#", new { id = item.ID }, new { @class = "btSignal " + item.getPState.Style, onClick = "return false;" })%>--%>
            <a href="#" id=<%=item.ID%> class="btSignal <%=item.getPState.Style%>"><%=item.getPState.Descr%></a>
        </td> 
     </tr>  
<% } %>

</table>

<script type="text/javascript">

    $(function () {
        var flag = false;
        var objColor = $(".btBlink");

        var ar_objColors = new Array(3);

        objColor.each(function (i, item) {
            alert($(this).Name);
            ar_objColors[i] = $(this).css("background-color");

        });

        var setObjColor = function () {
            objColor.each(function (i, item) {
               // alert(ar_objColors[i]);
                $(this).css("background-color", ar_objColors[i]);
            });
            setTimeout(setObjLightColor, 500);
        }
        var setObjLightColor = function () {
            objColor.each(function (i, item) {
                var cHex = ar_objColors[i];
                var cRGB = getLight(cHex);
                //alert(cRGB);
                $(this).css("background-color", cRGB);
            });
            setTimeout(setObjColor, 500);
        }

        setTimeout(setObjLightColor, 300);
    });

    

    function toR(h) { return parseInt((cutHex(h)).substring(0, 2), 16) }
    function toG(h) { return parseInt((cutHex(h)).substring(2, 4), 16) }
    function toB(h) { return parseInt((cutHex(h)).substring(4, 6), 16) }
    function cutHex(h) { return (h.charAt(0) == "#") ? h.substring(1, 7) : h }
    function getLight(cHex) {
        if (cHex.charAt(0) == "#")
            return 'rgb(' + toR(cHex) * 0.5 + ',' + toG(cHex) + ',' + toB(cHex) * 0.6 + ')';
        else
            var data = cHex.slice(cHex.indexOf('(')+1, cHex.indexOf(')'));
            a = data.split(',');
           // alert(a[2]);
            return 'rgb(' + a[0] * 0.9 + ',' + a[1] + ',' +a[2] * 0.6 + ')'; ;
    }


    $(document).ready(function () {

        // Вешаем слушатель события нажатие кнопок мыши для всего документа:
        $(document).mousedown(function (event) {

            // Убираем css класс selected-html-element у абсолютно всех элементов на странице с помощью селектора "*":
            $('*').removeClass('selected-html-element');
            // Удаляем предыдущие вызванное контекстное меню:
            $('.context-menu').remove();
            // Проверяем нажата ли именно правая кнопка мыши:
            if (event.which === 1
            && event.target.className.indexOf("btSignal") >= 0
            ) {

                // Получаем элемент на котором был совершен клик:
                var target = $(event.target);

                // Добавляем класс selected-html-element что бы наглядно показать на чем именно мы кликнули (исключительно для тестирования):
                target.addClass('selected-html-element');

                // Создаем меню:
                $('<div/>', {
                    'class': 'context-menu' // Присваиваем блоку наш css класс контекстного меню:
                })
            .css({
                left: (event.pageX - 5) + 'px', // Задаем позицию меню на X
                top: event.pageY + 'px' // Задаем позицию меню по Y
            })
            .appendTo('body') // Присоединяем наше меню к body документа:
            .append( // Добавляем пункты меню:
                 $('<ul/>').append('<li><a href="#">Remove element</a></li>'))
//                   
//                        .append('<li><a href="#">Remove element</a></li>')
//                        .append('<li><a href="#">Remove element</a></li>')
//                        .append('<li><a href="#">Add element</a></li>')
//                        .append('<li><a href="#">Element style</a></li>')
//                        .append('<li><a href="#">Element props</a></li>')
//                        .append('<li><a href="#">Open Inspector</a></li>')
                   
             $('.context-menu').show('fast'); // Показываем меню с небольшим стандартным эффектом jQuery. Как раз очень хорошо подходит для меню
            }

        });
    });
 


</script>
