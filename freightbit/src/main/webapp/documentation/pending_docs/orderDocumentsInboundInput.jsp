<%--
  Created by IntelliJ IDEA.
  User: JMXPSX
  Date: 9/24/2014
  Time: 5:55 PM
  To change this template use File | Settings | File Templates.
--%>
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

                <div class="panel panel-primary">

                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-list-ol"></i> Cargo Details</h3>
                    </div>

                    <div class="panel-body">
                        <div class="table-responsive list-table">

                            <table class="table table-striped table-hover table-bordered text-center tablesorter" id="orderItems">
                                <thead>
                                <tr class="header_center" style="background-color: #fff;">
                                    <th class="tb-font-black">Inland Origin</th>
                                    <th class="tb-font-black">Sea Freight</th>
                                    <th class="tb-font-black">Inland Destination</th>
                                    <th class="tb-font-black">Quantity</th>
                                    <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                                <span>
                                    <th class="tb-font-black">Size</th>
                                </span>
                                    </s:if>
                                    <s:else>
                                <span>
                                    <th class="tb-font-black">Name</th>
                                </span>
                                    </s:else>
                                    <th class="tb-font-black">Weight <br /> (kg) </th>
                                    <th class="tb-font-black">Volume <br /> (cm&#179;) </th>
                                    <th class="tb-font-black">Commodity</th>
                                    <%--<th class="tb-font-black">Value <br /> (Php) </th>
                                    <th class="tb-font-black">Rate <br /> (Php) </th>
                                    <th class="tb-font-black">Comment</th>--%>
                                </tr>
                                </thead>
                                <tbody>

                                <s:iterator value="orderItems" var="orderItem">
                                    <tr>
                                        <td class="tb-font-black"><s:property value="vendorOrigin"/></td>
                                        <td class="tb-font-black"><s:property value="vendorSea"/></td>
                                        <td class="tb-font-black"><s:property value="vendorDestination"/></td>
                                        <td class="tb-font-black"><s:property value="quantity"/></td>
                                        <td class="tb-font-black"><s:property value="nameSize"/></td>
                                        <td class="tb-font-black"><s:property value="weight"/></td>
                                        <td class="tb-font-black"><s:property value="volume"/></td>
                                        <td class="tb-font-black"><s:property value="description"/></td>
                                            <%--<td class="tb-font-black"><s:property value="declaredValue"/></td>
                                            <td class="tb-font-black"><s:property value="rate"/></td>
                                            <td class="tb-font-black"><s:property value="remarks"/></td>--%>
                                    </tr>
                                </s:iterator>
                                </tbody>
                            </table>

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

                            <div class="col-xs-2 bs-wizard-step disabled"><!-- complete -->
                                <div class="text-center bs-wizard-stepnum">FINAL OUTBOUND</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#finalOutbound" class="bs-wizard-dot" data-toggle="tab" onclick="finalOutboundProgress()"></a>
                                <%--<div class="bs-wizard-info text-center">Integer semper dolor ac auctor rutrum. Duis porta ipsum vitae mi bibendum bibendum</div>--%>
                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                                <div class="text-center bs-wizard-stepnum">FINAL INBOUND</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#finalInbound" class="bs-wizard-dot" data-toggle="tab" onclick="finalInboundProgress()"></a>
                                <%--<div class="bs-wizard-info text-center"></div>--%>
                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                                <div class="text-center bs-wizard-stepnum">ARCHIVE</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#archive" class="bs-wizard-dot" data-toggle="tab" onclick="archiveProgress()"></a>
                                <%--<div class="bs-wizard-info text-center"></div>--%>
                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                                <div class="text-center bs-wizard-stepnum">BILLING</div>
                                <div class="progress"><div class="progress-bar" data-toggle="tab" onclick="BillingProgress"></div></div>
                                <a href="#billing" class="bs-wizard-dot"></a>
                                <%--<div class="bs-wizard-info text-center"></div>--%>
                            </div>
                        </div>

                    </div>
                </div>


                <%--Anchor on tab click--%>

                <s:textfield cssStyle="visibility: hidden;" value="%{documentTab}" id="documentTab"  />
                <s:textfield cssStyle="visibility: hidden;" value="%{documentTabInbound}" id="documentTabInbound"  />

                <s:if test="hasActionMessages()">
                    <div class="col-lg-12" id="successDiv">
                        <div id="alert" class="alert alert-success">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
                        </div>
                    </div>
                </s:if>

                <s:if test=" documentTabInbound == 'NO_INBOUND_DATE' || documentTabInbound == 'INBOUND' ">

                    <div class="well">

                        <div class="container">

                            <div class="form-group">
                                <s:form action="dateReceivedInboundInput" theme="bootstrap">

                                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Date Received</label>
                                    <div class="col-lg-4">
                                        <s:textfield type="hidden" name="document.referenceId" id="document_Id"></s:textfield>
                                        <s:textfield type="hidden" name="document.documentItem" id="documentItem"></s:textfield>
                                        <s:textfield type="text" class="form-control" id="datepicker" value="%{document.inboundReturned}" name="document.inboundReturned"  placeholder="Select Returned date" contenteditable="false" style="margin-bottom: 15px !important;" disabled="true"></s:textfield>
                                    </div>
                                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Comments</label>
                                    <div class="col-lg-4">
                                        <s:textarea cssClass="form-control" value="%{document.documentComments}" name="document.documentComments" cssStyle="resize: none;" disabled="true"></s:textarea>
                                    </div>
                                    <s:submit name="submit" cssClass="btn btn-primary pull-right" value="Set" onclick="addOrderId()" disabled="true"/>
                                </s:form>
                            </div>

                        </div>

                    </div>

                </s:if>

                <s:if test=" documentTabInbound == 'INBOUND' ">

                    <div class="well">
                        <div class="container">
                            <s:form action="addReferenceNumberInbound" theme="bootstrap">
                                <label class="col-lg-2">Reference Number<span class="asterisk_red"></span></label>
                                <div class="col-lg-8">
                                    <%--<s:property value="%{document.documentId}" />--%>
                                    <s:property value="%{document.documentName}" />
                                   <%-- <s:property value="%{document.outboundStage}" />
                                    <s:property value="%{document.inboundStage}" />
                                    <s:property value="%{document.referenceId}" />--%>
                                    <s:hidden name="document.documentId" value="%{document.documentId}" />
                                    <s:hidden name="document.documentName" value="%{document.documentName}" />
                                    <s:hidden name="document.outboundStage" value="%{document.outboundStage}" />
                                    <s:hidden name="document.inboundStage" value="%{document.inboundStage}" />
                                    <s:hidden name="document.referenceId" value="%{document.referenceId}" />
                                    <s:hidden name="document.referenceTable" value="%{document.referenceTable}" />
                                    <s:hidden name="document.orderNumber" value="%{document.orderNumber}" />
                                    <s:hidden name="document.inboundReturned" value="%{document.inboundReturned}" />
                                    <s:hidden name="document.documentComments" value="%{document.documentComments}" />
                                    <s:hidden name="document.orderItemId" value="%{document.orderItemId}" />
                                    <s:textfield cssClass="form-control" placeholder="Reference Number" name="document.referenceNumber"
                                                 id="document.referenceNumber" required="true" maxLength="30" autofocus="true"
                                                 pattern="[a-zA-Z\s ]+"
                                                 title="Name should not contain special characters and/or numbers."/>
                                </div>
                                <s:submit name="submit" cssClass="btn btn-primary" value="Save" />
                            </s:form>
                        </div>
                    </div>

                </s:if>

                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <%--Redirects to Outbound Stage--%>
                    <li>
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
                    <li class="active">
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
                    <li>
                        <s:url var="finalOutboundStageUrl" action="viewOrderDocumentsFinalOutbound">
                            <s:param name="orderIdParam"
                                     value="#attr.order.orderId"></s:param>
                        </s:url>
                        <s:a class="icon-action-link" href="%{finalOutboundStageUrl}">
                            Final Outbound
                        </s:a>
                    </li>
                    <%--Redirects to Final Inbound Stage--%>
                    <li>
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
                    <%--OUTBOUND DOCUMENTS BEGIN--%>
                   <%-- <div class="tab-pane fade" id="outbound">

                        <div class="panel-body">

                            <div class="table-responsive">
                                <display:table id="document" name="outboundEntityList" requestURI="viewOrderDocuments.action" pagesize="10" class="table table-striped table-hover table-bordered text-center tablesorter"
                                               style="margin-top: 15px; visibility:hidden;">

                                    &lt;%&ndash;<td>
                                        <display:column title="" class="tb-font-black" style="text-align: center;" >
                                            <s:if test="#attr.document.documentProcessed == 0">
                                                <s:url var="checkDocumentUrl" action="checkDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{checkDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-square-o"></i>
                                                </s:a>
                                            </s:if>

                                            <s:else>
                                                <s:url var="uncheckDocumentUrl" action="unCheckDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{uncheckDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-check-square-o"></i>
                                                </s:a>
                                            </s:else>
                                            &lt;%&ndash;<s:property value="%{#attr.document.documentProcessed}"/>&ndash;%&gt;
                                            <input type="hidden" id="documentProcess" value="${document.documentProcessed}" name="documentNameParam"/>

                                        </display:column>
                                    </td>&ndash;%&gt;

                                    <td><display:column property="documentName" title="Document Name" class="tb-font-black" style="text-align: center;">
                                        </display:column>
                                    </td>

                                    <td><display:column property="referenceNumber" title="Reference Number" class="tb-font-black" style="text-align: center;">
                                        </display:column>
                                    </td>

                                    <td><display:column property="documentStatus" title="Status" class="tb-font-black"
                                                        style="text-align: center;" > </display:column></td>

                                    &lt;%&ndash;<td><display:column property="documentId" title="ID" class="tb-font-black"
                                                        style="text-align: center;" > </display:column></td>&ndash;%&gt;

                                    <td>
                                        <display:column title="Action" class="tb-font-black" style="text-align: center;" >
                                            <input type="hidden" id="action_${document.documentId}" value="${document.documentId}" name="documentIdParam"/>
                                            <input type="hidden" id="action_${document.documentName}" value="${document.documentName}" name="documentNameParam"/>
                                            &lt;%&ndash;Input Reference ID&ndash;%&gt;
                                            <s:if test="#attr.document.documentName=='PROFORMA BILL OF LADING'">
                                                &lt;%&ndash;<a data-toggle="modal" data-target="#addReferenceNumber" >
                                                    <i class="fa fa-edit"></i>
                                                </a>&ndash;%&gt;
                                                <s:url var="addReferenceNumberUrl" action="orderDocumentsInput">
                                                    <s:param name="orderIdParam" value="%{#attr.document.referenceId}"></s:param>
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a id="edit-icon" class="icon-action-link" href="%{addReferenceNumberUrl}" rel="tooltip" title ="Add Reference Number">
                                                    <i class="fa fa-edit"></i>
                                                </s:a>
                                            </s:if>
                                            &lt;%&ndash;Print Document&ndash;%&gt;
                                            <s:if test="#attr.document.documentName=='BOOKING REQUEST FORM' || #attr.document.documentName=='HOUSE BILL OF LADING' || #attr.document.documentName=='HOUSE WAYBILL ORIGIN' || #attr.document.documentName=='HOUSE WAYBILL DESTINATION' || #attr.document.documentName=='ACCEPTANCE RECEIPT' ">
                                                <a id="print-icon" href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                    <i class="fa fa-print"></i>
                                                </a>
                                            </s:if>
                                            &lt;%&ndash;Move Document&ndash;%&gt;
                                            <s:url var="checkDocumentUrl" action="checkDocument">
                                                <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                            </s:url>
                                            <s:a id="check-icon" class="icon-action-link" href="%{checkDocumentUrl}" rel="tooltip" title ="Next Stage">
                                                <i class="fa fa-chevron-circle-right"></i>
                                            </s:a>

                                        </display:column>
                                    </td>

                                </display:table>
                            </div>
                        </div>

                    </div>--%>
                    <%--INBOUND DOCUMENTS BEGIN--%>
                    <div class="tab-pane fade in active" id="inbound">

                            <div class="panel-body">

                                <div class="table-responsive">
                                    <display:table id="document" name="inboundDocuments" requestURI="viewOrderDocumentsInbound.action" pagesize="10" class="table table-striped table-hover table-bordered text-center tablesorter"
                                                   style="margin-top: 15px;">

                                        <td>
                                            <display:column title="" class="tb-font-black" style="text-align: center;" >

                                                <s:if test=" documentTabInbound == 'INBOUND' ">

                                                    <%--<s:url var="checkDocumentInboundUrl" action="checkDocumentInbound">
                                                        <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                    </s:url>
                                                    <s:a class="icon-action-link" href="%{checkDocumentInboundUrl}" rel="tooltip" title ="Check Document">
                                                        <i class="fa fa-square-o"></i>
                                                    </s:a>--%>
                                                    <s:if test="#attr.document.documentProcessed == 2">
                                                        <%--<s:checkbox theme="simple" name="check" fieldValue="%{#attr.document.documentId}"/>--%>
                                                        <i class="fa fa-check-square-o"></i>
                                                    </s:if>
                                                    <s:else>
                                                        <i class="fa fa-square-o"></i>
                                                    </s:else>
                                                    <%--<i class="fa fa-check-square-o"></i>--%>
                                                </s:if>

                                                <%--<s:if test=" documentTabInbound == 'NO_INBOUND_DATE' ">

                                                    <i class="fa fa-square-o"></i>

                                                </s:if>--%>
                                                <%--<s:property value="%{#attr.document.documentProcessed}"/>--%>
                                                <input type="hidden" id="documentProcess" value="${document.documentProcessed}" name="documentNameParam"/>

                                            </display:column>
                                        </td>

                                        <td><display:column property="documentName" title="Document Name" class="tb-font-black" style="text-align: center;">
                                        </display:column>
                                        </td>

                                        <td><display:column property="referenceNumber" title="Reference Number" class="tb-font-black" style="text-align: center;">
                                        </display:column>
                                        </td>

                                        <td><display:column property="vendorCode" title="Vendor" class="tb-font-black" style="text-align: center;">
                                        </display:column>
                                        </td>

                                        <td><display:column property="documentStatus" title="Status" class="tb-font-black" style="text-align: center;">
                                        </display:column>
                                        </td>

                                        <%--<td><display:column property="documentId" title="ID" class="tb-font-black"
                                                        style="text-align: center;" > </display:column></td>--%>

                                        <td>
                                            <%--<display:column title="Action" class="tb-font-black" style="text-align: center;" >
                                                <input type="hidden" id="action_${document.documentId}" value="${document.documentId}" name="documentIdParam"/>
                                                <input type="hidden" id="action_${document.documentName}" value="${document.documentName}" name="documentNameParam"/>

                                                &lt;%&ndash;Input Reference ID&ndash;%&gt;
                                                <s:if test="#attr.document.documentName=='MASTER BILL OF LADING' || #attr.document.documentName=='SALES INVOICE / DELIVERY RECEIPT' || #attr.document.documentName=='MASTER WAYBILL ORIGIN' ">
                                                    &lt;%&ndash;<a data-toggle="modal" data-target="#addReferenceNumber" >
                                                        <i class="fa fa-edit"></i>
                                                    </a>&ndash;%&gt;
                                                    <s:url var="addReferenceNumberInboundUrl" action="orderDocumentsInboundInput">
                                                        <s:param name="orderIdParam" value="%{#attr.document.referenceId}"></s:param>
                                                        <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                    </s:url>
                                                    <s:a id="edit-icon" class="icon-action-link" href="%{addReferenceNumberInboundUrl}" rel="tooltip" title ="Add Reference Number">
                                                        <i class="fa fa-edit"></i>
                                                    </s:a>
                                                </s:if>
                                                &lt;%&ndash;Print Document&ndash;%&gt;
                                                <s:if test="#attr.document.documentName=='BOOKING REQUEST FORM WITH SIGNATURE' || #attr.document.documentName=='HOUSE BILL OF LADING' || #attr.document.documentName=='HOUSE WAYBILL ORIGIN WITH SIGNATURE' ">
                                                    <a id="print-icon" href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                        <i class="fa fa-print"></i>
                                                    </a>
                                                </s:if>
                                                &lt;%&ndash;Move Document&ndash;%&gt;
                                                <s:url var="moveDocumentUrl" action="moveDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a id="check-icon" class="icon-action-link" href="%{moveDocumentUrl}" rel="tooltip" title ="Next Stage">
                                                    <i class="fa fa-hand-o-right"></i>
                                                </s:a>

                                            </display:column>--%>
                                            <display:column title="Action" class="tb-font-black" style="text-align: center;" >
                                                <i class="fa fa-ban"></i>
                                            </display:column>
                                        </td>

                                    </display:table>
                                </div>
                                <button type="button" id="Cancel" class="pull-right btn" disabled>
                                    Check Document(s)
                                </button>
                            </div>

                    </div>
                    <%--FINAL SET OUTBOUND DOCUMENTS BEGIN--%>
                    <%--<div class="tab-pane fade" id="finalOutbound">

                        <div class="panel-body">

                            <div class="table-responsive">
                                <display:table id="InboundDocument" name="finalOutboundEntityList" requestURI="viewOrderDocuments.action" pagesize="10" class="table table-striped table-hover table-bordered text-center tablesorter"
                                               style="margin-top: 15px; visibility:hidden;">

                                    &lt;%&ndash;<td>
                                        <display:column title="" class="tb-font-black" style="text-align: center;" >
                                            <s:if test="#attr.document.documentProcessed == 0">
                                                <s:url var="checkDocumentUrl" action="checkDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{checkDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-square-o"></i>
                                                </s:a>
                                            </s:if>

                                            <s:else>
                                                <s:url var="uncheckDocumentUrl" action="unCheckDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{uncheckDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-check-square-o"></i>
                                                </s:a>
                                            </s:else>
                                            &lt;%&ndash;<s:property value="%{#attr.document.documentProcessed}"/>&ndash;%&gt;
                                            <input type="hidden" id="documentProcess" value="${document.documentProcessed}" name="documentNameParam"/>

                                        </display:column>
                                    </td>&ndash;%&gt;

                                    <td><display:column property="documentName" title="Document Name" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                    </td>

                                    <td><display:column property="documentStatus" title="Status" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                    </td>

                                    <td><display:column property="referenceNumber" title="Reference Number" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                    </td>

                                    &lt;%&ndash;<td><display:column property="documentStatus" title="Status" class="tb-font-black"
                                                        style="text-align: center;" > </i></display:column></td>&ndash;%&gt;

                                    <td>
                                        <display:column title="Action" class="tb-font-black" style="text-align: center;" > </i>
                                            <a href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                <i class="fa fa-print"></i>
                                            </a>
                                            <input type="hidden" id="action_${document.documentId}" value="${document.documentId}" name="documentIdParam"/>
                                            <input type="hidden" id="action_${document.documentName}" value="${document.documentName}" name="documentNameParam"/>
                                        </display:column>
                                    </td>

                                </display:table>
                            </div>
                        </div>

                    </div>--%>
                    <%--FINAL SET INBOUND DOCUMENTS BEGIN--%>
                    <%--<div class="tab-pane fade" id="finalInbound">

                        <div class="panel-body">

                            <div class="table-responsive">
                                <display:table id="InboundDocument" name="finalInboundEntityList" requestURI="viewOrderDocuments.action" pagesize="10" class="table table-striped table-hover table-bordered text-center tablesorter"
                                               style="margin-top: 15px; visibility:hidden;">

                                    &lt;%&ndash;<td>
                                        <display:column title="" class="tb-font-black" style="text-align: center;" >
                                            <s:if test="#attr.document.documentProcessed == 0">
                                                <s:url var="checkDocumentUrl" action="checkDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{checkDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-square-o"></i>
                                                </s:a>
                                            </s:if>

                                            <s:else>
                                                <s:url var="uncheckDocumentUrl" action="unCheckDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{uncheckDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-check-square-o"></i>
                                                </s:a>
                                            </s:else>
                                            &lt;%&ndash;<s:property value="%{#attr.document.documentProcessed}"/>&ndash;%&gt;
                                            <input type="hidden" id="documentProcess" value="${document.documentProcessed}" name="documentNameParam"/>

                                        </display:column>
                                    </td>&ndash;%&gt;

                                    <td><display:column property="documentName" title="Document Name" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                    </td>

                                    <td><display:column property="documentStatus" title="Status" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                    </td>

                                    <td><display:column property="referenceNumber" title="Reference Number" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                    </td>

                                    &lt;%&ndash;<td><display:column property="documentStatus" title="Status" class="tb-font-black"
                                                        style="text-align: center;" > </i></display:column></td>&ndash;%&gt;

                                    <td>
                                        <display:column title="Action" class="tb-font-black" style="text-align: center;" > </i>
                                            <a href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                <i class="fa fa-print"></i>
                                            </a>
                                            <input type="hidden" id="action_${document.documentId}" value="${document.documentId}" name="documentIdParam"/>
                                            <input type="hidden" id="action_${document.documentName}" value="${document.documentName}" name="documentNameParam"/>
                                        </display:column>
                                    </td>

                                </display:table>
                            </div>
                        </div>

                    </div>--%>
                    <%--ARCHIVE BEGIN--%>
                    <%--<div class="tab-pane fade" id="archive">

                        <div class="panel-body">

                            <div class="table-responsive">
                                <display:table id="InboundDocument" name="archiveEntityList" requestURI="viewOrderDocuments.action" pagesize="10" class="table table-striped table-hover table-bordered text-center tablesorter"
                                               style="margin-top: 15px; visibility:hidden;">

                                    &lt;%&ndash;<td>
                                        <display:column title="" class="tb-font-black" style="text-align: center;" >
                                            <s:if test="#attr.document.documentProcessed == 0">
                                                <s:url var="checkDocumentUrl" action="checkDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{checkDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-square-o"></i>
                                                </s:a>
                                            </s:if>

                                            <s:else>
                                                <s:url var="uncheckDocumentUrl" action="unCheckDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{uncheckDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-check-square-o"></i>
                                                </s:a>
                                            </s:else>
                                            &lt;%&ndash;<s:property value="%{#attr.document.documentProcessed}"/>&ndash;%&gt;
                                            <input type="hidden" id="documentProcess" value="${document.documentProcessed}" name="documentNameParam"/>

                                        </display:column>
                                    </td>&ndash;%&gt;

                                    <td><display:column property="documentName" title="Document Name" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                    </td>

                                    <td><display:column property="documentStatus" title="Status" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                    </td>

                                    <td><display:column property="referenceNumber" title="Reference Number" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                    </td>

                                    &lt;%&ndash;<td><display:column property="documentStatus" title="Status" class="tb-font-black"
                                                        style="text-align: center;" > </i></display:column></td>&ndash;%&gt;

                                    <td>
                                        <display:column title="Action" class="tb-font-black" style="text-align: center;" > </i>
                                            <a href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                <i class="fa fa-print"></i>
                                            </a>
                                            <input type="hidden" id="action_${document.documentId}" value="${document.documentId}" name="documentIdParam"/>
                                            <input type="hidden" id="action_${document.documentName}" value="${document.documentName}" name="documentNameParam"/>
                                        </display:column>
                                    </td>

                                </display:table>
                            </div>
                        </div>

                    </div>--%>
                    <%--BILLING DOCUMENTS BEGIN--%>
                    <%--<div class="tab-pane fade" id="billing">

                        <div class="panel-body">

                            <div class="table-responsive">
                                <display:table id="InboundDocument" name="billingEntityList" requestURI="viewOrderDocuments.action" pagesize="10" class="table table-striped table-hover table-bordered text-center tablesorter"
                                               style="margin-top: 15px; visibility:hidden;">

                                    &lt;%&ndash;<td>
                                        <display:column title="" class="tb-font-black" style="text-align: center;" >
                                            <s:if test="#attr.document.documentProcessed == 0">
                                                <s:url var="checkDocumentUrl" action="checkDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{checkDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-square-o"></i>
                                                </s:a>
                                            </s:if>

                                            <s:else>
                                                <s:url var="uncheckDocumentUrl" action="unCheckDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{uncheckDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-check-square-o"></i>
                                                </s:a>
                                            </s:else>
                                            &lt;%&ndash;<s:property value="%{#attr.document.documentProcessed}"/>&ndash;%&gt;
                                            <input type="hidden" id="documentProcess" value="${document.documentProcessed}" name="documentNameParam"/>

                                        </display:column>
                                    </td>&ndash;%&gt;

                                    <td><display:column property="documentName" title="Document Name" class="tb-font-black" style="text-align: center;">
                                        </display:column>
                                    </td>

                                    <td><display:column property="referenceNumber" title="Reference Number" class="tb-font-black" style="text-align: center;">
                                        </display:column>
                                    </td>

                                    <td><display:column property="documentStatus" title="Status" class="tb-font-black" style="text-align: center;">
                                        </display:column>
                                    </td>

                                    &lt;%&ndash;<td><display:column property="documentStatus" title="Status" class="tb-font-black"
                                                        style="text-align: center;" > </i></display:column></td>&ndash;%&gt;

                                    <td>
                                        <display:column title="Action" class="tb-font-black" style="text-align: center;" > </i>
                                            <a href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                <i class="fa fa-print"></i>
                                            </a>
                                            <input type="hidden" id="action_${document.documentId}" value="${document.documentId}" name="documentIdParam"/>
                                            <input type="hidden" id="action_${document.documentName}" value="${document.documentName}" name="documentNameParam"/>
                                        </display:column>
                                    </td>

                                </display:table>
                            </div>
                        </div>

                    </div>--%>
                </div>

            </div>

        </div>
    </div>
</div>

<script>

$(document).ready(function() {
    $( window ).load(function() {
        var outbound_tab = $("#documentTab").val();

        if(outbound_tab == "OUTBOUND_COMPLETE"){
            $("#first").toggleClass('active complete');
            $("#second").toggleClass('disabled active');
        }
    });
    /*Anchor on message*/
    if ($('#successDiv').length !== 0){
        window.location.href = '#successDiv';
    }
    /*Anchor on inbound tab click*/
    var inbound_tab = $("#documentTab").val();
    if (inbound_tab == "INBOUND"){
        window.location.href = '#documentTab';
    }
/*Disables the edit icon on house documents*/
/*var tbl = document.getElementById("document");
if (tbl != null) {
    for (var i = 0; i < tbl.rows.length; i++) {

        if (tbl.rows[i].cells[0].innerHTML == "HOUSE BILL OF LADING") {
            *//*tbl.rows[i].cells[3].innerHTML= "<i class='fa fa-ban'></i>";*//*
            tbl.rows[i].cells[3].getElementById("edit-icon").style.display="none";
            *//*$("#edit-icon").css("display", "none");*//*

            *//*var test = tbl.rows[i].cells[3].getElementById("edit-icon");
            alert(test);*//*
        }

    }
}*/

/*// Anchor on successDiv on every add order item
if ($('#successDiv').length !== 0){
    window.location.href = '#successDiv';
}*/

/*if (tbl==null){
    $("#first").toggleClass('active complete');
    $("#second").toggleClass('disabled active');}*/

    /*var tbl = document.getElementById("document");
    if (tbl != null) {
        for (var i = 0; i < tbl.rows.length; i++) {
            if (tbl.rows[i].cells[0].innerHTML == "0") {
                tbl.rows[i].cells[0].innerHTML= "<i class='fa fa-square-o'></i>";
            }
        }
    }*/

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
    else if (documentName == "HOUSE WAYBILL ORIGIN" || documentName == "HOUSE WAYBILL ORIGIN WITH SIGNATURE")  {
        var win = window.open('documentations/generateHouseWayBillReport?documentIdParam=' + documentId, 'HouseWayBillOrigin', 'width=910,height=800');
        win.onload = function () {
            this.document.title = " House Way Bill Origin";
        }
    }
    else if (documentName == "HOUSE WAYBILL DESTINATION") {
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
}

    /*function generateReleaseOrderReport(){

        var win = window.open('documentations/generateReleaseOrderReport','bookingRequest','width=910,height=800');
        win.onload = function() { this.document.title = "Release Order"; }

    }
*/
function OutboundProgress(){
    document.getElementById("out").className='active';
    document.getElementById("in").className='';
    document.getElementById("arch").className='';
    document.getElementById("bill").className='';
    document.getElementById("fiOut").className='';
    document.getElementById("fiIn").className='';
}

function InboundProgress(){
    document.getElementById("in").className='active';
    document.getElementById("out").className='';
    document.getElementById("arch").className='';
    document.getElementById("bill").className='';
    document.getElementById("fiOut").className='';
    document.getElementById("fiIn").className='';
}

function finalOutboundProgress(){
    document.getElementById("out").className='';
    document.getElementById("in").className='';
    document.getElementById("arch").className='';
    document.getElementById("bill").className='';
    document.getElementById("fiOut").className='active';
    document.getElementById("fiIn").className='';
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

function addOrderId() {
    /*var order_Id = document.getElementById("order_Id").value;
    document.getElementById("document_Id").value = order_Id;*/
    document.getElementById("documentItem").value = "save";
}

</script>