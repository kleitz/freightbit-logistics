package com.sr.apps.freightbit.order.formbean;

import java.util.Date;

public class OrderItemsBean {

    private Integer orderItemId;
    private Integer orderId;
    private Integer quantity;
    private String classification;
    private String description;
    private Double declaredValue;
    private Double weight;
    private Integer weightInt;
    private String remarks;
    private Float rate;
    private Date createdTimestamp;
    private String createdBy;
    private Date modifiedTimestamp;
    private String modifiedBy;
    private String nameSize;
    private String status;
    private String shipmentStatus;
    private Float volume;
    private Integer volumeInt;
    private Integer clientId;
    private String commodity;
    private String comments;
    private String vendorSea;
    private String vendorOrigin;
    private String vendorOriginName;
    private String vendorDestination;
    private String vendorDestinationName;
    private String vesselName;
    private String finalPickupDate;
    private String finalDeliveryDate;
    private String driverOrigin;
    private String driverDestination;
    private String truckOrigin;
    private String truckDestination;
    private String vesselScheduleId;
    private String orderNum;
    private String editItem;
    private String port;
    private String serviceRequirement;
    private String vendorName;
    private String voyageNumber;
    private String departureDate;
    private String arrivalDate;
    private String plateNumberOri;
    private String plateNumberDes;
    private Integer containerId;
    private String containerNumber;
    private String sealNumber;
    private String bulletSeal;
    private String shippingSeal;
    private String containerSize; // for container module display purpose
    private String itemCode;
    private Double length;
    private Double width;
    private Double height;
    private String itemName;
    private String originPort;
    private String destinationPort;

    public OrderItemsBean(){

    }

    public OrderItemsBean(Float rate, Integer orderItemId, Integer orderId, Integer quantity, String classification, String description, Double declaredValue, Double weight, Integer weightInt, String remarks, Date createdTimestamp, String createdBy, Date modifiedTimestamp, String modifiedBy, String nameSize, String status, String shipmentStatus, Float volume, Integer volumeInt, Integer clientId, String commodity, String comments, String vendorSea, String vendorOrigin, String vendorOriginName, String vendorDestination, String vendorDestinationName, String vesselName, String finalPickupDate, String finalDeliveryDate, String driverOrigin, String driverDestination, String truckOrigin, String truckDestination, String vesselScheduleId, String orderNum, String editItem, String port, String serviceRequirement, String vendorName, String voyageNumber, String departureDate, String arrivalDate, String plateNumberOri, String plateNumberDes, Integer containerId, String containerNumber, String sealNumber, String bulletSeal, String shippingSeal, String containerSize, String itemCode, Double length, Double width, Double height, String itemName, String originPort, String destinationPort) {
        this.rate = rate;
        this.orderItemId = orderItemId;
        this.orderId = orderId;
        this.quantity = quantity;
        this.classification = classification;
        this.description = description;
        this.declaredValue = declaredValue;
        this.weight = weight;
        this.weightInt = weightInt;
        this.remarks = remarks;
        this.createdTimestamp = createdTimestamp;
        this.createdBy = createdBy;
        this.modifiedTimestamp = modifiedTimestamp;
        this.modifiedBy = modifiedBy;
        this.nameSize = nameSize;
        this.status = status;
        this.shipmentStatus = shipmentStatus;
        this.volume = volume;
        this.volumeInt = volumeInt;
        this.clientId = clientId;
        this.commodity = commodity;
        this.comments = comments;
        this.vendorSea = vendorSea;
        this.vendorOrigin = vendorOrigin;
        this.vendorOriginName = vendorOriginName;
        this.vendorDestination = vendorDestination;
        this.vendorDestinationName = vendorDestinationName;
        this.vesselName = vesselName;
        this.finalPickupDate = finalPickupDate;
        this.finalDeliveryDate = finalDeliveryDate;
        this.driverOrigin = driverOrigin;
        this.driverDestination = driverDestination;
        this.truckOrigin = truckOrigin;
        this.truckDestination = truckDestination;
        this.vesselScheduleId = vesselScheduleId;
        this.orderNum = orderNum;
        this.editItem = editItem;
        this.port = port;
        this.serviceRequirement = serviceRequirement;
        this.vendorName = vendorName;
        this.voyageNumber = voyageNumber;
        this.departureDate = departureDate;
        this.arrivalDate = arrivalDate;
        this.plateNumberOri = plateNumberOri;
        this.plateNumberDes = plateNumberDes;
        this.containerId = containerId;
        this.containerNumber = containerNumber;
        this.sealNumber = sealNumber;
        this.bulletSeal = bulletSeal;
        this.shippingSeal = shippingSeal;
        this.containerSize = containerSize;
        this.itemCode = itemCode;
        this.length = length;
        this.width = width;
        this.height = height;
        this.itemName = itemName;
        this.originPort = originPort;
        this.destinationPort = destinationPort;
    }

    public String getVendorSea() {
        return vendorSea;
    }

    public void setVendorSea(String vendorSea) {
        this.vendorSea = vendorSea;
    }

    public String getVesselName() {
        return vesselName;
    }

    public void setVesselName(String vesselName) {
        this.vesselName = vesselName;
    }

    public String getVendorOrigin() {
        return vendorOrigin;
    }

    public void setVendorOrigin(String vendorOrigin) {
        this.vendorOrigin = vendorOrigin;
    }

    public String getFinalPickupDate() {
        return finalPickupDate;
    }

    public void setFinalPickupDate(String finalPickupDate) {
        this.finalPickupDate = finalPickupDate;
    }

    public String getComments() {
        return comments/*.replaceAll("\n","\n")*/;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getCommodity() {
        return commodity;
    }

    public void setCommodity(String commodity) {
        this.commodity = commodity;
    }

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    public Float getRate() {
        return rate;
    }

    public void setRate(Float rate) {
        this.rate = rate;
    }

    public Integer getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(Integer orderItemId) {
        this.orderItemId = orderItemId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getClassification() {
        return classification;
    }

    public void setClassification(String classification) {
        this.classification = classification;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getDeclaredValue() {
        return declaredValue;
    }

    public void setDeclaredValue(Double declaredValue) {
        this.declaredValue = declaredValue;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Date getCreatedTimestamp() {
        return createdTimestamp;
    }

    public void setCreatedTimestamp(Date createdTimestamp) {
        this.createdTimestamp = createdTimestamp;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getModifiedTimestamp() {
        return modifiedTimestamp;
    }

    public void setModifiedTimestamp(Date modifiedTimestamp) {
        this.modifiedTimestamp = modifiedTimestamp;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public String getNameSize() {
        return nameSize;
    }

    public void setNameSize(String nameSize) {
        this.nameSize = nameSize;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Float getVolume() {
        return volume;
    }

    public void setVolume(Float volume) {
        this.volume = volume;
    }

    public String getDriverOrigin() {
        return driverOrigin;
    }

    public void setDriverOrigin(String driverOrigin) {
        this.driverOrigin = driverOrigin;
    }

    public String getDriverDestination() {
        return driverDestination;
    }

    public void setDriverDestination(String driverDestination) {
        this.driverDestination = driverDestination;
    }

    public String getTruckOrigin() {
        return truckOrigin;
    }

    public void setTruckOrigin(String truckOrigin) {
        this.truckOrigin = truckOrigin;
    }

    public String getTruckDestination() {
        return truckDestination;
    }

    public void setTruckDestination(String truckDestination) {
        this.truckDestination = truckDestination;
    }

    public String getVendorDestination() {
        return vendorDestination;
    }

    public void setVendorDestination(String vendorDestination) {
        this.vendorDestination = vendorDestination;
    }

    public String getVesselScheduleId() {
        return vesselScheduleId;
    }

    public void setVesselScheduleId(String vesselScheduleId) {
        this.vesselScheduleId = vesselScheduleId;
    }

    public String getFinalDeliveryDate() {
        return finalDeliveryDate;
    }

    public void setFinalDeliveryDate(String finalDeliveryDate) {
        this.finalDeliveryDate = finalDeliveryDate;
    }

    public String getEditItem() {
        return editItem;
    }

    public void setEditItem(String editItem) {
        this.editItem = editItem;
    }

    public String getServiceRequirement() {
        return serviceRequirement;
    }

    public void setServiceRequirement(String serviceRequirement) {
        this.serviceRequirement = serviceRequirement;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getShipmentStatus() {
        return shipmentStatus;
    }

    public void setShipmentStatus(String shipmentStatus) {
        this.shipmentStatus = shipmentStatus;
    }

    public String getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(String arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    public String getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(String departureDate) {
        this.departureDate = departureDate;
    }

    public String getVoyageNumber() {
        return voyageNumber;
    }

    public void setVoyageNumber(String voyageNumber) {
        this.voyageNumber = voyageNumber;
    }

    public String getVendorName() {
        return vendorName;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }

    public String getVendorOriginName() {
        return vendorOriginName;
    }

    public void setVendorOriginName(String vendorOriginName) {
        this.vendorOriginName = vendorOriginName;
    }

    public String getVendorDestinationName() {
        return vendorDestinationName;
    }

    public void setVendorDestinationName(String vendorDestinationName) {
        this.vendorDestinationName = vendorDestinationName;
    }

    public String getPlateNumberOri() {
        return plateNumberOri;
    }

    public void setPlateNumberOri(String plateNumberOri) {
        this.plateNumberOri = plateNumberOri;
    }

    public String getPlateNumberDes() {
        return plateNumberDes;
    }

    public void setPlateNumberDes(String plateNumberDes) {
        this.plateNumberDes = plateNumberDes;
    }

    public Integer getContainerId() {
        return containerId;
    }

    public void setContainerId(Integer containerId) {
        this.containerId = containerId;
    }

    public String getContainerNumber() {
        return containerNumber;
    }

    public void setContainerNumber(String containerNumber) {
        this.containerNumber = containerNumber;
    }

    public String getSealNumber() {
        return sealNumber;
    }

    public void setSealNumber(String sealNumber) {
        this.sealNumber = sealNumber;
    }

    public String getBulletSeal() {
        return bulletSeal;
    }

    public void setBulletSeal(String bulletSeal) {
        this.bulletSeal = bulletSeal;
    }

    public String getShippingSeal() {
        return shippingSeal;
    }

    public void setShippingSeal(String shippingSeal) {
        this.shippingSeal = shippingSeal;
    }

    public String getContainerSize() {
        return containerSize;
    }

    public void setContainerSize(String containerSize) {
        this.containerSize = containerSize;
    }

    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    public Double getLength() {
        return length;
    }

    public void setLength(Double length) {
        this.length = length;
    }

    public Double getWidth() {
        return width;
    }

    public void setWidth(Double width) {
        this.width = width;
    }

    public Double getHeight() {
        return height;
    }

    public void setHeight(Double height) {
        this.height = height;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getDestinationPort() {
        return destinationPort;
    }

    public void setDestinationPort(String destinationPort) {
        this.destinationPort = destinationPort;
    }

    public String getOriginPort() {
        return originPort;
    }

    public void setOriginPort(String originPort) {
        this.originPort = originPort;
    }

    public Integer getWeightInt() {
        return weightInt;
    }

    public void setWeightInt(Integer weightInt) {
        this.weightInt = weightInt;
    }

    public Integer getVolumeInt() {
        return volumeInt;
    }

    public void setVolumeInt(Integer volumeInt) {
        this.volumeInt = volumeInt;
    }
}