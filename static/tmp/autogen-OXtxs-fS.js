document.getElementById("hident4").innerHTML="This text was added by the Javascript part of the homepage widget.";$(function(){$("#js-commentForm").submit(function(event){event.preventDefault();var message=$("#js-createCommentTextarea").val();if(!message){alert("Please fill out the comment form first.");return};var csrfCookieName="XSRF-TOKEN";$.ajax({url:'http://localhost:3000/comments',type:'POST',headers:{"x-xsrf-token":Cookies.get(csrfCookieName)},contentType:"application/json",data:JSON.stringify({commentMessage:message}),success:function(data){var newNode=$("<li></li>");newNode.text(data.commentMessage);console.log(data);$("#js-commentList").append(newNode)},error:function(jqXHR,textStatus,errorThrown){console.log(jqXHR.responseText);console.log(jqXHR.status);console.log(jqXHR.readyState);console.log(jqXHR.statusText);console.log(textStatus);console.log(errorThrown)}})})})