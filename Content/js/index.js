$(document).ready(function () {
    $('.search_client_by').change(function () {
        var searchtype = $('.search_client_by').val();
        var options = $('#clients');
        if (searchtype == 'client_name') {
            options.html('<option value="Ankit Consultancy Pvt Ltd Indore"><option value="Jay Dev Civilcon India Private Limited Bhopal"><option value="Sushma Multitrade Pvt Ltd Mumbai"><option value="Evergreen Colours India Private Limited Indore"><option value="Kartikey Colonisers Pvt Ltd Ujjain"><option value="Krini Infratech Private Limited Dhar"><option value="Sarvottam Cropscience India Pvt Ltd Sagar">')
        }
        if (searchtype == 'client_gstin') {
            options.html('<option value="23AAAPO5542D1K5">')
        }
        if (searchtype == 'client_pan') {
            options.html('<option value="AAAPO5542D">')
        }
    })
});



$(document).ready(function () {
    $('.show_records_table').click(function () {
        $('.records_table').removeClass('hidden');
    });
    $('.hide_records_table').click(function () {
        $('.records_table').addClass('hidden');
    })
});

//$(document).ready(function () {
//    container = document.getElementById('radio_a_container');
//    links = container.getElementsByTagName('a');
//    for (i = 0; i < links.length; i++) {
//        links[i].addEventListener("click", function (e) {
//            e.preventDefault();
//            this.childNodes[1].checked = true;
//        });
//    }
//});



var sec = 0;
function RemainingTime(remaining) {

    sec = remaining * 60;
    setInterval(function () { SetRemaining(); }, 1000);

}
function SetRemaining() {
    //debugger;
    sec--;
    var hour = sec / 3600;
    var min = (sec - (parseInt(hour) * 3600)) / 60;
    var remsec = (sec - (parseInt(min) * 60) - (parseInt(hour) * 3600))
    //if (hour > 0) {
    //    $('#ContentPlaceHolder1_lblRemaining').html('Remaining Time :- ' + parseInt(hour) + ' Hours, ' + parseInt(min) + ' Minutes, ' + parseInt(remsec) + ' Seconds');
    //} else {
    //    $('#ContentPlaceHolder1_lblRemaining').html('Remaining Time :- ' + parseInt(min) + ' Minutes, ' + parseInt(remsec) + ' Seconds');
    //}
    if (hour > 0) {

        if (hour < 10) {
            $('.asd-hrs').html('0' + parseInt(hour));
        } else {
            $('.asd-hrs').html(parseInt(hour));
        }
        if (min < 10) {
            $('.asd-mns').html('0' + parseInt(min));
        } else {
            $('.asd-mns').html(parseInt(min));
        }
        if (remsec < 10) {
            $('.asd-scs').html('0' + parseInt(remsec));
        } else {
            $('.asd-scs').html(parseInt(remsec));
        }

    } else {

        if (min < 10) {
            $('.asd-mns').html('0' + parseInt(min));
        }
        else {
            $('.asd-mns').html(parseInt(min));
        }
        if (remsec < 10) {
            $('.asd-scs').html('0' + parseInt(remsec));
        }
        else {
            $('.asd-scs').html(parseInt(remsec));
        }
    }
}




$(function () {
    $('.datepicker_theme').datepicker(
        { yearRange: '1999:2012', }
        );
});
function LoadBasic() {


    $('#ContentPlaceHolder1_btnAdd').click(function () {
        $('#ContentPlaceHolder1_lblErrorMsg').html('');
        debugger;
        var GSTIN = $('#ContentPlaceHolder1_txtGstin').val().trim();
        var ddlPlaceSupply = $('#ContentPlaceHolder1_ddlPlaceSupply').val();

        var txtInvoiceNo = $('#ContentPlaceHolder1_txtInvoiceNo').val().trim();



        if (txtInvoiceNo.length > 0 && txtInvoiceNo.length < 17) {

        } else {
            $('#ContentPlaceHolder1_txtInvoiceNo').focus();
            $('#ContentPlaceHolder1_lblErrorMsg').html('Please Enter Invoice No');
            return false;
        }

        if (GSTIN != "") {
            if (GSTIN.length != 15) {
                $('#ContentPlaceHolder1_txtGstin').focus();
                $('#ContentPlaceHolder1_lblErrorMsg').html('Please Enter Correct GSTIN');
                return false;
            }
        }
        if (ddlPlaceSupply == "0") {
            $('#ContentPlaceHolder1_ddlPlaceSupply').focus();
            $('#ContentPlaceHolder1_lblErrorMsg').html('Please Enter Supply State');
            return false;
        }

        var ddltxtTaxRate = $('#ContentPlaceHolder1_ddltxtTaxRate').val();
        if (ddltxtTaxRate == "0") {
            $('#ContentPlaceHolder1_ddltxtTaxRate').focus();
            $('#ContentPlaceHolder1_lblErrorMsg').html('Please Select Rate');
            return false;

        }


    });


    //----------------------------- B2CL ----------------------

    $('#ContentPlaceHolder1_btnB2clAdd').click(function () {
        $('#ContentPlaceHolder1_lblB2clErrorMsg').html('');
        debugger;
        //  var GSTIN = $('#ContentPlaceHolder1_txtGstin').val().trim();
        var ddlB2clPlaceSupply = $('#ContentPlaceHolder1_ddlB2clPlaceOfSupply').val();
        var txtB2clInvoiceNo = $('#ContentPlaceHolder1_txtB2clInvoiceNo').val().trim();
        if (txtB2clInvoiceNo.length > 0 && txtB2clInvoiceNo.length < 17) {

        } else {
            $('#ContentPlaceHolder1_txtB2clInvoiceNo').focus();
            $('#ContentPlaceHolder1_lblB2clErrorMsg').html('Please Enter Correct Invoice No');
            return false;
        }
        if (ddlB2clPlaceSupply == "0") {
            $('#ContentPlaceHolder1_ddlB2clPlaceOfSupply').focus();
            $('#ContentPlaceHolder1_lblB2clErrorMsg').html('Please Enter Supply State');
            return false;
        }

        var ddltxtB2clRate = $('#ContentPlaceHolder1_ddltxtB2clRate').val();
        if (ddltxtB2clRate == "0") {
            $('#ContentPlaceHolder1_ddltxtB2clRate').focus();
            $('#ContentPlaceHolder1_lblB2clErrorMsg').html('Please Select Rate');
            return false;

        }

    });


    //----------------------------- B2Cs ----------------------

    $('#ContentPlaceHolder1_btnB2csAdd').click(function () {
        $('#ContentPlaceHolder1_lblB2clErrorMsg').html('');
        debugger;

        var ddlB2csPlaceSupply = $('#ContentPlaceHolder1_ddlB2csPlaceOfSupply').val();


        if (ddlB2csPlaceSupply == "0") {
            $('#ContentPlaceHolder1_ddlB2csPlaceOfSupply').focus();
            $('#ContentPlaceHolder1_lblB2csErrorMsg').html('Please Enter Supply State');
            return false;
        }

        var ddltxtB2csRate = $('#ContentPlaceHolder1_ddltxtB2csRate').val();
        if (ddltxtB2csRate == "0") {
            $('#ContentPlaceHolder1_ddltxtB2csRate').focus();
            $('#ContentPlaceHolder1_lblB2csErrorMsg').html('Please Select Rate');
            return false;

        }

    });

    //----------------------------- Cdnr ----------------------

    $('#ContentPlaceHolder1_btnCdnrAdd').click(function () {
        $('#ContentPlaceHolder1_lblCdnrErrorMsg').html('');
        debugger;

        var ddlCdnrPlaceSupply = $('#ContentPlaceHolder1_ddlCdnrPlaceOfSupply').val();
        var ddlCdnrDocType = $('#ContentPlaceHolder1_ddlCdnrDocType').val();


        if (ddlCdnrPlaceSupply == "0") {
            $('#ContentPlaceHolder1_ddlCdnrPlaceOfSupply').focus();
            $('#ContentPlaceHolder1_lblCdnrErrorMsg').html('Please Enter Supply State');
            return false;
        }
        if (ddlCdnrDocType == "0") {
            $('#ContentPlaceHolder1_ddlCdnrDocType').focus();
            $('#ContentPlaceHolder1_lblCdnrErrorMsg').html('Please Enter Document Type');
            return false;
        }

        var ddltxtCdnrRate = $('#ContentPlaceHolder1_ddltxtCdnrRate').val();
        if (ddltxtCdnrRate == "0") {
            $('#ContentPlaceHolder1_ddltxtCdnrRate').focus();
            $('#ContentPlaceHolder1_lblCdnrErrorMsg').html('Please Select Rate');
            return false;

        }

    });

    //----------------------------- Cdnur ----------------------

    $('#ContentPlaceHolder1_btnCdnurAdd').click(function () {
        $('#ContentPlaceHolder1_lblCdnurErrorMsg').html('');
        debugger;

        var ddlCdnurPlaceSupply = $('#ContentPlaceHolder1_ddlCdnurPlaceOfSupply').val();
        var ddlCdnurDocType = $('#ContentPlaceHolder1_ddlCdnurDocType').val();
        var ddlCdnurUrType = $('#ContentPlaceHolder1_ddlCdnurUrType').val();

        if (ddlCdnurUrType == "0") {
            $('#ContentPlaceHolder1_ddlCdnurUrType').focus();
            $('#ContentPlaceHolder1_lblCdnurErrorMsg').html('Please Enter UR Type');
            return false;
        }

        if (ddlCdnurDocType == "0") {
            $('#ContentPlaceHolder1_ddlCdnurDocType').focus();
            $('#ContentPlaceHolder1_lblCdnurErrorMsg').html('Please Enter Document Type');
            return false;
        }
        if (ddlCdnurPlaceSupply == "0") {
            $('#ContentPlaceHolder1_ddlCdnurPlaceOfSupply').focus();
            $('#ContentPlaceHolder1_lblCdnurErrorMsg').html('Please Enter Supply State');
            return false;
        }

        var ddltxtCdnurRate = $('#ContentPlaceHolder1_ddltxtCdnurRate').val();
        if (ddltxtCdnurRate == "0") {
            $('#ContentPlaceHolder1_ddltxtCdnurRate').focus();
            $('#ContentPlaceHolder1_lblCdnurErrorMsg').html('Please Select Rate');
            return false;

        }

    });



    //----------------------------- Exp ----------------------

    $('#ContentPlaceHolder1_btnExpAdd').click(function () {
        $('#ContentPlaceHolder1_lblExpErrorMsg').html('');
        debugger;


        var ddlExpExportType = $('#ContentPlaceHolder1_ddlExpExportType').val();

        if (ddlExpExportType == "0") {
            $('#ContentPlaceHolder1_ddlExpExportType').focus();
            $('#ContentPlaceHolder1_lblExpErrorMsg').html('Please Enter Export Type');
            return false;
        }

        var ddltxtExpRate = $('#ContentPlaceHolder1_ddltxtExpRate').val();
        if (ddltxtExpRate == "0") {
            $('#ContentPlaceHolder1_ddltxtExpRate').focus();
            $('#ContentPlaceHolder1_lblExpErrorMsg').html('Please Select Rate');
            return false;

        }

    });

    //----------------------------- AT ----------------------

    $('#ContentPlaceHolder1_btnAtAdd').click(function () {
        $('#ContentPlaceHolder1_lblAtErrorMsg').html('');
        debugger;


        var ddlAtPlaceOfSupply = $('#ContentPlaceHolder1_ddlAtPlaceOfSupply').val();

        if (ddlAtPlaceOfSupply == "0") {
            $('#ContentPlaceHolder1_ddlAtPlaceOfSupply').focus();
            $('#ContentPlaceHolder1_lblAtErrorMsg').html('Please Enter Place Of Supply');
            return false;
        }

        var ddltxtAtRate = $('#ContentPlaceHolder1_ddltxtAtRate').val();
        if (ddltxtAtRate == "0") {
            $('#ContentPlaceHolder1_ddltxtAtRate').focus();
            $('#ContentPlaceHolder1_lblAtErrorMsg').html('Please Select Rate');
            return false;

        }

    });

    //----------------------------- ATADJ ----------------------

    $('#ContentPlaceHolder1_btnAtAdjAdd').click(function () {
        $('#ContentPlaceHolder1_lblAtAdjErrorMsg').html('');
        debugger;


        var ddlATADJPlaceOfSupply = $('#ContentPlaceHolder1_ddlATADJPlaceOfSupply').val();

        if (ddlATADJPlaceOfSupply == "0") {
            $('#ContentPlaceHolder1_ddlATADJPlaceOfSupply').focus();
            $('#ContentPlaceHolder1_lblAtAdjErrorMsg').html('Please Select Place Of Supply');
            return false;
        }

        var ddltxtAtAdjRate = $('#ContentPlaceHolder1_ddltxtAtAdjRate').val();
        if (ddltxtAtAdjRate == "0") {
            $('#ContentPlaceHolder1_ddltxtAtAdjRate').focus();
            $('#ContentPlaceHolder1_lblAtAdjErrorMsg').html('Please Select Rate');
            return false;

        }

    });

    //----------------------------- Hsn ----------------------
    $('#ContentPlaceHolder1_btnHsnAdd').click(function () {
        $('#ContentPlaceHolder1_lblHsnErrorMsg').html('');
        debugger;


        var ddlHsnUQC = $('#ContentPlaceHolder1_ddlHsnUQC').val();

        if (ddlHsnUQC == "0") {
            $('#ContentPlaceHolder1_ddlHsnUQC').focus();
            $('#ContentPlaceHolder1_lblHsnErrorMsg').html('Please Select UQC');
            return false;
        }


    });

    //----------------------------- Docs ----------------------
    $('#ContentPlaceHolder1_btnDocsAdd').click(function () {
        $('#ContentPlaceHolder1_lblDocsErrorMsg').html('');
        debugger;


        var ddlDocsNatureOfDoc = $('#ContentPlaceHolder1_ddlDocsNatureOfDoc').val();

        if (ddlDocsNatureOfDoc == "0") {
            $('#ContentPlaceHolder1_ddlDocsNatureOfDoc').focus();
            $('#ContentPlaceHolder1_lblDocsErrorMsg').html('Please Select Nature Of Document');
            return false;
        }


    });



    $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true });

    $('.chzn-search input[type="text"]').addClass('form-control');
    $('.chzn-single').addClass('form-control');

    $('.datepicker_theme').datepicker(
        { yearRange: '1999:2012', }
        );
}







$(document).ready(function () {
    $("div.bhoechie-tab-menu>div.list-group>a").click(function (e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
        $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
    });
});