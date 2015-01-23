function fcl(){
    var containerVolume = document.getElementById("orderItem.volume").value;

    if(containerVolume != ''){
        var containerQuantity = document.getElementById("orderItem.quantity").value;
        var containerSize = document.getElementById("orderItem.nameSize").value;

        if(containerQuantity == '') {
            document.getElementById("orderItem.nameSize").value ='';
            document.getElementById("orderItem.volume").value = '';
            document.getElementById("orderItemVolume").value = '';
        }

        if (containerSize == '10 FOOTER'){
            var totalVolume = containerQuantity * 14;
        }else if (containerSize == '20 FOOTER'){
            var totalVolume = containerQuantity * 28;
        }else if (containerSize == '40 FOOTER') {
            var totalVolume = containerQuantity * 56;
        }

        document.getElementById("orderItem.volume").value = totalVolume;
        document.getElementById("orderItemVolume").value = totalVolume;
    }
}


function serviceValidate(){
	var serviceReq = document.getElementById("serviceReq");
	var pos = serviceReq.options[serviceReq.selectedIndex].value;
	if(pos == "FULL CARGO LOAD"){

        document.getElementById("item").style.display = 'none';
        document.getElementById("item-menu").style.display = 'none';
	    document.getElementById("cargo-menu").style.display = 'block';


	}
	else if(pos == "LESS CARGO LOAD" || pos == "LOOSE CARGO LOAD" || pos == "ROLLING CARGO LOAD"){

        document.getElementById("cargo").style.display = 'none';
        document.getElementById("cargo-menu").style.display = 'none';
	    document.getElementById("item-menu").style.display = 'block';


	}
}

function typeValidate(){
    var typeReq = document.getElementById("mode");
    var type = typeReq.options[typeReq.selectedIndex].value;

    if(type == "DOOR TO PIER"){
        $("#deliveryaddress").prop('disabled', true);
        $("#pickupaddress").prop('disabled', false);
        $("#datepicker1").prop('disabled', false);
        $("#datepicker2").prop('disabled', true);
    }
    else if(type == "PIER TO DOOR"){
        $("#deliveryaddress").prop('disabled', false);
        $("#pickupaddress").prop('disabled', true);
        $("#datepicker1").prop('disabled', true);
        $("#datepicker2").prop('disabled', false);
    }
    else if(type == "PIER TO PIER"){
        $("#datepicker1").prop('disabled', true);
        $("#datepicker2").prop('disabled', true);
        $("#pickupaddress").prop('disabled', true);
        $("#deliveryaddress").prop('disabled', true);
    }

}

function getMaxValue(type, value){
    if(value == '10 FOOTER'){
        if(type == 'VOLUME'){ return 14; }
        else if(type == 'WEIGHT'){ return 9000; }
    }else if(value == '20 FOOTER'){
        if(type == 'VOLUME'){ return 28; }
        else if(type == 'WEIGHT'){ return 18000; }
    }else if(value == '40 STD FOOTER'){
        if(type == 'VOLUME'){ return 56; }
        else if(type == 'WEIGHT'){ return 20000; }
    }else if(value == '40 HC FOOTER'){
        if(type == 'VOLUME'){ return 78; }
        else if(type == 'WEIGHT'){ return 22000; }
    }
}

function initValidationScript(pageType){
    var conVol, conWt,
        checkBox = $('.mainTable tbody td input[type="checkbox"]'),
        child4 = $('.mainTable tbody tr td:nth-child(4)'),
        child5 = $('.mainTable tbody tr td:nth-child(5)'),
        weight = $('#result'),
        volume = $('#result-vol'),
        container = $('#containerType').val(),
        submitBtn = $('#submitBtn'),
        containedWt = $('.containerItems tbody tr td:nth-child(3)'),
        containedVol = $('.containerItems tbody tr td:nth-child(4)'),
        volContainer,
        wtContainer;

    // this automatically measures the dimension of the table
    // and appends id(for the 4th and 5th td) and value(for the checkbox)
    for(var i = 0; i < $('.mainTable tbody tr').size(); i++){
        child4.eq(i).attr('id', 'val'+(i+1));
        child5.eq(i).attr('id', 'val'+(i+1)+'-vol');
        checkBox.eq(i).attr('class', 'val'+(i+1));
        if(checkBox.eq(i).is(':checked')){
            conWt = parseFloat(weight.text())+parseFloat(child4.eq(i).text());
            conVol = parseFloat(volume.text())+parseFloat(child5.eq(i).text());
            weight.empty().append(conWt);
            volume.empty().append(conVol);
        }
    }

    $('#maxVol').empty().append(getMaxValue('VOLUME', container));
    $('#maxWt').empty().append(getMaxValue('WEIGHT', container));

    if(pageType == 'CONSO_EDIT'){
        for(var x=0; x < $('.containerItems tbody tr').size(); x++){
            volContainer = parseFloat(containedVol.eq(x).text())+parseFloat(volume.text());
            wtContainer = parseFloat(containedWt.eq(x).text())+parseFloat(weight.text());
            weight.empty().append(wtContainer);
            volume.empty().append(volContainer);
        }
    }

    // This function listens for change of the checkboxes within the tbody of the mainTable class
    checkBox.change(function(){
        var wt, vol,
            maxWt = parseFloat($('#maxWt').text()),
            maxVol = parseFloat($('#maxVol').text()),
            checkBoxWt = $('#'+this.className),
            checkBoxVol = $('#'+this.className+'-vol');
        if($.isNumeric(checkBoxWt.text()) && $.isNumeric(checkBoxVol.text())){
            if(this.checked){
                wt = parseFloat(weight.text())+parseFloat(checkBoxWt.text());
                vol = parseFloat(volume.text())+parseFloat(checkBoxVol.text());
            }else{
                wt = parseFloat(weight.text())-parseFloat(checkBoxWt.text());
                vol = parseFloat(volume.text())-parseFloat(checkBoxVol.text());
            }
        }

        if(pageType == 'CONSO_EDIT'){
            if(wt == wtContainer || vol == volContainer || wt > maxWt || vol > maxVol){
                submitBtn.prop('disabled',true);
            }else{
                submitBtn.prop('disabled',false);
            }
        }else{
            if(wt > maxWt || vol > maxVol){
                submitBtn.prop('disabled',true);
                $('#finalBtn').addClass('disabled');
            }else{
                submitBtn.prop('disabled',false);
                $('#finalBtn').removeClass('disabled');
            }
        }

        if(wt > maxWt){ wt = '<font color="red">'+wt+'</font>'; }
        if(vol > maxVol){ vol = '<font color="red">'+vol+'</font>'; }

        if(wt == 0 || vol == 0){
            submitBtn.prop('disabled',true);
            $('#finalBtn').addClass('disabled');
        }

        weight.empty().append(wt);
        volume.empty().append(vol);
    });
}

function resetBox(pageType){
    $('.mainTable tbody td input[type="checkbox"]').removeAttr('checked');
    if(pageType == 'CONSO_EDIT'){
        var volContainer = 0, wtContainer = 0;
        for(var x=0; x < $('.containerItems tbody tr').size(); x++){
            volContainer = parseFloat($('.containerItems tbody tr td:nth-child(4)').eq(x).text())+volContainer;
            wtContainer = parseFloat($('.containerItems tbody tr td:nth-child(3)').eq(x).text())+wtContainer;
        }
        $('#result').empty().append(wtContainer);
        $('#result-vol').empty().append(volContainer);
        $('#submitBtn').prop('disabled', true);
    }else{
        $('#result').empty().append(0);
        $('#result-vol').empty().append(0);
    }
}

function tablePropClass(tableClass, tableName, colStatus, colType, colReq, colMode, colOrigin, colDestination){
    var tableTr = $('.'+tableName+' tbody tr');
    for(var i = 0; i < tableTr.size(); i++){
        var statusColumn = $('.'+tableName+' tbody tr td:nth-child('+colStatus+')').eq(i).text(), typeColumn = $('.'+tableName+' tbody tr td:nth-child('+colType+')').eq(i),
            reqColumn = $('.'+tableName+' tbody tr td:nth-child('+colReq+')').eq(i),
            modeColumn = $('.'+tableName+' tbody tr td:nth-child('+colMode+')').eq(i),
            icon = changeIcons(typeColumn.text()),
            req = reqAbbrev(reqColumn.text()),
            mode = modeAbbrev(modeColumn.text());
        if(tableClass == 'DESTI_ORIG'){
            var desColumn = $('.'+tableName+' tbody tr td:nth-child('+colDestination+')').eq(i),
                origColumn = $('.'+tableName+' tbody tr td:nth-child('+colOrigin+')').eq(i),
                des = placeAbbrev(desColumn.text()),
                ori = placeAbbrev(origColumn.text());

            desColumn.empty().append(des);
            origColumn.empty().append(ori);
        }

        tableTr.eq(i).css('background-color', trColor(statusColumn));
        typeColumn.empty().append(icon);
        reqColumn.empty().append(req);
        modeColumn.empty().append(mode);
    }
}

function tableProp(tableClass, tableName, colStatus, colType, colReq, colMode, colOrigin, colDestination, colDate){
    var tableTr = $('#'+tableName+' tbody tr');
    for(var i = 0; i < tableTr.size(); i++){
        var statusColumn = $('#'+tableName+' tbody tr td:nth-child('+colStatus+')').eq(i).text(),
            typeColumn = $('#'+tableName+' tbody tr td:nth-child('+colType+')').eq(i),
            reqColumn = $('#'+tableName+' tbody tr td:nth-child('+colReq+')').eq(i),
            modeColumn = $('#'+tableName+' tbody tr td:nth-child('+colMode+')').eq(i),
            dateColumn = $('#'+tableName+' tbody tr td:nth-child('+colDate+')').eq(i),
            icon = changeIcons(typeColumn.text()),
            req = reqAbbrev(reqColumn.text()),
            mode = modeAbbrev(modeColumn.text()),
            dateTrans = dateAbbrev(dateColumn.text());

        if(tableClass == 'DESTI_ORIG'){
            var desColumn = $('#'+tableName+' tbody tr td:nth-child('+colDestination+')').eq(i),
                origColumn = $('#'+tableName+' tbody tr td:nth-child('+colOrigin+')').eq(i),
                des = placeAbbrev(desColumn.text()),
                ori = placeAbbrev(origColumn.text());

            desColumn.empty().append(des);
            origColumn.empty().append(ori);
        }

        tableTr.eq(i).css('background-color', trColor(statusColumn));
        typeColumn.empty().append(icon);
        reqColumn.empty().append(req);
        modeColumn.empty().append(mode);
        dateColumn.empty().append(dateTrans);
    }
}

function placeAbbrev(place){
    if(place == 'MANILA'){
        return 'MNL';
    }else if(place == 'BACOLOD'){
        return 'BAC';
    }else if(place == 'BUTUAN'){
        return 'BXU';
    }else if(place == 'CAGAYAN'){
        return 'CGY';
    }else if(place == 'COTABATO'){
        return 'CBO';
    }else if(place == 'DAVAO'){
        return 'DVO';
    }else if(place == 'DUMAGUETE'){
        return 'DGT';
    }else if(place == 'DIPOLOG'){
        return 'DPG';
    }else if(place == 'GEN. SANTOS'){
        return 'GES';
    }else if(place == 'ILIGAN'){
        return 'ILI';
    }else if(place == 'ILOILO'){
        return 'ILO';
    }else if(place == 'OZAMIS'){
        return 'OZA';
    }else if(place == 'GEN. SANTOS'){
        return 'GES';
    }else if(place == 'PALAWAN'){
        return 'PPS';
    }else if(place == 'ROXAS'){
        return 'RXS';
    }else if(place == 'TAGBILARAN'){
        return 'TAG';
    }else if(place == 'TACLOBAN'){
        return 'TAC';
    }else if(place == 'ZAMBOANGA'){
        return 'ZAM';
    }else if(place == 'CEBU'){
        return 'CEB'
    }else{
        return place;
    }
}

function trColor(status){
    if( status == 'INCOMPLETE'){
        return '#f2a5aa';
    }else if(status == 'DISAPPROVED' || status == 'CANCELLED'){
        return '#f2dede';
    }else if(status == 'APPROVED' || status == 'SERVICE ACCOMPLISHED'){
        return '#dff0d8';
    }else if(status == 'ON GOING'){
        return '#bce8f1';
    }else if(status == 'PENDING'){
        return '#f0ad4e';
    }
}

function changeIcons(type){
    if(type == 'SHIPPING AND TRUCKING'){
        return "<i class='fa fa-anchor' /> <i class='fa fa-truck' />";
    }else if(type == 'SHIPPING'){
        return "<i class='fa fa-anchor' />";
    }else if(type == 'TRUCKING'){
        return "<i class='fa fa-truck' />";
    }else{
        return type;
    }
}

function reqAbbrev(req){
    if(req == 'FULL CARGO LOAD' || req == 'FULL CONTAINER LOAD'){
        return 'FCL';
    }else if(req == 'FULL TRUCK LOAD'){
        return 'FTL';
    }else if(req == 'LESS TRUCK LOAD'){
        return 'LTL';
    }else if(req == 'LESS CARGO LOAD' || req == 'LESS CONTAINER LOAD'){
        return 'LCL';
    }else if(req == 'LOOSE CARGO LOAD'){
        return 'LCU';
    }else if(req == 'ROLLING CARGO LOAD'){
        return 'RCU';
    }else{
        return req;
    }
}

function modeAbbrev(mode){
    if(mode == 'DOOR TO DOOR'){
        return 'DD';
    }else if(mode == 'DOOR TO PIER' || mode == 'DOOR TO PORT'){
        return 'DP';
    }else if(mode == 'PIER TO DOOR' || mode == 'PORT TO DOOR'){
        return 'PD';
    }else if(mode == 'PIER TO PIER' || mode == 'PORT TO PORT'){
        return 'PP';
    }else if(mode == 'PICKUP'){
        return 'P';
    }else if(mode == 'DELIVERY'){
        return 'D';
    }else if(mode == 'INTER-WAREHOUSE'){
        return 'IW';
    }else{
        return mode;
    }
}

function dateAbbrev(date){
    var splitDate = date.split('-'),
        month;

    if(splitDate[1] == '01'){
        month = 'JAN';
    }else if(splitDate[1] == '02'){
        month = 'FEB';
    }else if(splitDate[1] == '03'){
        month = 'MAR';
    }else if(splitDate[1] == '04'){
        month = 'APR';
    }else if(splitDate[1] == '05'){
        month = 'MAY';
    }else if(splitDate[1] == '06'){
        month = 'JUN';
    }else if(splitDate[1] == '07'){
        month = 'JUL';
    }else if(splitDate[1] == '08'){
        month = 'AUG';
    }else if(splitDate[1] == '09'){
        month = 'SEP';
    }else if(splitDate[1] == '10'){
        month = 'OCT';
    }else if(splitDate[1] == '11'){
        month = 'NOV';
    }else if(splitDate[1] == '12'){
        month = 'DEC';
    }else{
        month = splitDate[1];
    }

    return splitDate[0].substr(2,4)+'-'+month+'-'+splitDate[2];
}

function initTimestampAbbrev(tableClass, dateColumn){
    var table = $('.'+tableClass+' tbody tr td:nth-child('+dateColumn+')');

    for(var i = 0; i < table.size(); i++){
            var splitDate = table.eq(i).text().split(' ');
        if(splitDate[0] != ''){
            table.eq(i).empty().append(dateAbbrev(splitDate[0])+' '+splitDate[1].substr(0,8));
        }
    }
}

function dateAbbrev_Format2(table, column){
    var tableSelect = $('#'+table+' tbody tr');
    for(var i = 0; i < tableSelect.size(); i++){
        var dateColumn = $('#'+table+' tbody tr td:nth-child('+column+')').eq(i),
            splitDate = dateColumn.text().split('-'),
            month;

        if(splitDate[0] == '01'){
            month = 'JAN';
        }else if(splitDate[0] == '02'){
            month = 'FEB';
        }else if(splitDate[0] == '03'){
            month = 'MAR';
        }else if(splitDate[0] == '04'){
            month = 'APR';
        }else if(splitDate[0] == '05'){
            month = 'MAY';
        }else if(splitDate[0] == '06'){
            month = 'JUN';
        }else if(splitDate[0] == '07'){
            month = 'JUL';
        }else if(splitDate[0] == '08'){
            month = 'AUG';
        }else if(splitDate[0] == '09'){
            month = 'SEP';
        }else if(splitDate[0] == '10'){
            month = 'OCT';
        }else if(splitDate[0] == '11'){
            month = 'NOV';
        }else if(splitDate[0] == '12'){
            month = 'DEC';
        }else{
            month = splitDate[0];
        }

        dateColumn.empty().append(splitDate[1]+'-'+month+'-'+splitDate[2].substr(2,4));
    }
}

// AUTHORED BY JAN SARMIENTO -- START
// This function modifies the \n character in the table and replaces it with a <br/> tag
// THIS FUNCTIONS CONCERNS ONLY THE FRONT-END
function newlineHandler(tableName, commentColumn){
    var tableComment = $('.'+tableName+' tbody tr td:nth-child('+commentColumn+')'),
        transformedString;

    for(var i=0; i < tableComment.size(); i++){
        transformedString = tableComment.eq(i).text().replace(/\n/g, "<br />");
        tableComment.eq(i).empty().append(transformedString);
    }
}
// AUTHORED BY JAN SARMIENTO -- END

function computeAll(tableClass, wellTotalWeight, wellTotalVolume, operation){
    var lclCheckBox = $('.'+tableClass+' tbody tr td input[type="checkbox"]'),
        finalWt = 0, finalVol = 0;
    if(operation == 'ADD'){
        for(var i=0; i<lclCheckBox.size(); i++){
            var tableWt = parseFloat(lclCheckBox.eq(i).closest('tr').find('td').eq(8).text()),
                tableVol = parseFloat(lclCheckBox.eq(i).closest('tr').find('td').eq(9).text());
            finalWt = finalWt + tableWt;
            finalVol = finalVol + tableVol;
        }
        $('#'+wellTotalWeight).empty().append(finalWt);
        $('#'+wellTotalVolume).empty().append(finalVol);
        triggerComputation(finalWt, finalVol);
    }
    else if(operation == 'SUBTRACT'){
        $('#'+wellTotalVolume).empty().append('0');
        $('#'+wellTotalWeight).empty().append('0');
        $('#recommendedContent').empty().append('Choose item(s) first');
    }
//    seaFreightLclComputation('lclTable', 'wellTotalWeight', 'wellTotalVolume');
}

function triggerComputation(weight, volume){
    startRecommendation('mainReco', 'recommendedContent', weight, volume);
}

function seaFreightLclComputation(tableClass, wellTotalWeight, wellTotalVolume){
    var lclCheckBox = $('.'+tableClass+' tbody tr td input[type="checkbox"]');

    lclCheckBox.change(function(){
        var weight = parseFloat($(this).closest('tr').find('td').eq(8).text()),
            volume = parseFloat($(this).closest('tr').find('td').eq(9).text()),
            wellContentWt = $('#'+wellTotalWeight),
            wellContentVol = $('#'+wellTotalVolume);

        if($(this).is(':checked')){
            weight = parseFloat(wellContentWt.text()) + weight;
            volume = parseFloat(wellContentVol.text()) + volume;

            wellContentWt.empty().append(weight);
            wellContentVol.empty().append(volume);
        }else{
            weight = parseFloat(wellContentWt.text()) - weight;
            volume = parseFloat(wellContentVol.text()) - volume;

            wellContentWt.empty().append(weight);
            wellContentVol.empty().append(volume);
        }
        startRecommendation('mainReco', 'recommendedContent', weight, volume);
    })
}

function startRecommendation(slideDiv, appendDiv, weight, volume){
    if(weight == 0 || volume == 0){
        $('#'+appendDiv).empty().append('Choose item(s) first');
//        $('#'+slideDiv).slideToggle();
    }else{
        var recommendation;
        recommendation = firstRecommendation(weight, volume);
        $('#'+appendDiv).empty().append(recommendation);
//        $('#'+slideDiv).slideToggle();
    }
}

function firstRecommendation(weight, volume){
    var recWt = weight, recVol = volume,
        hc40 = 0, std40 = 0, foot20 = 0, foot10 = 0, recommendation = "NONE";
    while(1){
        if(recVol <= 0){
            break;
        }else if(recVol > 53.2 || recWt > 15320){
            recWt = recWt - 16890;
            recVol = recVol - 74.1;
            hc40++;
        }else if(recVol > 26.6 || recWt > 14870){
            recWt = recWt - 15320;
            recVol = recVol - 53.2;
            std40++;
        }else if(recVol > 13.3 || recWt > 7250){
            recWt = recWt - 14870;
            recVol = recVol - 26.6;
            foot20++;
        }else if(recVol > 0 || recWt > 0){
            recWt = recWt - 7250;
            recVol = recVol - 13.3;
            foot10++;
        }
    }

    if(hc40 != 0){
        recommendation = '<p>'+hc40+' - 40 FOOTER HC CONTAINERS</p>';
    }

    if(std40 != 0){
        if(recommendation == 'NONE'){
            recommendation = '<p>'+std40+' - 40 FOOTER STD CONTAINERS</p>';
        }else {
            recommendation = recommendation + '<p>'+std40+' - 40 FOOTER STD CONTAINERS</p>';
        }
    }

    if(foot20 != 0){
        if(recommendation == 'NONE'){
            recommendation = '<p>'+foot20+' - 20 FOOTER CONTAINERS</p>';
        }else {
            recommendation = recommendation + '<p>'+foot20+' - 20 FOOTER CONTAINERS</p>';
        }
    }

    if(foot10 != 0){
        if(recommendation == 'NONE'){
            recommendation = '<p>'+foot10+' - 10 FOOTER CONTAINERS</p>';
        }else {
            recommendation = recommendation + '<p>'+foot10+' - 10 FOOTER CONTAINERS</p>';
        }
    }

    return recommendation;
}

// THIS FUNCTION IS FOR CHECK ALL THIS REQUIRES THE ID OF THE MASTER CHECKBOX AND TABLE CLASS
function massCheckbox(boxName, tableName){
    $('#'+boxName).click(function(){
        var allCheckbox = $('.'+tableName+' tbody tr td input[type="checkbox"]');
        if(allCheckbox.is(':checked')){
            allCheckbox.prop('checked', false);
        }else{
            allCheckbox.prop('checked', true);
        }
    })
}

// THIS FUNCTION IS FOR FORM VALIDATION THIS REQURES THE CLASS OF INPUTS AND CLASS OF SUBMIT BUTTON
function validationForm(inputClass, submitBtn, module){

    var classInput = $('.'+inputClass+':enabled'),
        submitBtn = $('.'+submitBtn);
    classInput.change(function(){
        initValidation();
    });

    classInput.keyup(function(){
        initValidation();
    });

    classInput.click(function(){
        initValidation();
    });

    classInput.hover(function(){
        initValidation();
    })

    if(module == 'BOOKING'){
        $('.notifBox').click(function(){
            initValidation();
        })
    }

    function initValidation(){
//        console.clear();
        var formInput = $('.'+inputClass+':enabled');
        var bool = 0;

        for(var i = 0; i < formInput.size(); i++){
            if(formInput.eq(i).val() != '' && formInput.eq(i).val() != undefined){
                bool++;
//                console.log('- '+formInput.eq(i).val())
            }
        }
//        console.log(bool+' out of '+formInput.size());

        if(module == 'BOOKING'){
            if(bool == formInput.size() && notifBox_booking('notifBox')){
                submitBtn.prop('disabled', false);
            }else{
                submitBtn.prop('disabled', true);
            }
        }else{
            if(bool == formInput.size()){
                submitBtn.prop('disabled', false);
            }else{
                submitBtn.prop('disabled', true);
            }
        }
    }
}

function postAjaxHtml(url, successDiv, idParam, columnParam){
    $.ajax({
        url: url,
        type: 'POST',
        dataType: 'html',
        success: function (html) {
            $('#'+successDiv).html(html);
        },
        error: function(xhr, ajaxOptions, thrownError){
            alert('An error occurred! ' + thrownError);
        }
    });
}

function showGateOutFields(containerId) {
    $.ajax({
        url: 'loadCheckoutFormPage',
        type: 'POST',
        data: { containerIdParam: containerId },
        dataType: 'html',
        success: function (html) {
            $('#inputDiv').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError){
            alert('An error occurred! ' + thrownError);
        }
    });

}

// restrict a textfield for numbers only
function restrictField_Numbers(fieldClass){
    $('.'+fieldClass).keypress(function(e) {
        var a = [];
        var k = e.which;

        for (i = 48; i < 58; i++)
            a.push(i);

        if (!(a.indexOf(k)>=0))
            e.preventDefault();
    })
}

function notifBox_booking(boxClass){
    var bool = false;
    for(var i=0; i < $('.'+boxClass).size(); i++){
        if($('.'+boxClass).eq(i).is(':checked')){
            bool = true;
        }
    }

    return bool;
//    console.log($('.'+boxClass).size());
}

function validateSearchModal(button, textfield, dropdown){
    $('.'+textfield).keyup(function(){initValidate();})
    $('.'+dropdown).change(function(){initValidate();})

    function initValidate(){
        console.clear();
        if($('.'+textfield).val() != '' && $('.'+dropdown).val() != ''){
            $('.'+button).prop('disabled', false);
            console.log('ENABLE BUTTON');
        }else{
            $('.'+button).prop('disabled', true);
            console.log('DISABLE BUTTON');
        }
    }
}

function changeDateValue(dateSelector, mode){
    var newDate = new Date(dateSelector.val());

    if(mode == 'DECREMENT'){
        newDate.setDate(newDate.getDate()-1);
    }else{
        newDate.setDate(newDate.getDate()+1);
    }
    newDate = (newDate.getMonth()+1) +'-'+ newDate.getDate()+'-'+newDate.getUTCFullYear();
//    dateSelector.empty().val(newDate);
    return newDate;
}

function hideVesselSchedule(){
    var vesselTable = $('#vesselSchedule tbody tr td:nth-child(6)'),
        arrivalDate = $('#vesselSchedule tbody tr td:nth-child(7)'),
        schedClass = $('#vesselSchedule tbody tr td:nth-child(8)'),
        bookingClass = $('#bookingClass'),
        splitDate,
        currentDate = new Date(),
        pickupDate = changeDateValue($('.pickupDate'), 'INCREMENT'),
        deliveryDate = changeDateValue($('.deliveryDate'), 'DECREMENT');

    for(var i=0; i < vesselTable.size(); i++){
        splitDate = vesselTable.eq(i).text().split('-');

        if(currentDate.getUTCFullYear() > splitDate[2]){
            vesselTable.eq(i).closest('tr').remove();
        }else{
            if((currentDate.getMonth()+1) > splitDate[1]){
                vesselTable.eq(i).closest('tr').remove();
            }else{
                if(currentDate.getDate() < splitDate[0]){
                    vesselTable.eq(i).closest('tr').remove();
                }
            }
        }

        if(new Date(pickupDate) > new Date(vesselTable.eq(i).text()) || new Date(deliveryDate) < new Date(arrivalDate.eq(i).text())){
            vesselTable.eq(i).closest('tr').remove();
        }

        if(bookingClass.val() == 'REGULAR'){
            if(schedClass.eq(i).text() == 'PREMIUM'){
                schedClass.eq(i).closest('tr').remove();
            }
        }else if(bookingClass.val() == 'ECONOMY'){
            if(schedClass.eq(i).text() != 'ECONOMY'){
                schedClass.eq(i).closest('tr').remove();
            }
        }
    }

    setTimeout(function(){
        if($('#vesselSchedule tbody tr').size() == 0){
            $('.loadingDiv').empty().append('No schedule found.');
        }else{
            if($('#vesselSchedule tbody tr').size() > 10){
                $('#vesselSchedule').oneSimpleTablePagination({rowsPerPage: 10});
            }
            $('.loadingDiv').hide();
            $('.tableDiv').fadeIn();
        }
    }, 1000);
}

function addTotalRate(){
    // Addition of rate (php) and conversion to currency format
    var itemList = $('.itemListing tbody tr td:nth-child(7)'),
        totalPhp = 0;

    for(var i=0; i < itemList.size(); i++){
        if($.isNumeric(parseFloat(itemList.eq(i).text()))){
            totalPhp += parseFloat(itemList.eq(i).text());
        }else{
            itemList.eq(i).empty().append('<font color="red">0.00</font>');
        }
    }
    $('#totalRate').empty().append(totalPhp.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,'));
}

function dateValidationInit(){
    $('.finalSaveBtn').click(function(){
        var pickupdate = new Date($('.pickupDate').val()),
            departureDate = new Date($('.departureDate').val()),
            finalPickupDate = new Date($('.finalPickupDate').val()),
            finalSaveBtn = $('.finalSaveBtn'),
            formToSubmit = $('.originForm');

//        alert($('.serviceModeField').val());
//        alert(pickupdate);
//        if($('.serviceModeField').val() == 'DELIVERY'){
//
//        }else if($('.serviceModeField').val() == 'PICKUP'){
//
//        }

        if(departureDate != 'Invalid Date' && pickupdate != 'Invalid Date'){
            if(finalPickupDate.setHours(0,0,0,0) >= pickupdate.setHours(0,0,0,0) && finalPickupDate.setHours(0,0,0,0) <= departureDate.setHours(0,0,0,0)){
                formToSubmit.submit();
            }else{
                pickupdate = pickupdate.getUTCFullYear()+'-'+(pickupdate.getMonth()+1)+'-'+pickupdate.getDate();
                departureDate = departureDate.getUTCFullYear()+'-'+(departureDate.getMonth()+1)+'-'+departureDate.getDate();
                var message = 'Date must be between <font color="red">'+pickupdate+'</font> and <font color="red">'+departureDate+'</font>';
                $('#dateWarningModalBody').empty().append(message);
                $('#dateWarningModal').modal('show');
            }
        }else{
            if(pickupdate != 'Invalid Date'){
                if(finalPickupDate.setHours(0,0,0,0) >= pickupdate.setHours(0,0,0,0)){
                    formToSubmit.submit();
                }else{
                    pickupdate = pickupdate.getUTCFullYear()+'-'+(pickupdate.getMonth()+1)+'-'+pickupdate.getDate();
                    var message = 'Date must be no later than <font color="red">'+pickupdate+'</font>';
                    $('#dateWarningModalBody').empty().append(message);
                    $('#dateWarningModal').modal('show');
                }
            }else{
                if(finalPickupDate.setHours(0,0,0,0) >= departureDate.setHours(0,0,0,0)){
                    formToSubmit.submit();
                }else{
                    departureDate = departureDate.getUTCFullYear()+'-'+(departureDate.getMonth()+1)+'-'+departureDate.getDate();
                    var message = 'Date must be no later than <font color="red">'+departureDate+'</font>';
                    $('#dateWarningModalBody').empty().append(message);
                    $('#dateWarningModal').modal('show');
                }
            }
        }
    })
}

//function preventDuplicatePort(select, index) {
//    var options = select.options,
//        len = options.length;
//
//    select.options[ index ].disabled = true;
//
//    if (index === select.selectedIndex) {
//        alert('You already selected the same port "' + select.options[index].text + '". Please choose another');
//        this.selectedIndex = 0;
//        select2.value = '';
//    }
//}

function vesselScheduleColor(tableClass, departureColumn){
    var tableDepartureColumn = $('#'+tableClass+' tbody tr td:nth-child('+departureColumn+')');
    for(var i = 0; i < tableDepartureColumn.size(); i++){
        var departDate = new Date(tableDepartureColumn.eq(i).text()),
            currentDate = new Date();
        if(departDate < currentDate){ tableDepartureColumn.eq(i).closest('tr').css('background-color', '#f2a5aa');
        }else{ tableDepartureColumn.eq(i).closest('tr').css('background-color', '#dff0d8'); }
    }
}

function documentsCheckbox(){
    $('.documentsCheckbox').click(function(){
        if($(this).parent().siblings().eq(1).text() == undefined || $(this).parent().siblings().eq(1).text() == '' || $(this).parent().siblings().eq(1).text() == null){
//            alert('Please input SERIES NUMBER first before proceeding document');
            $('#warningModalContent').empty().append('Please input SERIES NUMBER first before proceeding document');
            $('#warningModal').modal().show();
        }else{
            window.location = $(this).prev().attr('href');
        }
    });
}