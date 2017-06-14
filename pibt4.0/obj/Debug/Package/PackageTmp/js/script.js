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

function show(location, gridnum) {
    var innerText, element;
    //check the link to see who the carrier is
    link = document.getElementById(gridnum == 1
        ? "PlaceHolderMain_MiddlePlaceHolder_MainContentPlaceHolder_medSearch"
        : "PlaceHolderMain_MiddlePlaceHolder_MainContentPlaceHolder_denSearch");
    //set the tool tip 
    if (gridnum == 1) {
        innerText = location == 'provider'
           ? link.host.search("blue") > -1
               ? "<span style=\"padding:10px;\">The <strong>Provider ID</strong> is a 9 character ID for Blue Shield</span><br/><img src=\"../images/ProviderLocations/BlueMedProvider.png\" style=\"width:740px;height:440px;padding:5px;\" />"
               : "<span style=\"padding:10px;\">The <strong>Provider ID</strong> is a 6 digit ID for Health Net</span><br/><img  src=\"../images/ProviderLocations/HNprovider.png\" style=\"width:740px;height:440px;padding:5px; \" />"
           : link.host.search("blue") > -1
                ? "<span style=\"padding:10px;\">The <strong>Medical Group IPA/Enrollment Id</strong> is a 9 digit ID for Blue Shield</span><br/><img src=\"../images/ProviderLocations/BlueMedIPA.png\" style=\"width:900px;height:500px;padding:5px;\" />"
                : "<span style=\"padding:10px;\">The <strong>Medical Group IPA/Enrollment Id</strong> is a 10 digit ID for Health Net</span><br/><img  src=\"../images/ProviderLocations/HNIPA.png\" style=\"width:740px;height:440px;padding:5px; \" />";
    }
    else {
        if (link != null) {
            var den = link.host;
            den = den.replace("www.", "");
            den = den.replace(".com", "");
            switch (den) {
                case "humana":
                    innerText = location == 'provider'
                        ? "<span style=\"padding:10px;\"></span><br/><img src=\"../images/ProviderLocations/HumanProviderinfo.png\" style=\"width:740px;height:440px;padding:5px;\" />"
                        : "<span style=\"padding:10px;\"></span><br/><img  src=\"../images/ProviderLocations/HumanaDentalOffice.png\" style=\"width:740px;height:440px;padding:5px; \" />";
                    break;
                case "hcpdirectory.cigna":
                    innerText = location == 'provider'
                        ? "<span style=\"padding:10px;\"></span><br/><img src=\"../images/ProviderLocations/CignaOffice.png\" style=\"width:740px;height:440px;padding:5px;\" />"
                        : "<span style=\"padding:10px;\"></span><br/><img  src=\"../images/ProviderLocations/CignaDentalProvider.png\" style=\"width:740px;height:440px;padding:5px; \" />";
                    break;
                case "blueshieldca":
                    innerText = location == 'provider'
                        ? "<span style=\"padding:10px;\"></span><br/><img src=\"../images/ProviderLocations/BlueShieldDental.png\" style=\"width:740px;height:440px;padding:5px;\" />"
                        : "";
                    break;
            }
        }
    }

    //get the tool tip location
    element = getToolTip(location, gridnum);
    //display tool tip
    if (innerText != "") {
        element.innerHTML = innerText;
        element.style.display = "inline";
    }
}

function unshow(location, gridnum) {
    var element = getToolTip(location, gridnum);
    element.style.display = "none";
}

function getToolTip(location, gridnum) {
    return document.getElementById(gridnum == 1
        ? location == "provider"
            ? "medProvider"
            : "medOffice"
        : location == "provider"
            ? "denProvider"
            : "denOffice");
}

function OnClientLoad(treeView1) {
    if (!treeView1.get_selectedNode() && treeView1.get_nodes().getNode(0) != null)
        treeView1.get_nodes().getNode(0).toggle();
}

function Popup(bttn) {
    var popup = document.getElementById("popUp");
    bttn.innerText = popup.style.display == "inline" ? "Click to view Current Coverage" : "Click to hide Current Coverage";
    popup.style.display = popup.style.display == "inline" ? "none" : "inline";
}

function genPopUp(elId, open) {
    var popup = document.getElementById(elId);
    popup.style.display = open ? "inline" : "none";
}

function changeTab(sender) {
    var c = document.getElementById(sender);
    var leg = document.getElementById("stepName");
    var tmp1, tmp2;
    for (var i = 1; i < 6; i++) {
        tmp1 = document.getElementById("c_" + i);
        tmp2 = document.getElementById("a_" + i);
        if (tmp1 == c) {
            tmp1.style.display = "inline";
            tmp2.style.fontWeight = "bold";
            tmp2.style.color = "#004B84";
            leg.innerHTML = tmp2.innerHTML;
        }
        else {
            tmp1.style.display = "none";
            tmp2.style.fontWeight = "normal";
            tmp2.style.color = "#428bca";
        }
    }
}

function genericYesNoButton(div, radioButtonList) {
    var element = document.getElementById(div);
    element.style.display = radioButtonList.rows[0].cells[0].firstChild.checked ? "none" : "inline";
}

function userConfirmation(confirmText) {
    return confirm(confirmText);
}

function scrollTop() {
    window.document.body.scrollTop = 0;
    window.document.documentElement.scrollTop = 0;
}

function timeChange(ddl, hiddenElem, val) {
    var element = document.getElementById(hiddenElem);
    var selectedVal = ddl.options[ddl.selectedIndex].value;
    element.style.display = selectedVal != val ? "none" : "block";
    var tmp = selectedVal != val;
    return tmp;
}

function OnCommand(sender, args) {
    var masterTable = sender.get_masterTableView();
    var row = masterTable.get_dataItems()[args.get_commandArgument()];
    var cell;
    var popup;
    switch (args.get_commandName()) {
        case "copy":
            cell = masterTable.getCellByColumnUniqueName(row, "name");
            var copied = cell.innerText;
            cell = masterTable.getCellByColumnUniqueName(row, "address");
            copied += " " + cell.innerHTML;
            cell = masterTable.getCellByColumnUniqueName(row, "city");
            copied += " " + cell.innerHTML;
            cell = masterTable.getCellByColumnUniqueName(row, "state");
            copied += ", " + cell.innerHTML;
            cell = masterTable.getCellByColumnUniqueName(row, "zip");
            copied += " " + cell.innerHTML;
            if (window.clipboardData && window.clipboardData.setData) {
                return clipboardData.setData("Text", copied);
            }
            else if (document.queryCommandSupported && document.queryCommandSupported("copy")) {
                var textarea = document.createElement("textarea");
                textarea.textContent = copied;
                textarea.style.position = "fixed";
                document.body.appendChild(textarea);
                textarea.select();
                try {
                    return document.execCommand("copy");
                } catch (ex) {
                    console.warn("Copy failed");
                    return false;
                } finally {
                    document.body.removeChild(textarea);
                }
            }
            args.set_cancel(true);
            break;
        case "open":
            popup = document.getElementById("qvPopUp");
            var tmp = document.getElementById("ucEmployerName");
            var cell = masterTable.getCellByColumnUniqueName(row, "name");
            tmp.innerHTML = cell.innerText;

            tmp = document.getElementById("ucAddress");
            cell = masterTable.getCellByColumnUniqueName(row, "address");
            tmp.innerHTML = cell.innerHTML;

            tmp = document.getElementById("ucCity");
            cell = masterTable.getCellByColumnUniqueName(row, "city");
            tmp.innerHTML = cell.innerHTML;

            tmp = document.getElementById("ucState");
            cell = masterTable.getCellByColumnUniqueName(row, "state");
            tmp.innerHTML = cell.innerHTML;

            tmp = document.getElementById("ucZip");
            cell = masterTable.getCellByColumnUniqueName(row, "zip");
            tmp.innerHTML = cell.innerHTML;

            tmp = document.getElementById("ucContact");
            cell = masterTable.getCellByColumnUniqueName(row, "contact");
            tmp.innerHTML = cell.innerHTML;

            tmp = document.getElementById("ucPhone");
            cell = masterTable.getCellByColumnUniqueName(row, "phoneNbr");
            tmp.innerHTML = cell.innerHTML;

            tmp = document.getElementById("ucEmail");
            cell = masterTable.getCellByColumnUniqueName(row, "email");
            tmp.innerHTML = cell.innerHTML;

            popup.style.display = "inline";
            break;
            args.set_cancel(true);
        case "snapshot":
            popup = document.getElementById("qvInvoice");
            popup.style.display = "inline";
            break;
    }
}


//function OnRowSelected(sender, args) {
//    var popup = document.getElementById("qvPopUp");
//    var masterTable = sender.get_masterTableView();
//    var row = masterTable.get_dataItems()[args.get_itemIndexHierarchical()];
//}

function require(sender, args) {
    var license = document.getElementById('PlaceHolderMain_MiddlePlaceHolder_MainContentPlaceHolder_page_2_licenseNo');
    var date = document.getElementById('ctl00_ctl00_ctl00_PlaceHolderMain_MiddlePlaceHolder_MainContentPlaceHolder_page_2_issue_dateInput');
    args.IsValid = !(license.value == "" || date.value == "") || (license.value == "" && date.value == "");
}

function showManagerList(ddl) {
    var managerDiv = document.getElementById('managerListdiv');
    managerDiv.style.display = ddl.value==2 ? "inline" : "none";
}