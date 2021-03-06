<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-building-o"></i> Vendor Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Vendor</li>
            <li class="active"><a href="<s:url action='viewVendors' />"> Vendor List</a></li>
            <li class="active"><a href="<s:url action='viewInfoVendor' />"> Vendor
                Profile</a></li>
            <li class="active"><a href="<s:url action='viewDrivers' />"> Drivers</a></li>
            <li class="active"> Edit Driver</li>
        </ol>

    </div>
</div>

<%--start--%>
<div class="row">

    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;"><i class="fa fa-info-circle"></i> Vendor Trucking Profile</h3>

            </div>

            <div class="panel-body">

                <s:hidden value="%{vendor.vendorId}"></s:hidden>
                <div class="row">

                    <div class=" col-lg-6 col-lg-offset-3">

                        <div class="panel panel-info ">

                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="col-lg-3">
                                        <div align="center" style="margin-top: 10px;">
                                            <div align="center" style="margin-top: 10px;">
                                                <img alt="User Pic" src="../includes/images/photo.png" class="img-circle">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-9">

                                        <table class="table table-user-information profile" style="margin-top: 10px;">
                                            <tbody>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important; border-top: none;">Company Name</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="vendor.vendorName"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Company Code</td>
                                                <td><s:property value="vendor.vendorCode"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Type</td>
                                                <td><s:property value="vendor.vendorType"/></td>
                                            </tr>

                                            <tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Classification</td>
                                                <td><s:property value="vendor.vendorClass"/></td>
                                            </tr>

                                            </tbody>
                                        </table>

                                    </div>

                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Edit Driver</h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form cssClass="form-horizontal" action="editDriver" theme="bootstrap">
                        <s:hidden name="driver.driverId" value="%{driver.driverId}"/>
                        <s:hidden name="driver.createdTimeStamp" value="%{driver.createdTimeStamp}" />
                        <s:hidden name="driver.createdBy" value="%{driver.createdBy}" />

                        <div class="form-group">

                            <label class="col-lg-2 control-label" style="padding-top:0px;">License<span class="asterisk_red"></span></label>

                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control"
                                             name="driver.licenseNumber" id="driver_licenseNumber" required="true" maxLength="13" pattern="^(\s*[\#a-zA-Z0-9\.\,\-\&]+(([\'\-\+\s]\s*[a-zA-Z0-9])?[a-zA-Z0-9\.\,\-\&\#]*)\s*)+$"
                                             title="Example:Must be Alphanumeric characters" onkeyup="this.value=this.value.toUpperCase();" />
                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-lg-2 control-label" style="padding-top:0px;">Last Name<span class="asterisk_red"></span></label>

                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" placeholder="Last Name" name="driver.lastName"
                                             id="driver.lastName" required="true" pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$"
                                             title="Last Name should not contain special characters and/or numbers." maxlength="30"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-lg-2 control-label" style="padding-top:0px;">First Name<span class="asterisk_red"></span></label>

                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" placeholder="First Name" name="driver.firstName"
                                             id="driver.firstName" required="true" pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$"
                                             title="First Name should not contain special characters and/or numbers." maxlength="30"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-lg-2 control-label" style="padding-top:0px;">Middle Name</label>

                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" placeholder="Middle Name" name="driver.middleName"
                                             id="driver.middleName" pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$"
                                             title="Middle Name should not contain special characters and/or numbers." maxlength="30"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-lg-2 control-label" style="padding-top:0px;">Title<span class="asterisk_red"></span></label>

                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" placeholder="Title" name="driver.title"
                                             id="driver.title" maxLength="30" pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$"
                                             title="Title should not contain special characters and/or numbers." required="true"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-lg-2 control-label" style="padding-top:0px;">Status</label>

                            <div class="col-lg-10">
                                <s:select list="statusList" listKey="key" listValue="value" name="driver.status"
                                          cssClass="form-control"/>
                            </div>

                        </div>

                </div>
            </div>

            <div class="panel-footer">
                <div class="pull-right">
                    <a href="viewDrivers" class="btn btn-danger" id ="groups-btn">Cancel</a>

                    <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                </div>
            </div>
            </s:form>

        </div>
    </div>

</div>

<script type="text/javascript">
    $(document).ready(function(){
         /* $("#driver_licenseNumber").mask("A99-99-9999999");*/

    });
</script>