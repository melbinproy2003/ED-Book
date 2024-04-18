
var textArea = document.getElementById("msg");
var userId = document.getElementById("txt_uid");
var teacherId = document.getElementById("txt_tid");





function sendChat() {
    var msg = textArea.value;
    var uid = userId.value;
    var tid = teacherId.value;
  
        $.ajax({
            url: "AjaxChat.jsp",
            type: "POST",
            data: {chat: msg, uid:uid,tid:tid},
            success: function(result) {
                textArea.value = "";
                $('#conversation').animate({scrollTop: $('#conversation')[0].scrollHeight});
                reloadSection();
            }
        });


    


}

reloadSection();

$(document).ready(function() {
    setInterval(function() {
        reloadSection("hi");
        console.log();
    }, 5000);
});

function reloadSection() {
    $("#conversation").load('Load.jsp?uid='+userId.value+'tid='+teacherId.value);
    $('#conversation').animate({scrollTop: $('#conversation')[0].scrollHeight});
}














   