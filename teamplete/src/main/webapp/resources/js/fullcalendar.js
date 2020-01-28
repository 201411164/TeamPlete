/*=========================================================================================
    File Name: fullcalendar.js

    Description: Fullcalendar
    --------------------------------------------------------------------------------------
    Item Name: Vuexy  - Vuejs, HTML & Laravel Admin Dashboard Template
    Version: 2.0
    Author: PIXINVENT
    Author URL: http://www.themeforest.net/user/pixinvent
==========================================================================================*/

  $(document).ready(function() {

  // color object for different event types
  var colors = {
    primary: "#7367f0",
    success: "#28c76f",
    danger: "#ea5455",
    warning: "#ff9f43"
  };

  // chip text object for different event types
  var categoryText = {
    primary: "Others",
    success: "Business",
    danger: "Personal",
    warning: "Work"
  };
  var categoryBullets = $(".cal-category-bullets").html(),
    evtColor = "",
    eventColor = "";
  
  
  var calendarId = "";

  // calendar init
  calendarEl = document.getElementById('fc-default');

  calendar = new FullCalendar.Calendar(calendarEl, {
    plugins: ["dayGrid"],
    customButtons: {
      addNew: {
        text: ' 추가하기',
        click: function () {
          var calDate = new Date,
            todaysDate = new Date(calDate.getTime() - (calDate.getTimezoneOffset() * 60000 ))
            .toISOString()
            .split("T")[0];          
          
          $(".modal-calendar").modal("show");
          $(".modal-calendar .cal-submit-event").addClass("d-none");
          $(".modal-calendar .remove-event").addClass("d-none");
          $(".modal-calendar .cal-add-event").removeClass("d-none")
          $(".modal-calendar .cancel-event").removeClass("d-none")
          $(".modal-calendar .add-category .chip").remove();
          $("#cal-start-date").val(todaysDate);
          $("#cal-end-date").val(todaysDate);
          $(".modal-calendar #cal-start-date").attr("disabled", false);
        }
      }
    },
    header: {
      left: "addNew",
      //center: "dayGridMonth,timeGridWeek,timeGridDay",
      right: "prev,title,next"
    },
    displayEventTime: false,
    navLinks: true,
    editable: true,
    allDay: false,
    navLinkDayClick: function (date) {
      $(".modal-calendar").modal("show");
      console.log("this.dataset.goto:"+this.dataset);
      //$(".modal-calendar #cal-start-date").val(new Date(this.dataset.goto).toISOString().slice(0, 10));
      //$(".modal-calendar #cal-end-date").val(new Date(this.dataset.goto).toISOString().slice(0, 10));
    },
    dateClick: function (info) {
      $(".modal-calendar #cal-start-date").val(info.dateStr).attr("disabled", true);
      $(".modal-calendar #cal-end-date").val(info.dateStr);
    },
    // displays saved event values on click
    eventClick: function (info) {
    
      //task로 불러오는 경우일 때!!
     var taskdescription=(info.event.extendedProps.description);	
    	
      if(taskdescription.substring(0,12)=="taskCalendar"){
    	  taskdescription.substring(12,taskdescription.length);
    	  let taskId = taskdescription.substring(12,taskdescription.length);
    	  console.log("taskId"+taskId);
    	  location.href = "/taskdetail/" + taskId;
      //DB에 저장되어 있는 Calendar 일정을 불러오는 경우일 때!!   
      }else{
    	  console.log("벨류값"+(info.event.extendedProps.description));
    	  $(".modal-calendar").modal("show");
    	  calendarId = info.event.id;
    	  console.log("캘린더 아이디 확인: " + calendarId);
          $(".modal-calendar #cal-event-title").val(info.event.title);
          $(".modal-calendar #cal-start-date").val(moment(info.event.start).format('YYYY-MM-DD'));
          $(".modal-calendar #cal-end-date").val(moment(info.event.end).format('YYYY-MM-DD'));
          $(".modal-calendar #cal-description").val(info.event.extendedProps.description);
          $(".modal-calendar .cal-submit-event").removeClass("d-none");
          $(".modal-calendar .remove-event").removeClass("d-none");
          $(".modal-calendar .cal-add-event").addClass("d-none");
          $(".modal-calendar .cancel-event").addClass("d-none");
          $(".calendar-dropdown .dropdown-menu").find(".selected").removeClass("selected");
          var eventCategory = info.event.extendedProps.dataEventColor;
          var eventText = categoryText[eventCategory]
          $(".modal-calendar .chip-wrapper .chip").remove();
          $(".modal-calendar .chip-wrapper").append($("<div class='chip chip-" + eventCategory + "'>" +
            "<div class='chip-body'>" +
            "<span class='chip-text'> " + eventText + " </span>" +
            "</div>" +
            "</div>"));  
      }
      
    },
  });

  // render calendar
  calendar.render();
  

  // appends bullets to left class of header
  $("#basic-examples .fc-right").append(categoryBullets);

  // Close modal on submit button
  $(".modal-calendar .cal-submit-event").on("click", function () {
    $(".modal-calendar").modal("hide");
    
    var removeEvent = calendar.getEventById(calendarId);
    removeEvent.remove();
    
    calendar.addEvent({
        id: calendarId,
        title: $("#cal-event-title").val(),
        start: $("#cal-start-date").val(),
        end: new Date($("#cal-end-date").val()),
        description: $("#cal-description").val(),
        color: evtColor,
        dataEventColor: eventColor,
        allDay: false
      });
  
    
    var calendarData = {
    		"calendarId" : calendarId,
    		"title" : $("#cal-event-title").val(),
    		"start" : $("#cal-start-date").val(),
    		"end" : new Date($("#cal-end-date").val()),
			"description" : $("#cal-description").val(),
			"color" : evtColor,
			"dataEventColor" : eventColor
			}
    
  
  $.ajax({
      type : 'PUT',
      url : '/calendar/modify',
      data : JSON.stringify(calendarData),
      contentType : "application/json",
      traditional: true,
      success : function(data) {
    	  console.log(data);
//    	  location.reload();
      },
		error : function(request, status, error) {
		  console.log(data);
          console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
      }
   }); 
    
  });

  // Remove Event
  $(".remove-event").on("click", function () {
    var removeEvent = calendar.getEventById(calendarId);
    removeEvent.remove();
    
    $.ajax({
        type : 'DELETE',
        url : '/calendar/delete/' + calendarId,
        success : function(data) {
      	  console.log(data);
//      	  location.reload();
        },
  		error : function(request, status, error) {
  			console.log(data);
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
     }); 
    
  });


  // reset input element's value for new event
  if ($("td:not(.fc-event-container)").length > 0) {
    $(".modal-calendar").on('hidden.bs.modal', function (e) {
      $('.modal-calendar .form-control').val('');
    })
  }

  // remove disabled attr from button after entering info
  $(".modal-calendar .form-control").on("keyup", function () {
    if ($(".modal-calendar #cal-event-title").val().length >= 1) {
      $(".modal-calendar .modal-footer .btn").removeAttr("disabled");
    }
    else {
      $(".modal-calendar .modal-footer .btn").attr("disabled", true);
    }
  });

  // open add event modal on click of day
  $(document).on("click", ".fc-day", function () {
    $(".modal-calendar").modal("show");
    $(".calendar-dropdown .dropdown-menu").find(".selected").removeClass("selected");
    $(".modal-calendar .cal-submit-event").addClass("d-none");
    $(".modal-calendar .remove-event").addClass("d-none");
    $(".modal-calendar .cal-add-event").removeClass("d-none");
    $(".modal-calendar .cancel-event").removeClass("d-none");
    $(".modal-calendar #cal-start-date").val(new Date(this.dataset.date).toISOString().slice(0, 10));
    $(".modal-calendar #cal-end-date").val(new Date(this.dataset.date).toISOString().slice(0, 10));
    $(".modal-calendar .add-category .chip").remove();
    $(".modal-calendar .modal-footer .btn").attr("disabled", true);
    evtColor = colors.primary;
    eventColor = "primary";
  });
  
  
  
  $(document).on("click", ".fc-day-top", function () {
	    $(".modal-calendar").modal("show");
	    $(".calendar-dropdown .dropdown-menu").find(".selected").removeClass("selected");
	    $(".modal-calendar .cal-submit-event").addClass("d-none");
	    $(".modal-calendar .remove-event").addClass("d-none");
	    $(".modal-calendar .cal-add-event").removeClass("d-none");
	    $(".modal-calendar .cancel-event").removeClass("d-none");
	    $(".modal-calendar #cal-start-date").val(new Date(this.dataset.date).toISOString().slice(0, 10));
	    $(".modal-calendar #cal-end-date").val(new Date(this.dataset.date).toISOString().slice(0, 10));
	    $(".modal-calendar .add-category .chip").remove();
	    $(".modal-calendar .modal-footer .btn").attr("disabled", true);
	    evtColor = colors.primary;
	    eventColor = "primary";
	  });
  
  

  // change chip's and event's color according to event type
  $(".calendar-dropdown .dropdown-menu .dropdown-item").on("click", function () {
    var selectedColor = $(this).data("color");
    evtColor = colors[selectedColor];
    eventTag = categoryText[selectedColor];
    eventColor = selectedColor;

    // changes event color after selecting category
    $(".cal-add-event").on("click", function () {
      calendar.addEvent({
        color: evtColor,
        dataEventColor: eventColor,
        className: eventColor
      });
    })

    $(".calendar-dropdown .dropdown-menu").find(".selected").removeClass("selected");
    $(this).addClass("selected");

    // add chip according to category
    $(".modal-calendar .chip-wrapper .chip").remove();
    $(".modal-calendar .chip-wrapper").append($("<div class='chip chip-" + selectedColor + "'>" +
      "<div class='chip-body'>" +
      "<span class='chip-text'> " + eventTag + " </span>" +
      "</div>" +
      "</div>"));
  });
  
 
 

  // calendar add event
  $(".cal-add-event").on("click", function () {
    $(".modal-calendar").modal("hide");
    var eventTitle = $("#cal-event-title").val(),
      teamId = $("#CalendarTeamId").val(),
      regMemberid = $("#regMemberid").val(),
      startDate = $("#cal-start-date").val(),
      endDate = $("#cal-end-date").val(),
      eventDescription = $("#cal-description").val(),
      correctEndDate = new Date(endDate);
    
    console.log("teamId:" + teamId);
    console.log("regMemberid: " + regMemberid);
    console.log("id: " + id);
    console.log("Title:"+eventTitle);
    console.log("start:"+startDate);
    console.log("Description:"+eventDescription);
    console.log("end:"+correctEndDate);
    console.log("color:"+evtColor);
    console.log("dataEventColor:"+eventColor);
    
    calendar.addEvent({
      id: null,
      title: eventTitle,
      start: startDate,
      end: correctEndDate,
      description: eventDescription,
      color: evtColor,
      dataEventColor: eventColor,
      allDay: false
    });
    
    var ajaxcalendar = {
    		"teamId" : teamId,
    		"regMemberid" : regMemberid,
    		"title" : eventTitle,
			"start" : startDate,
			"end" : correctEndDate,
			"description" : eventDescription,
			"color" : evtColor,
			"dataEventColor" : eventColor
			}
    
    
    $.ajax({
        type : 'POST',
        url : '/calendar/write',
        data : JSON.stringify(ajaxcalendar),
        contentType : "application/json",
        traditional: true,
        success : function(data) {
      	  console.log(data);
      	  location.reload();
        },
		error : function(request, status, error) {
			console.log(data);
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
     }); 
  });
  
  
  

  // date picker
  $(".pickadate").pickadate({
    format: 'yyyy-mm-dd'
  });

  });
