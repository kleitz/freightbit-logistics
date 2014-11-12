<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<style>
    .pagebanner, .pagelinks {
        display: none;
    }

</style>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-file-text"></i> Documents Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />">  Dashboard </a></li>
            <li class="active"><a href="<s:url action='../documentation/viewPendingDocuments' />"> Pending Documents List</a></li>
            <li class="active"> Pending Documents of Booking Number <s:property value="bookingNumber"/></li> <%--placeholder--%>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-file-text"></i> Document Stages</h3>
            </div>

            <div class="panel-body">

                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <i class="fa fa-book"></i>
                        <span class="panel-title">Booking Information</span>
                    </div>
                    <div class="panel-body form-horizontal">
                        <div class="form-group">
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Booking Number</label>
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" value="%{order.orderNumber}" name="book-num" disabled="true"></s:textfield>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Freight Type</label>
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" value="%{order.freightType}" name="book-num" disabled="true"></s:textfield>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Service Requirement</label>
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" value="%{order.serviceRequirement}" name="book-num" disabled="true"></s:textfield>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Service Mode</label>
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" value="%{order.modeOfService}" name="book-num" disabled="true"></s:textfield>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Customer Name</label>
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" value="%{order.customerName}" name="book-num" disabled="true"></s:textfield>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Consignee Name</label>
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" value="%{order.consigneeCode}" name="book-num" disabled="true"></s:textfield>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="well">

                    <div class="container">

                        <div class="row bs-wizard" style="border-bottom:0;">

                            <div class="col-xs-2 bs-wizard-step active" id="first">
                                <div class="text-center bs-wizard-stepnum">OUTBOUND</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#outbound" class="bs-wizard-dot" data-toggle="tab" onclick="OutboundProgress()"></a>
                                <%--<div class="bs-wizard-info text-center">Lorem ipsum dolor sit amet.</div>--%>
                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled" id="second"><!-- complete -->
                                <div class="text-center bs-wizard-stepnum">INBOUND</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#inbound" class="bs-wizard-dot" data-toggle="tab" onclick="InboundProgress()"></a>
                                <%--<div class="bs-wizard-info text-center">Nam mollis tristique erat vel tristique. Aliquam erat volutpat. Mauris et vestibulum nisi. Duis molestie nisl sed scelerisque vestibulum. Nam placerat tristique placerat</div>--%>
                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled" id="third"><!-- complete -->
                                <div class="text-center bs-wizard-stepnum">FINAL OUTBOUND</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#finalOutbound" class="bs-wizard-dot" data-toggle="tab" onclick="finalOutboundProgress()"></a>
                                <%--<div class="bs-wizard-info text-center">Integer semper dolor ac auctor rutrum. Duis porta ipsum vitae mi bibendum bibendum</div>--%>
                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled" id="fourth"><!-- active -->
                                <div class="text-center bs-wizard-stepnum">FINAL INBOUND</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#finalInbound" class="bs-wizard-dot" data-toggle="tab" onclick="finalInboundProgress()"></a>
                                <%--<div class="bs-wizard-info text-center"></div>--%>
                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled" id="fifth"><!-- active -->
                                <div class="text-center bs-wizard-stepnum">ARCHIVE</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#archive" class="bs-wizard-dot" data-toggle="tab" onclick="archiveProgress()"></a>
                                <%--<div class="bs-wizard-info text-center"></div>--%>
                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled" id="sixth"><!-- active -->
                                <div class="text-center bs-wizard-stepnum">BILLING</div>
                                <div class="progress"><div class="progress-bar" data-toggle="tab" onclick="BillingProgress"></div></div>
                                <a href="#billing" class="bs-wizard-dot"></a>
                                <%--<div class="bs-wizard-info text-center"></div>--%>
                            </div>
                        </div>

                    </div>
                </div>

                <s:if test=" documentTabFinalInbound == 'NO_FINAL_INBOUND_DOCUMENTS' ">

                    <div class="well">

                        <div class="container">

                            <div class="form-group" style="margin-bottom: 0px !important;">
                                <s:form action="dateReceivedFinalInbound" theme="bootstrap">
                                    <s:textfield cssClass="form-control" id="order-Id" name="orderIdParam" type="hidden" />
                                    <label class="col-lg-3 control-label" >Date Received</label>
                                    <div class="col-lg-3">
                                        <s:textfield type="text" cssClass="form-control" id="datepicker" name="dateReturnedFinalInbound" required="true" placeholder="Select Returned date"></s:textfield>
                                    </div>
                                    <div class="col-lg-3 col-lg-offset-3">
                                        <s:submit name="submit" cssClass="btn btn-primary" value="Receive Final Inbound Documents" onclick="addOrderId()" />
                                    </div>
                                </s:form>
                            </div>

                        </div>

                    </div>

                </s:if>

                </div>

                <div id="inputDiv"> <%--Area where input fields will appear--%>
                </div>

                <%--Anchor on tab click--%>
                <s:textfield cssStyle="visibility: hidden;" value="%{documentTab}" id="documentTab" style="visibility:hidden;" />
                <s:textfield cssStyle="visibility: hidden;" value="%{documentTabInbound}" id="documentTabInbound"  />
                <s:textfield cssStyle="visibility: hidden;" value="%{documentTabFinalOutbound}" id="documentTabFinalOutbound"  />
                <s:textfield cssStyle="visibility: hidden;" value="%{documentTabFinalInbound}" id="documentTabFinalInbound"  />

                <s:if test="hasActionMessages()">
                    <div class="col-lg-12" id="successDiv">
                        <div id="alert" class="alert alert-success">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
                        </div>
                    </div>
                </s:if>

                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <%--Redirects to Outbound Stage--%>
                    <li id="out">
                        <s:url var="outboundStageUrl" action="viewOrderDocuments">
                            <s:param name="orderIdParam"
                                     value="#attr.order.orderId"></s:param>
                            <%--<s:param name="orderNoParam"
                                     value="#attr.order.orderNo"></s:param>--%>
                        </s:url>
                        <s:a class="icon-action-link" href="%{outboundStageUrl}">
                            Outbound
                        </s:a>
                    </li>
                    <%--Redirects to Inbound Stage--%>
                    <li id="in">
                        <s:url var="inboundStageUrl" action="viewOrderDocumentsInbound">
                            <s:param name="orderIdParam"
                                     value="#attr.order.orderId"></s:param>
                            <%--<s:param name="orderNoParam"
                                     value="#attr.order.orderNo"></s:param>--%>
                        </s:url>
                        <s:a class="icon-action-link" href="%{inboundStageUrl}">
                            Inbound
                        </s:a>
                    </li>
                    <%--Redirects to Final Outbound Stage--%>
                    <li id="fiOut">
                        <s:url var="finalOutboundStageUrl" action="viewOrderDocumentsFinalOutbound">
                            <s:param name="orderIdParam"
                                     value="#attr.order.orderId"></s:param>
                        </s:url>
                        <s:a class="icon-action-link" href="%{finalOutboundStageUrl}">
                            Final Outbound
                        </s:a>
                    </li>
                    <%--Redirects to Final Inbound Stage--%>
                    <li class="active" id="fiIn">
                        <s:url var="finalInboundStageUrl" action="viewOrderDocumentsFinalInbound">
                            <s:param name="orderIdParam"
                                     value="#attr.order.orderId"></s:param>
                        </s:url>
                        <s:a class="icon-action-link" href="%{finalInboundStageUrl}">
                            Final Inbound
                        </s:a>
                    </li>
                    <li id="arch"><a href="#archive" role="tab" data-toggle="tab">Archive</a></li>
                    <li id="bill"><a href="#billing" role="tab" data-toggle="tab">Billing</a></li>
                </ul>

                <div class="tab-content">

                    <%--FINAL SET INBOUND DOCUMENTS BEGIN--%>
                    <div class="tab-pane fade in active" id="finalInbound">

                        <div class="panel-body">

                            <div class="table-responsive">
                                <display:table id="document" name="finalInboundDocuments" requestURI="viewOrderDocuments.action" pagesize="10" class="table table-striped table-hover table-bordered text-center tablesorter"
                                               style="margin-top: 15px;">

                                    <td>
                                        <display:column title="" class="tb-font-black" style="text-align: center;" >
                                            <s:if test="#attr.document.documentProcessed == 0">
                                                <s:url var="checkDocumentFinalInboundUrl" action="checkDocumentFinalInbound">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{checkDocumentFinalInboundUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-square-o"></i>
                                                </s:a>
                                            </s:if>

                                            <s:else>
                                                <%--<s:url var="uncheckDocumentUrl" action="unCheckDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{uncheckDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-check-square-o"></i>
                                                </s:a>--%>
                                                <i class="fa fa-check-square-o"></i>
                                            </s:else>
                                            <%--<s:property value="%{#attr.document.documentProcessed}"/>--%>
                                            <input type="hidden" id="documentProcess" value="${document.documentProcessed}" name="documentNameParam"/>

                                        </display:column>
                                    </td>

                                    <td><display:column property="documentName" title="Document Name" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                    </td>

                                    <td><display:column property="documentStatus" title="Status" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                    </td>

                                    <td><display:column property="referenceNumber" title="Reference Number" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                    </td>

                                    <%--<td><display:column property="documentStatus" title="Status" class="tb-font-black"
                                                        style="text-align: center;" > </i></display:column></td>--%>

                                    <td>
                                        <%--<display:column title="Action" class="tb-font-black" style="text-align: center;" > </i>
                                            <a href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                <i class="fa fa-print"></i>
                                            </a>
                                            <input type="hidden" id="action_${document.documentId}" value="${document.documentId}" name="documentIdParam"/>
                                            <input type="hidden" id="action_${document.documentName}" value="${document.documentName}" name="documentNameParam"/>
                                        </display:column>--%>
                                        <display:column title="Action" class="tb-font-black" style="text-align: center;" >

                                            <input type="hidden" id="action_${document.documentId}" value="${document.documentId}" name="documentIdParam"/>
                                            <input type="hidden" id="action_${document.documentName}" value="${document.documentName}" name="documentNameParam"/>

                                            <%--Input Reference ID--%>
                                            <s:if test="#attr.document.documentName=='MASTER BILL OF LADING' || #attr.document.documentName=='SALES INVOICE / DELIVERY RECEIPT WITH SIGNATURE' || #attr.document.documentName=='MASTER WAYBILL DESTINATION' ">
                                                <%--<a data-toggle="modal" data-target="#addReferenceNumber" >
                                                    <i class="fa fa-edit"></i>
                                                </a>--%>
                                                <s:url var="addReferenceNumberFinalInboundUrl" action="addReferenceNumberFinalInbound">
                                                    <s:param name="orderIdParam" value="%{#attr.document.referenceId}"></s:param>
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a id="edit-icon" class="icon-action-link" href="%{addReferenceNumberFinalInboundUrl}" rel="tooltip" title ="Add Reference Number">
                                                    <i class="fa fa-edit"></i>
                                                </s:a>
                                            </s:if>
                                            <%--Print Document--%>
                                            <s:if test="#attr.document.documentName=='HOUSE BILL OF LADING' || #attr.document.documentName=='HOUSE RELEASE ORDER' || #attr.document.documentName=='HOUSE WAYBILL DESTINATION WITH SIGNATURE' ">
                                                <a id="print-icon" href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                    <i class="fa fa-print"></i>
                                                </a>
                                            </s:if>
                                            <%--Move Document--%>
                                            <s:url var="moveDocumentFinalOutboundUrl" action="moveDocumentFinalOutbound">
                                                <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                            </s:url>
                                            <s:a id="check-icon" class="icon-action-link" href="%{moveDocumentFinalOutboundUrl}" rel="tooltip" title ="moveDocumentFinalOutboundUrl ">
                                                <i class="fa fa-hand-o-right"></i>
                                            </s:a>

                                        </display:column>
                                    </td>

                                </display:table>
                            </div>
                        </div>

                    </div>

                </div>

            </div>

        </div>
    </div>
</div>

<s:textfield value="%{outboundCount}" id="outboundCount" hidden="hidden" />
<s:textfield value="%{inboundCount}" id="inboundCount" hidden="hidden" />
<s:textfield value="%{finalOutboundCount}" id="finalOutboundCount" hidden="hidden" />
<s:textfield value="%{finalInboundCount}" id="finalInboundCount" hidden="hidden" />

<script>

$(document).ready(function() {
    $( window ).load(function() {

        var outbound_count = $('#outboundCount').val();
        var inbound_count = $('#inboundCount').val();
        var final_outbound_count =$('#finalOutboundCount').val();
        var final_inbound_count =$('#finalInboundCount').val();

    });

    /*Anchor on message*/
    if ($('#successDiv').length !== 0){
        window.location.href = '#successDiv';
    }
    /*Anchor on final inbound tab click*/
    var final_inbound_tab = $("#documentTabFinalInbound").val();
    if (final_inbound_tab == "FINAL_INBOUND" || final_inbound_tab == "NO_FINAL_INBOUND_DOCUMENTS"){
        window.location.href = '#documentTabFinalInbound';
    }

});

function generateReport(documentId,documentName) {
    if (documentName == "BOOKING REQUEST FORM" || documentName == "BOOKING REQUEST FORM WITH SIGNATURE") {
        var win = window.open('documentations/generateBookingRequestReport?documentIdParam=' + documentId, 'bookingRequest', 'width=910,height=800');
        win.onload = function () {
            this.document.title = "Booking Request Form";
        }
    }
    else if (documentName == "HOUSE BILL OF LADING") {
        var win = window.open('documentations/generateBillofLadingReport?documentIdParam=' + documentId, 'HouseBillofLading', 'width=910,height=800');
        win.onload = function () {
            this.document.title = " House Bill of Lading";
        }
    }
    else if (documentName == "HOUSE WAYBILL ORIGIN" || documentName == "HOUSE WAYBILL ORIGIN WITH SIGNATURE") {
        var win = window.open('documentations/generateHouseWayBillReport?documentIdParam=' + documentId, 'HouseWayBillOrigin', 'width=910,height=800');
        win.onload = function () {
            this.document.title = " House Way Bill Origin";
        }
    }
    else if (documentName == "HOUSE WAYBILL DESTINATION" || documentName == "HOUSE WAYBILL DESTINATION WITH SIGNATURE") {
        var win = window.open('documentations/generateHouseWayBillDestinationReport?documentIdParam=' + documentId, 'HouseWayBillDestination', 'width=910,height=800');
        win.onload = function () {
            this.document.title = " House Way Bill Destination";
        }
    }
    else if (documentName == "ACCEPTANCE RECEIPT") {
        var win = window.open('documentations/generateAcceptanceReceiptReport?documentIdParam=' + documentId, 'Acceptance Receipt', 'width=910,height=800');
        win.onload = function () {
            this.document.title = " Acceptance Receipt";
        }
    }
    else if (documentName == "HOUSE RELEASE ORDER") {
        var win = window.open('documentations/generateReleaseOrderReport?documentIdParam=' + documentId, 'Release Order', 'width=910,height=800');
        win.onload = function () {
            this.document.title = " Release Order";
        }
    }

    }

    function OutboundProgress(){
        document.getElementById("out").className= 'active';
        document.getElementById("in").className= '';
        document.getElementById("arch").className= '';
        document.getElementById("bill").className= '';
        document.getElementById("fiOut").className= '';
        document.getElementById("fiIn").className= '';
}

    function InboundProgress(){
        document.getElementById("in").className= 'active';
        document.getElementById("out").className='';
        document.getElementById("arch").className='';
        document.getElementById("bill").className='';
        document.getElementById("fiOut").className='';
        document.getElementById("fiIn").className='';
}

    function finalOutboundProgress(){
        document.
                getElementById("out").className='';
        document.getElementById("in").className='';
        document.getElementById("arch").className='';
        document.getElementById("bill").className='';
        document.getElementById("fiOut").className= 'active';
    document
            .getElementById("fiIn").className='';
    }

    function finalInboundProgress() {
        document.getElementById("out").className = '';
        document.getElementById("in").className = '';
        document.getElementById("arch").className = '';
        document.getElementById("bill").className = '';
        document.getElementById("fiOut").className = '';
        document.getElementById("fiIn").className = 'active';
}

    function archiveProgress() {
        document.getElementById("out").className = '';
        document.getElementById("in").className = '';
        document.getElementById("arch").className = 'active';
        document.getElementById("bill").className = '';
        document.getElementById("fiOut").className = '';
        document.getElementById("fiIn").className = '';
}

    function BillingProgress() {
        document.getElementById("out").className = '';
        document.getElementById("in").className = '';
        document.getElementById("arch").className = '';
        document.getElementById("bill").className = 'active';
        document.getElementById("fiOut").className = '';
        document.getElementById("fiIn").className = '';
}

// Date Time Picker
var returnedDate = $('#datepicker');

//pick up date validation
returnedDate.datepicker({

    // on 5:00pm
    timeFormat: 'h:mm TT',
    minDate: 0

});

function addCheckText() {
    document.getElementById("documentItem").value = "check";
}

function addOrderId() {
    var orderIdGet = document.getElementById("order_Id").value;
    document.getElementById("order-Id").value = orderIdGet;
}

</script>