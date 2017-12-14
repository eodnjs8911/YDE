<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<script src='${pageContext.request.contextPath}/resources/fullcalendar/moment-with-locales.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/fullcalendar.min.js'></script>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/fullcalendar/fullcalendar.min.css' />
<script src='${pageContext.request.contextPath}/resources/fullcalendar/ko.js'></script>


<div id="calendar"></div>

<script type='text/javascript'>
	$('#calendar').fullCalendar({
		header : {
			left : 'prev,next today',
			center : 'title',
			right : 'month,basicWeek,basicDay,list'
		},
		defaultDate : '2017-11-12',
		navLinks : true, // can click day/week names to navigate views
		editable : true,
		
		 eventSources: [

		        // your event source
		        {
		            url: '/express/selectList.do',
		            type: 'POST',
		            data: {
		                custom_param1: 'something',
		                custom_param2: 'somethingelse'
		            },
		            error: function() {
		                alert('there was an error while fetching events!');
		            },
		            color: 'yellow',   // a non-ajax option
		            textColor: 'black' // a non-ajax option
		        }

		        // any other sources...

		    ]
	})
</script>