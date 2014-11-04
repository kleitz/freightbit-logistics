<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-anchor"></i> Freight Plan : Orders </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Freight Plan : Orders </li>
        </ol>
    </div>
</div>

<div class="row">

    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i>
                    Freight Plan List
                </h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive">
                    <display:table id="order" name="orders"
                                   requestURI="viewSeaFreightList.action" pagesize="10"
                                   class="table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                   style="margin-top: 15px;empty-cells: hide;">

                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="serviceRequirement" title="Rqt. <i class='fa fa-sort' />"
                                            class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column title="Action">
                            <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">
                                <s:param name="orderIdParam"
                                         value="#attr.order.orderId"></s:param>
                                <s:param name="orderNoParam"
                                         value="#attr.order.orderNo"></s:param>
                            </s:url>
                            <s:a class="icon-action-link" href="%{viewSeaFreightItemListUrl}" rel="tooltip"
                                 title="Update Status">
                                <i class="fa fa-edit" id="status"></i>
                            </s:a>

                            <s:url var="viewInfoOrderUrl" action="../operations/viewInfoOrderSea">
                                <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                            </s:url>
                            <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">
                                <i class="fa fa-info-circle"></i>
                            </s:a>
                        </display:column></td>

                    </display:table>
                </div>
            </div>

            <div class="panel-footer">
                <span class="pull-left">
                    <label>LEGEND:</label> <i class="fa fa-stop" style="color: #f0ad4e;"></i> Pending / Incomplete <i class="fa fa-stop" style="color: #d9534f;"></i> Cancelled <i class="fa fa-stop" style="color: #428bca;"></i> On Going <i class="fa fa-stop" style="color: #5cb85c;"></i> Approved <i class='fa fa-anchor'></i> Shipping <i class='fa fa-truck' ></i> Trucking
                </span>
                <%--<span class="pull-right">
                    <button type="button" class="btn btn-success new-booking" onclick="location.href='bookingSearch'">
                        <i class="fa fa-search"></i> Search Booking
                    </button>
                    <button type="button" class="btn btn-primary new-booking"
                            onclick="location.href='loadAddOrderPage'">
                        <i class="fa fa-book"></i> New Booking
                    </button>
                </span>--%>
            </div>

        </div>
    </div>

</div>

<script>

    $(document).ready(function() {
        /*color coding of rows*/
        var tbl = document.getElementById("order");
        if (tbl != null) {
            for (var i = 0; i < tbl.rows.length; i++) {

                if (tbl.rows[i].cells[6].innerHTML == "PENDING" || tbl.rows[i].cells[6].innerHTML == "INCOMPLETE" ) {

                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[j].style.backgroundColor = "#fcf8e3";
                    }
                }

                if (tbl.rows[i].cells[6].innerHTML == "DISAPPROVED" || tbl.rows[i].cells[6].innerHTML == "CANCELLED") {

                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[j].style.backgroundColor = "#f2dede";
                    }
                }

                if (tbl.rows[i].cells[6].innerHTML == "APPROVED" || tbl.rows[i].cells[6].innerHTML == "SERVICE ACCOMPLISHED") {

                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[j].style.backgroundColor = "#dff0d8";
                    }
                }

                if (tbl.rows[i].cells[6].innerHTML == "ON GOING") {

                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[j].style.backgroundColor = "#bce8f1";
                    }
                }
            }
        }

    });

//    TYPE
    $(document).ready(function() {
        /*color coding of rows*/
        var tbl = document.getElementById("order");
        if (tbl != null) {
            for (var i = 0; i < tbl.rows.length; i++) {

                if (tbl.rows[i].cells[3].innerHTML == "SHIPPING AND TRUCKING" || tbl.rows[i].cells[3].innerHTML == "SHIP AND TRUCK" ) {

                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[3].innerHTML = "<i class='fa fa-anchor' /> <i class='fa fa-truck' />";
                    }
                }

                if (tbl.rows[i].cells[3].innerHTML == "SHIPPING"  ) {

                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[3].innerHTML = "<i class='fa fa-anchor' />";
                    }
                }

                if (tbl.rows[i].cells[3].innerHTML == "TRUCKING"  ) {

                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[3].innerHTML = "<i class='fa fa-truck' />";
                    }
                }
            }
        }

    });

//    RQT

    $(document).ready(function() {
        /*color coding of rows*/
        var tbl = document.getElementById("order");
        if (tbl != null) {
            for (var i = 0; i < tbl.rows.length; i++) {
                if (tbl.rows[i].cells[4].innerHTML == "FULL CARGO LOAD" || tbl.rows[i].cells[4].innerHTML == "FULL CONTAINER LOAD") {

                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[4].innerHTML = "FCL";
                    }
                }

                if (tbl.rows[i].cells[4].innerHTML == "FULL TRUCK LOAD" ) {

                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[4].innerHTML = "FTL";
                    }
                }

                if (tbl.rows[i].cells[4].innerHTML == "LESS TRUCK LOAD" ) {

                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[4].innerHTML = "LTL";
                    }
                }

                if (tbl.rows[i].cells[4].innerHTML == "LESS CARGO LOAD" || tbl.rows[i].cells[4].innerHTML == "LESS CONTAINER LOAD") {

                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[4].innerHTML = "LCL";
                    }
                }

                if (tbl.rows[i].cells[4].innerHTML == "LOOSE CARGO LOAD" ) {

                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[4].innerHTML = "LCU";
                    }
                }

                if (tbl.rows[i].cells[4].innerHTML == "ROLLING CARGO LOAD" ) {

                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[4].innerHTML = "CU";
                    }
                }
            }
        }
    });

//    MODE
    $(document).ready(function() {
        /*color coding of rows*/
        var tbl = document.getElementById("order");
        if (tbl != null) {
            for (var i = 0; i < tbl.rows.length; i++) {
                if (tbl.rows[i].cells[5].innerHTML == "DOOR TO DOOR" ) {

                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[5].innerHTML = "DD";
                    }
                }

                if (tbl.rows[i].cells[5].innerHTML == "DOOR TO PIER" || tbl.rows[i].cells[5].innerHTML == "DOOR TO PORT" ) {

                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[5].innerHTML = "DP";
                    }
                }

                if (tbl.rows[i].cells[5].innerHTML == "PIER TO DOOR" || tbl.rows[i].cells[5].innerHTML == "PORT TO DOOR" ) {

                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[5].innerHTML = "PD";
                    }
                }

                if (tbl.rows[i].cells[5].innerHTML == "PIER TO PIER" || tbl.rows[i].cells[5].innerHTML == "PORT TO PORT" ) {

                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[5].innerHTML = "PP";
                    }
                }

                if (tbl.rows[i].cells[5].innerHTML == "PICKUP" ) {

                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[5].innerHTML = "P";
                    }
                }

                if (tbl.rows[i].cells[5].innerHTML == "DELIVERY" ) {

                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[5].innerHTML = "D";
                    }
                }

                if (tbl.rows[i].cells[5].innerHTML == "INTER-WAREHOUSE" ) {

                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[5].innerHTML = "IW";
                    }
                }
            }
        }
    });

</script>

