// INPUT TEXT CLEARER
function ClearSearchForm(param1, param2, param3) {
    if (document[param1][param2].value == param3) {
        document[param1][param2].value = "";
    }
}
function ResetSearchForm(param1, param2, param3) {
    if (document[param1][param2].value == "") {
        document[param1][param2].value = param3;
    }
}

//pop up box
function popup(page, w, h, id, x) {
    window.open(page, id, "location=no,menubar=no,scrollbars=yes,status=no,titlebar=no,toolbar=no,resizable=yes,width=" + w + ",height=" + h + ",directories=no,screenX=" + x + "%,screenY=50%");
}

function ErrorMsgHTML(msg) {
    return "<div class=\"error-list\"><div class=\"inside\"><ul class=\"ImgError\"><li><div class=\"msg-title\">Error!</div><div class=\"msg-body\">"
    + msg
    + "</div></li></ul></div></div>";
}

function AlertMsgHTML(msg) {
    return "<div class=\"alert-list\"><div class=\"inside\"><ul class=\"ImgOK\"><li><div class=\"msg-title\">Complete!</div><div class=\"msg-body\">"
     + msg
     + "</div></li></ul></div></div>";
}
 
function PopupMsgDialog(id) {
    //    if (typeof (w) == 'undefined') {
    //        w = 300;
    //    }
    $('#' + id).dialog({
        autoOpen: false,
        modal: true,
        draggable: false,
        width: 500,
        title: "Message",
        buttons: {
            "Close": function () {
                $('#' + id).dialog('close');
                $('#' + id).dialog('destroy');
                $('#' + id).hide();
                //$('#' + id).remove();
            }
        },
        resizable: false
    });
    $('#' + id).dialog('open');
}

