<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<script type="text/javascript">
(function(global, $) {

    /**
     * 이미지 프리로딩.
     * @constructor
     * @requires {Class} jQuery
     * @param {DomElement} obj - DOM Image Element
     * @param {Function} cbf - 콜백함수
     * @returns {*}
     */
    function ImagePreload(obj, cbf)
    {
        if(!(this instanceof ImagePreload)) {
            return new ImagePreload(obj, cbf);
        }

        var that = this;
        this.image = $(obj);
        this.checkload = function(image)
        {
            if(cbf) cbf();
        };

        this.image.one('load',function() { that.checkload(this); }).each(function() {if(this.complete) $(this).trigger('load');});
    }

    /**
     * 이미지의 본래 사이즈를 구하는 함수.
     * @requires {Class} ImagePreload
     * @param {DOMElement} obj - DOM Image Element
     * @param {Function} cbf - 콜백함수
     * @returns {*}
     */
    function imageOriginalSize(obj, cbf)
    {

        var target = obj,
            tempImage = new Image();

        tempImage.src = target.src;
        tempImage.style.position = 'absolute';
        tempImage.style.left = '-9999px';
        tempImage.style.visibility = 'hidden';
        tempImage.style.width = 'auto';
        tempImage.style.height = 'auto';

        document.body.appendChild(tempImage);

        new ImagePreload(tempImage, function() {

            target.setAttribute('orgwidth', tempImage.offsetWidth);
            target.setAttribute('orgheight', tempImage.offsetHeight);

            document.body.removeChild(tempImage);
            if(cbf) cbf();
        });
    }

    /**
     * Window 창에 따라 Map 좌표 재계산.
     * @requires {Class} jQuery
     * @requires {Class} ImagePreload
     * @requires {Function} imageOriginalSize
     * @param {string} mapSelector  - 적용할 셀럭터 지정. (#id, .class, etc)
     * @returns {*}
     */
    function mapResizable( mapSelector ) {

        function resize() {

            var $map = $(this),
                $area = $map.find('area'),
                $image = $('[usemap="#' + $map.attr('name') + '"]'),
                ratio = $image.width() / $map.data('ORIGIN_WIDTH');

            for(var k = 0, z = $area.length; k<z; k++) {
                var coords = $area.eq(k).attr("coords").split(', ');

                for(var i=0; i<coords.length; i++) {
                    var nums = coords[i].split(',');

                    for(var j=0; j<nums.length; j++) {
                        nums[j] = parseFloat(nums[j] * ratio).toFixed(2);
                    }

                    coords[i] = nums.join(',');
                }
                $area.eq(k).attr("coords", coords.join(","));
            }

            $map.data('ORIGIN_WIDTH', $image.width());
        }

        function revertMatrix() {
            var $map = $(this),
                $area = $map.find('area');

            for(var i = 0, j = $area.length; i<j; i++) {
                $area.eq(i).attr('coords', $area.eq(i).data('ORIGIN_MATRIX') )
            }
        }

        function initialize() {

            var $map = $(this),
                $area = $map.find('area'),
                $image = $('[usemap="#' + $map.attr('name') + '"]'),
                ev = $._data(this, 'events');

            if(ev && ev.revertMatrix) {
                console.error('이 메세지는 Selector 가 중첩 되었을 때에 발생 합니다. 중복 호출 되는 Selector가 있는지 확인이 필요합니다.', this);
                return;
            }

            $map.on('setResize', resize);
            $map.on('revertMatrix', revertMatrix);

            for(var i = 0, j = $image.length; i < j; i++) {
                imageOriginalSize($image.eq(0).get(0), function() {
                    $map.data({
                        'ORIGIN_WIDTH' : parseInt($image.attr('orgwidth'),10)
                    }).trigger('setResize');
                });
            }

            for(var k = 0, z = $area.length; k < z; k++) {
                $area.eq(k).data({
                    'ORIGIN_MATRIX' : $area.eq(k).attr('coords')
                });
            }

            $(window).on('resize.mapResizable', function() { $map.trigger('setResize'); });
        }

        return this.each(initialize);
    }

    $.fn.mapResizable = mapResizable;

})(this, jQuery);
</script>
</head>
<body>
	<img src="${pageContext.request.contextPath}/resources/images/Main_menubar.png"
		alt="menu_select" usemap="#menu_select" width="100%" >
	<map id="menu_select" name="menu_select">
		<area shape="rect" alt="MD1_1" title="일반이사" 
		coords="26,74,168,218" href="go.do?go=MD1/MD1_1" target="" />
		<area shape="rect" alt="MD1_2" title="원룸이사" 
		coords="198,74,336,218" href="go.do?go=MD1/MD1_2" target="" />
		<area shape="rect" alt="MD1_4" title="기업이사" 
		coords="376,74,516,218" href="go.do?go=MD1/MD1_4" target="" />
		<area shape="rect" alt="MD1_5" title="포장이사" 
		coords="542,74,690,218" href="go.do?go=MD1/MD1_5" target="" />
		
		<area shape="rect" alt="MI1_1" title="이사체크리스트" 
		coords="718,66,858,212" href="go.do?go=MI1/MI1_1" target="" />
		<area shape="rect" alt="MI1_2" title="계약시유의사항" 
		coords="890,66,1030,212" href="go.do?go=MI1/MI1_2" target="" />
		<area shape="rect" alt="MI1_3" title="이사하기좋은날" 
		coords="1066,66,1206,212" href="go.do?go=MI1/MI1_3" target="" />
		<area shape="rect" alt="MI1_4" title="이사가격산정방식" 
		coords="1232,66,1388,212" href="go.do?go=MI1/MI1_4" target="" />
	</map>
	<script>
	$(function() {
	    $('#menu_select').mapResizable(); // id 
	});
	</script>
</body>
</html>
