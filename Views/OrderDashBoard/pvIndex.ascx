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
            <a href="#" id=<%=item.ID%> class="btSignal <%=item.getOState.Style%>"><%=item.getOState.Descr%></a>
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
        
        var objColor = $(".btBlink");

        var ar_objColors = new Array(3);

        objColor.each(function (i, item) {
            ar_objColors[i] = $(this).css("background-color");

        });
        var lFlag = flag_endOfTimer
        var setObjColor = function () {
            objColor.each(function (i, item) {
                
                $(this).css("background-color", ar_objColors[i]);
            });
            if (lFlag == flag_endOfTimer)
            setObjLightColorID=setTimeout(setObjLightColor, 500);
        }
        var setObjLightColor = function () {
            objColor.each(function (i, item) {
                var cHex = ar_objColors[i];
                var cRGB = getLight(cHex);
                $(this).css("background-color", cRGB);
            });

            setObjColorID=setTimeout(setObjColor, 500);
        }

        setObjLightColorID=setTimeout(setObjLightColor, 300);
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
          
            return 'rgb(' + Math.floor(a[0] * 0.9) + ',' + a[1] + ',' +Math.floor(a[2] * 0.6) + ')'; ;
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
                // <%: Html.menuCreate("12")%>
                var stageList = [, ['ordCreated', 'Создан заказ']
                                , ['ordCooking', 'Отправлен на кухню']
                                , ['ordCooked', 'Готов заказ']
                                , ['ordShiped', 'Доставлено']
                                , ['notReq', 'Счёт не запрошен']
                                , ['reqed', 'Счёт запрошен']
                                , ['cashed', 'Оплачено наличными']
                                , ['banked', 'Оплачено картой']];
                var stageMap = new Array(9);
                for (var i = 1; i <= 8; i++)
                    stageMap[i] = Array(9);
                stageMap[1][2] = 1;
                stageMap[2][3] = 1;
                stageMap[3][4] = 1;
                stageMap[5][6] = 1;
                stageMap[5][8] = 1;
                stageMap[6][7] = 1;

                var target = $(event.target);
                var targetStageID = 0;
                for (var i = 1; i <= stageList.length; i++) {
                    if (target.hasClass(stageList[i][0])) {
                        targetStageID = i;
                        break;
                    }
                }
                var $ul = $('<ul/>');
                for (var j = 1; j <= 8; j++) {
                    if (stageMap[targetStageID][j])
                            $ul.append('<li><a href="#">' + stageList[j][1] + '</a></li>')
                    }

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
                 $('<ul/>').append($ul));

                $('.context-menu').show('fast'); // Показываем меню с небольшим стандартным эффектом jQuery. Как раз очень хорошо подходит для меню
                
                
            }
            $('.context-menu li a').mousedown(function () {
                alert(targetStageID.toString()+'  '+$(this).text());
            });
        });
    });
 


</script>
