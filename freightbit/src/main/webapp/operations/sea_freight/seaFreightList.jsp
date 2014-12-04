<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

            <div class="col-md-12 form-group pull-left" style="margin-top: 0.8em; margin-left: -5em; margin-bottom: 0em;">
                <s:form action="changeOrigin" theme="bootstrap">
                <label class="col-lg-2 control-label">Sort by Origin :</label>
                <div class="col-lg-4">
                    <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                              id="select1" list="portsList" listKey="key"
                              listValue="value" name="originCity" emptyOption="true"
                              />
                </div>
                    <s:submit name="submit" cssClass="btn btn-primary" value="Okay" />
                </s:form>

            </div>

            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist" style="clear:both; padding: 5px; padding-bottom: 0px;">
                <li class="active" id="out">
                    <a href="#fclTab" role="tab" data-toggle="tab">Full Container Load (FCL)</a>
                </li>
                <li id="in">
                    <a href="#lclTab" role="tab" data-toggle="tab">Less Container Load (LCL)</a>
                </li>
                <li id="fiOut">
                    <a href="#lcuTab" role="tab" data-toggle="tab">Loose Cargo Load (LCU)</a>
                </li>
                <li id="fiIn">
                    <a href="#rcuTab" role="tab" data-toggle="tab">Rolling Cargo Load (RCU)</a>
                </li>
            </ul>

            <div class="tab-content">

                <div class="tab-pane fade in active" id="fclTab">

                    <div class="panel-body">
                        <div class="table-responsive">
                            <display:table id="order" name="fclTable"
                                           requestURI="viewSeaFreightList.action" pagesize="10"
                                           class="fclTable table table-hover table-bordered text-center tablesorter table-condensed"
                                           style="margin-top: 15px;empty-cells: hide;">

                                <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="destinationPort" title="DES <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--<td><display:column property="serviceRequirement" title="Req't <i class='fa fa-sort' />"
                                                    class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>--%>
                                <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column title="Action">
                                    <s:if test="#attr.order.orderStatus=='PENDING'">
                                        <i class="fa fa-ban"></i>
                                    </s:if>
                                    <s:else>
                                        <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">
                                            <s:param name="orderIdParam" value="#attr.order.orderId"></s:param>
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
                                    </s:else>
                                </display:column></td>

                            </display:table>
                        </div>
                    </div>

                </div>

                <div class="tab-pane fade" id="lclTab">
                    <div class="panel-body">
                        <div class="table-responsive">
                        <s:form name="myform" action="checkOrderConsolidate" theme="bootstrap">
                            <display:table id="order" name="lclTable"
                                           requestURI="viewSeaFreightList.action" pagesize="10"
                                           class="lclTable table table-hover table-bordered text-center tablesorter table-condensed"
                                           style="margin-top: 15px;empty-cells: hide;">

                                <td>
                                    <display:column title="<input type='checkbox' id='mainCheckBox' name='mainCheckBox'/>">
                                        <s:checkbox theme="simple" name="check"
                                                    fieldValue="%{#attr.order.orderId}"/>
                                    </display:column>
                                </td>

                                <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="destinationPort" title="DES <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--<td><display:column property="serviceRequirement" title="Req't <i class='fa fa-sort' />"
                                                    class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>--%>
                                <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="orderWeight" title="Weight  <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="orderVolume" title="Volume  <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column title="Action">
                                    <s:if test="#attr.order.orderStatus=='PENDING'">
                                        <i class="fa fa-ban"></i>
                                    </s:if>
                                    <s:else>
                                        <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">
                                            <s:param name="orderIdParam" value="#attr.order.orderId"></s:param>
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
                                    </s:else>
                                </display:column></td>

                            </display:table>
                            <div class="col-md-6 pull-right well">
                                <p>Total Weight (kg) : <font id="wellTotalWeight">0</font></p>
                                <p>Total Volume  (cbm) : <font id="wellTotalVolume">0</font></p>
                                <hr/>
                                <h4>
                                    <i style="color: #3498DB;" class="fa fa-gears"></i>
                                    Recommended container
                                </h4>
                                <div id="mainReco">
                                    <div id="recommendedContent">
                                        Choose item(s) first
                                    </div>
                                    <%--<div id="loadingIcon" style="align-items: center; width: 100%; padding: 15px; text-align: center">--%>
                                        <%--<i style="font-size: 50px; color: #BDC3C7;" class="fa fa-circle-o-notch fa-spin"></i>--%>
                                    <%--</div>--%>
                                </div>
                                <hr/>
                                <s:submit cssClass="btn btn-default" value="Consolidate" ></s:submit>
                            </div>

                        </s:form>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="lcuTab">

                    <div class="panel-body">
                        <div class="table-responsive">
                            <display:table id="order" name="lcuTable"
                                           requestURI="viewSeaFreightList.action" pagesize="10"
                                           class="table table-hover table-bordered text-center tablesorter table-condensed"
                                           style="margin-top: 15px;empty-cells: hide;">

                                <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="destinationPort" title="DES <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--<td><display:column property="serviceRequirement" title="Req't <i class='fa fa-sort' />"
                                                    class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>--%>
                                <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column title="Action">
                                    <s:if test="#attr.order.orderStatus=='PENDING'">
                                        <i class="fa fa-ban"></i>
                                    </s:if>
                                    <s:else>
                                        <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">
                                            <s:param name="orderIdParam" value="#attr.order.orderId"></s:param>
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
                                    </s:else>
                                </display:column></td>

                            </display:table>
                        </div>
                    </div>

                </div>

                <div class="tab-pane fade" id="rcuTab">

                    <div class="panel-body">
                        <div class="table-responsive">
                            <display:table id="order" name="rcuTable"
                                           requestURI="viewSeaFreightList.action" pagesize="10"
                                           class="table table-hover table-bordered text-center tablesorter table-condensed"
                                           style="margin-top: 15px;empty-cells: hide;">

                                <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="destinationPort" title="DES <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--<td><display:column property="serviceRequirement" title="Req't <i class='fa fa-sort' />"
                                                    class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>--%>
                                <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column title="Action">
                                    <s:if test="#attr.order.orderStatus=='PENDING'">
                                        <i class="fa fa-ban"></i>
                                    </s:if>
                                    <s:else>
                                        <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">
                                            <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
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
                                    </s:else>
                                </display:column></td>

                            </display:table>
                        </div>
                    </div>

                </div>

            </div>

            <div class="panel-footer">
                <div class="table-responsive">
                    <div class="col-lg-12">
                        <table class="col-lg-12">
                            <tr>
                                <td><label>LEGEND:</label></td>
                                <td><i class="fa fa-stop" style="color: #d9534f;"></i> Cancelled</td>
                                <td><i class="fa fa-stop" style="color: #428bca;"></i> On Going</td>
                                <td style="width: 20%;"><i class="fa fa-stop" style="color: #f0ad4e;"></i> Pending / Incomplete</td>
                                <td><i class="fa fa-stop" style="color: #5cb85c;"></i> Approved / Newly Added</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><i class='fa fa-anchor'></i> Shipping</td>
                                <td><i class='fa fa-truck' ></i> Trucking</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script>

    $(document).ready(function(){
        tablePropClass('DESTI_ORIG','fclTable', 7, 5, 0, 6, 0, 4);
        tablePropClass('DESTI_ORIG','lclTable', 8, 5, 0, 7, 0, 6);

        seaFreightLclComputation('lclTable', 'wellTotalWeight', 'wellTotalVolume');

        var freightStatus = $('#order tbody tr td:nth-child(7)'),
            freightAction = $('#order tbody tr td:nth-child(8)');

        for(var i=0; i < $('#order tbody tr').size(); i++){
            if(freightStatus.eq(i).text() == 'INCOMPLETE'){
                freightAction.eq(i).empty().append('<i class="fa fa-ban"></i>')
            }
        }

        $('#mainCheckBox').click(function(){
            var allCheckbox = $('.lclTable tbody tr td input[type="checkbox"]');
            if(allCheckbox.is(':checked')){
                allCheckbox.prop('checked', false);
                computeAll('lclTable', 'wellTotalWeight', 'wellTotalVolume', 'SUBTRACT');
            }else{
                allCheckbox.prop('checked', true);
                computeAll('lclTable', 'wellTotalWeight', 'wellTotalVolume', 'ADD');
            }
        })

    })

    $(function () {
        $('#myTab a:first').tab('show')
    });
    $(function() {
        //for bootstrap 3 use 'shown.bs.tab' instead of 'shown' in the next line
        $('a[data-toggle="tab"]').on('click', function (e) {
            localStorage.setItem('lastTab', $(e.target).attr('href'));
        });

        //go to the latest tab, if it exists:
        var lastTab = localStorage.getItem('lastTab');

        if (lastTab) {
            $('a[href="'+lastTab+'"]').click();

        }
    });
</script>