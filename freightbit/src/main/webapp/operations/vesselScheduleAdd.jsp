<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<!-- END OF THE MIDDLE -->

<div class="row" style="margin-top:-15px;">
    <div class="col-lg-12">
        <h1>Add Vessel Schedule</h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Vessel Schedule List</li>
            <li class="active"><i class="fa fa-plus"></i> Add Vessel Schedule</li>
        </ol>

    </div>
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-7 col-lg-offset-2" style="margin-left: 21% !important;">
        <div class="panel panel-primary">

            <div class="panel-heading">
				<span class="panel-title">Vessel Schedule</span>
            </div>

            <div class="panel-body">
             

                    <s:form cssClass="form-horizontal" theme="bootstrap" action="addVesselSchedule">

                        <div class="form-group">

                            <label for="vesselSchedule.voyageNumber" class="col-sm-2 control-label">Voyage Number:</label>

                            <div class="col-sm-10">
                                <s:textfield cssClass="form-control" name="vesselSchedule.voyageNumber" />
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="vesselSchedule.vendorId" class="col-sm-2 control-label"> Vendor:</label>

                            <div class="col-sm-10">
                                <s:select emptyOption="true" id="vesselSchedule.vendorId"
                                          value="vvesselSchedule.vendorId"
                                          name="vesselSchedule.vendorId"
                                          list="vendorList" listValue="vendorName" listKey="vendorId"
                                          cssClass="form-control"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="vesselSchedule.departureDate" class="col-sm-2 control-label"> Date of Departure:</label>

                            <div class="col-sm-10">
                                <s:textfield cssClass="form-control" id="departureDate" name="vesselSchedule.departureDate" />
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="vesselSchedule.departureTime" class="col-sm-2 control-label"> Time of Departure:</label>

                            <div class="col-sm-10">
                                <s:textfield cssClass="form-control" id="departureTime" name="vesselSchedule.departureTime" />
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="vesselSchedule.arrivalDate" class="col-sm-2 control-label">Date of Arrival:</label>

                            <div class="col-sm-10">
                                <s:textfield cssClass="form-control" id="arrivalDate" name="vesselSchedule.arrivalDate" />
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="vesselSchedule.arrivalTime" class="col-sm-2 control-label"> Time of Arrival:</label>

                            <div class="col-sm-10">
                                <s:textfield cssClass="form-control" id="arrivalTime" name="vesselSchedule.arrivalTime" />
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="vesselSchedule.originPort" class="col-sm-2 control-label">Pier Origin:</label>

                            <div class="col-sm-10">
                                <s:select emptyOption="true" id="vesselSchedule.originPort"
                                          value="vesselSchedule.originPort"
                                          name="vesselSchedule.originPort"
                                          list="portsList" listValue="value" listKey="key"
                                          cssClass="form-control"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="vesselSchedule.destinationPort" class="col-sm-2 control-label">Pier Destination:</label>

                            <div class="col-sm-10">
                                <s:select emptyOption="true" id="vesselSchedule.destinationPort"
                                          value="vesselSchedule.destinationPort"
                                          name="vesselSchedule.destinationPort"
                                          list="portsList" listValue="value" listKey="key"
                                          cssClass="form-control"/>
                            </div>

                        </div>


                    <div style="float: right;">
                        <s:submit cssClass="btn btn-default btn-info pull-right" name="submit" value="Save"/>
                        <button class="btn btn-default" onclick="location.href='vessel-schedule-list.html'">
                            Cancel
                        </button>
                    </div>

                    </s:form>

               
            </div>
            
            
        </div>

    </div>
</div><!-- /.row -->

<script type="text/javascript">

    var departureDate = $('#departureDate');
    var arrivalDate = $('#arrivalDate');

    //pick up date validation
    departureDate.datepicker({

        // on 5:00pm
        dateFormat: 'yy-dd-mm',
//        timeFormat: 'HH:mm',
        onClose: function(dateText, inst) {
//
            if (arrivalDate.val() != '') {
                var testStartDate = departureDate.datepicker('getDate');
                var testEndDate = departureDate.datepicker('getDate');

                if (testStartDate > testEndDate)
                    arrivalDate.datepicker('setDate', testStartDate);

            }

            else {
                arrivalDate.val(dateText);
            }
        },

        onSelect: function (selectedDateTime){
            arrivalDate.datepicker('option', 'minDate', departureDate.datepicker('getDate') );
        }

    }

    );

    // delivery date validation -jp
    arrivalDate.datepicker( {

        // on 6:00pm
        dateFormat: 'yy-dd-mm',
//        timeFormat: 'HH:mm',
        onClose: function(dateText, inst) {

            if (departureDate.val() != '') {
                var testStartDate = departureDate.datepicker('getDate');
                var testEndDate = arrivalDate.datepicker('getDate');

                if (testStartDate > testEndDate)
                    departureDate.datepicker('setDate', testEndDate);

            }

            else {
                departureDate.val(dateText);
            }
        },

        onSelect: function (selectedDateTime){
            departureDate.datepicker('option', 'maxDate', arrivalDate.datepicker('getDate') );
        }



    });

    $('#arrivalTime').timepicker( {
        timeFormat: 'HH:mm:ss'
    });

    $('#departureTime').timepicker( {
        timeFormat: 'HH:mm:ss'
    });

    $('#activate-step-3').on('click', function(e) {
        $('ul.setup-panel li:eq(2)').removeClass('disabled');
        $('.step2').attr('disabled', 'disabled');
        $('ul.setup-panel li a[href="#step-3"]').trigger('click');
        $(this).remove();
    })

    $('#activate-step-3').click(function(){

        var selectedItem = $("select[name='order.customerId'] option:selected").val();

        $.ajax({
            url: 'load3rdPage', // action to be perform
            type: 'POST',       //type of posting the data
            //data: { name: "Jeetu", age: "24" }, // data to set to Action Class
            data:{ ID: selectedItem },
            dataType: 'html',

            success: function (html) {
                /*alert(selectedItem);
                 alert(html);*/
                $('#3rdPart').html(html); //set result.jsp output to leftDiv
            },
            error: function(xhr, ajaxOptions, thrownError){
                alert('An error occurred! ' + thrownError);
            }
        });
    });


</script>