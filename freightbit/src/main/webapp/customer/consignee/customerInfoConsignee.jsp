<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
    .deleteCustomerConsigneeContactIcon {
        cursor: pointer;
    }
</style>

<script>
    $( window ).load(function(){
        var tableTr = $('.contacts tbody tr');

        if (tableTr.size()>0){
            $('.btnAddNewConPerson').prop('disabled',true);
        }else{
            $('.btnAddNewConPerson').prop('disabled',false);
        }
    })
</script>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-male"></i> Customer Module</h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Customer</li>
            <li class="active"><a href="<s:url action='customerList' />"> Customer List</a>
            </li>
            <li class="active"><a href="<s:url action='customerInfo' />"> Customer
                Profile</a></li>
            <li class="active"><a href="<s:url action='viewConsignees' />"> Consignee List</a>
            </li>
            <li class="active"> Consignee Profile</li>
        </ol>

    </div>
</div>

<s:if test="hasActionErrors()">
    <div class="col-lg-12">
        <div class="alert alert-errors">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <strong><s:actionerror cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<div class="row">
    <div class="col-lg-12" >
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-info-circle"></i> Consignee Profile</h3>
                <span class="pull-right">
                        <s:url var="loadEditConsginee" action="loadEditConsignee">
                            <s:param name="contactCodeParam"
                                     value="#attr.consignee.contactId"></s:param>
                            <s:param name="addressIdParam"
                                     value="%{#attr.consignee.addressId}"></s:param>
                        </s:url>
                        <sec:authorize
                                access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                            <s:a href="%{loadEditConsginee}" cssClass="btn btn-success new-booking" rel="tooltip"
                                 title="Edit this Customer">
                                <i class="fa fa-pencil"></i> Edit Consignee
                            </s:a>
                        </sec:authorize>

                </span>
            </div>

            <div class="panel-body">

                <div class="row">

                    <div class="col-lg-6 col-lg-offset-3">

                        <div class="panel panel-info">

                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="col-lg-3">
                                        <div align="center" style="margin-top: 10px;">
                                            <img alt="User Pic" src="../includes/images/photo.png" class="img-circle">
                                        </div>
                                    </div>

                                    <div class="col-lg-9">
                                        <table class="table table-user-information" style="margin-top: 10px;">
                                            <tbody>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; border-top: none; text-align: left !important;">Company Name</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="consignee.companyName"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; border-top: none; text-align: left !important;">First Name</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="consignee.firstName"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Middle Name</td>
                                                <td style="text-align: left !important"><s:property value="consignee.middleName"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Last Name</td>
                                                <td style="text-align: left !important"><s:property value="consignee.lastName"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Phone</td>
                                                <td style="text-align: left !important"><s:property value="consignee.phone"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Mobile</td>
                                                <td style="text-align: left !important"><s:property value="consignee.mobile"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Email Address</td>
                                                <td style="text-align: left !important"><s:property value="consignee.email"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Fax</td>
                                                <td style="text-align: left !important"><s:property value="consignee.fax"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Address Line 1</td>
                                                <td style="text-align: left !important"><s:property value="consignee.addressLine1"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Address Line 2</td>
                                                <td style="text-align: left !important"><s:property value="consignee.addressLine2"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">City</td>
                                                <td style="text-align: left !important"><s:property value="consignee.city"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Region</td>
                                                <td style="text-align: left !important"><s:property value="consignee.state"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">ZIP</td>
                                                <td style="text-align: left !important"><s:property value="consignee.zip"/></td>
                                            </tr>

                                            </tbody>
                                            <%--<s:set name="customerId" value="%{customer.customerId}" scope="session"/>--%>
                                            <s:set name="customerId" value="%{consignee.referenceId1}" scope="session"/>
                                            <%--<s:property value="%{consignee.referenceId1}" />--%>
                                        </table>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>

                </div>

                <s:if test="hasActionMessages()">
                    <div class="col-lg-12">
                        <div class="alert alert-success" id="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
                        </div>
                    </div>
                </s:if>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-primary">

                            <div class="panel-heading">
                                <h3 class="panel-title responsiveTitle" style="float:left; margin-top:10px;"><i class="fa fa-list"></i> Contact
                                    Person List</h3>
                                <span class="pull-right">
                                    <s:url var="loadConsigneeAddContactUrl" action="loadConsigneeAddContact">
                                        <s:param name="contactCodeParam" value="contactCodeParam"> </s:param>
                                        <s:param name="addressIdParam" value="addressIdParam"> </s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{loadConsigneeAddContactUrl}" rel="tooltip" title="Add Contact">
                                        <button type="button" class="btn btn-primary btnAddNewConPerson">
                                            <i class="fa fa-group"> </i> New Contact Person
                                        </button>
                                    </s:a>
                                </span>
                            </div>

                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="table-responsive list-table">
                                            <tbody>
                                                <table>
                                                    <tr>
                                                        <display:table id="contact" name="contacts" requestURI="consigneeInfo.action"
                                                                       pagesize="10"
                                                                       class="table table-striped table-hover table-bordered text-center tablesorter contacts"
                                                                       style="margin-top: 15px;">
                                                            <td><display:column property="lastName" title="Last Name <i class='fa fa-sort' />" class="tb-font-black"
                                                                                style="text-align: center;"> </display:column></td>
                                                            <td><display:column property="firstName" title="First Name <i class='fa fa-sort' />" class="tb-font-black"
                                                                                style="text-align: center;"> </display:column></td>
                                                            <td><display:column property="middleName" title="Middle Name <i class='fa fa-sort' />" class="tb-font-black"
                                                                                style="text-align: center;"> </display:column></td>
                                                            <td><display:column property="phone" title="Phone <i class='fa fa-sort' />" class="tb-font-black"
                                                                                style="text-align: center;"> </display:column></td>
                                                            <td><display:column property="mobile" title="Mobile <i class='fa fa-sort' />" class="tb-font-black"
                                                                                style="text-align: center;"> </display:column></td>
                                                            <td><display:column property="fax" title="Fax <i class='fa fa-sort' />" class="tb-font-black"
                                                                                style="text-align: center;"> </display:column></td>
                                                            <td><display:column property="email" title="Email Address <i class='fa fa-sort' />" class="tb-font-black col-md-2"
                                                                                style="text-align: center;"> </display:column></td>
                                                            <td class="tb-font-black" style="text-align: center;">
                                                                <display:column title="Actions">
                                                                    <s:url var="editConsigneeContactUrl" action="loadEditConsigneeContact">
                                                                        <s:param name="consigneeContactCodeParam" value="#attr.contact.contactId"></s:param>
                                                                        <s:param name="contactCodeParam" value="contactCodeParam"> </s:param>
                                                                        <s:param name="addressIdParam" value="addressIdParam"> </s:param>
                                                                    </s:url>
                                                                    <s:a class="icon-action-link" href="%{editConsigneeContactUrl}" rel="tooltip"
                                                                         title="Edit this contact person">
                                                                        <i class="fa fa-pencil"></i>
                                                                    </s:a>

                                                                    <s:url var="deleteConsigneeContactUrl" action="deleteConsigneeContact">
                                                                        <s:param name="consigneeContactCodeParam" value="#attr.contact.contactId"></s:param>
                                                                        <s:param name="contactCodeParam" value="contactCodeParam"> </s:param>
                                                                        <s:param name="addressIdParam" value="addressIdParam"> </s:param>
                                                                    </s:url>
                                                                    <s:a class="icon-action-link" href="%{deleteConsigneeContactUrl}" rel="tooltip"
                                                                         title="Delete this Contact Person"
                                                                         onclick="return confirm('Do you really want to delete?');">

                                                                    </s:a>

                                                                    <i class="fa fa-trash-o deleteCustomerConsigneeContactIcon" ></i>
                                                                </display:column>
                                                            </td>
                                                        </display:table>
                                                    </tr>
                                                </table>
                                            </tbody>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%--<div class="panel-footer">

                                <span class="pull-right">
                                    <s:url var="loadConsigneeAddContactUrl" action="loadConsigneeAddContact">
                                        <s:param name="contactCodeParam" value="contactCodeParam"> </s:param>
                                        <s:param name="addressIdParam" value="addressIdParam"> </s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{loadConsigneeAddContactUrl}" rel="tooltip" title="Add Contact">
                                        <button type="button" class="btn btn-primary">
                                            <i class="fa fa-group"> </i> New Contact Person
                                        </button>
                                    </s:a>
                                </span>
                                <div class="table-responsive" >
                                    <div class="col-lg-12" style="position:relative;margin-top: -28px;">
                                        <table class="col-lg-6">
                                            <tr>
                                                <td><label>Legend:</label></td>
                                                <td><i class="fa fa-pencil"></i> Edit</td>
                                                <td><i class="fa fa-trash-o"></i> Delete</td>
                                                <td><i class="fa fa-info-circle"></i> Information</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>--%>

                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>

    <%--<div class="col-lg-3 col-lg-offset-2">
        <div class="panel panel-primary">

            <ul class="nav nav-pills nav-stacked">
           	   <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                <li><a href="customerInfo"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewCustomerContacts"><i class="fa fa-group fa-fw"></i> Contacts</a></li>
                <li><a href="viewItem"><i class="fa fa-list-ol fa-fw"></i> Items</a></li>
                </sec:authorize>
                
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER',  'ROLE_DOC_SPECIALIST', 'ROLE_FINANCE')">
                <li><a href="viewRates"><i class="fa fa-money fa-fw"></i> Rates</a></li>
                </sec:authorize>
                
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                <li class="active"><a href="viewConsignees"><i class="fa fa-list fa-fw"></i> Consignee List</a></li>
                </sec:authorize>
            </ul>
        </div>
    </div>--%>

</div>

<div class="modal fade" id="deleteCustomerConsigneeContactIcon" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <span style="font-size: 1.4em;"><i class="fa fa-warning" style="color: red;"></i> Delete Customer Consignee</span>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this customer consignee contact ?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">No</button>
                <a href="" class="btn btn-danger confirmDeleteModalBtn">Yes</a>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){
        actionConfirmation($('.deleteCustomerConsigneeContactIcon'), $('.confirmDeleteModalBtn'), $('#deleteCustomerConsigneeContactIcon'));
    });
</script>