package com.sr.apps.freightbit.operations.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.operations.formbean.ContainerBean;
import com.sr.apps.freightbit.operations.formbean.OperationsBean;
import com.sr.apps.freightbit.order.formbean.OrderBean;
import com.sr.apps.freightbit.order.formbean.OrderItemsBean;
import com.sr.apps.freightbit.util.CommonUtils;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.operations.entity.Container;
import com.sr.biz.freightbit.operations.service.ContainerService;
import com.sr.biz.freightbit.operations.service.OperationsService;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.service.OrderService;
import com.sr.biz.freightbit.vendor.service.VendorService;
import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ConsolidationAction extends ActionSupport implements Preparable {

	private static final long serialVersionUID = 1L;
	private static final Logger Log = Logger.getLogger(ConsolidationAction.class);

	Map paramMap = new HashMap();

	private String orderNoParam;
	private String editParam;
	private Integer orderIdParam;
	private Integer orderItemIdParam;
	private Integer containerIdParam;
	private Integer nameSizeParam;
	private Integer vendorId;

	private List<OrderBean> orders = new ArrayList<OrderBean>();
    private List<OrderItemsBean> orderItemsBeans = new ArrayList<OrderItemsBean>();
	private List<ContainerBean> orderItems = new ArrayList<ContainerBean>();
	private List<ContainerBean> containers = new ArrayList<ContainerBean>();

	private List<Parameters> statusList = new ArrayList<Parameters>();
	private List<Parameters> updateStatusList = new ArrayList<Parameters>();

	private OrderItemsBean orderItem = new OrderItemsBean();
	private OperationsBean operationsBean = new OperationsBean();
	private OrderBean order = new OrderBean();
	private ContainerBean container = new ContainerBean();

	private OperationsService operationsService;
	private OrderService orderService;
	private ParameterService parameterService;
	private CommonUtils commonUtils;
	private ContainerService containerService;
    private VendorService vendorService;

	@Override
	public void prepare() throws Exception {

    }

	public String updateStatusOfContainers() {

		Map sessionAttributes = ActionContext.getContext().getSession();
		Integer containerId = (Integer) sessionAttributes.get("containerIdParam");

		//shows container id
		Container containerEntity = containerService.findContainerById(containerId);

		//change status to FULL LOAD
		containerEntity.setContainerStatus("FULL LOAD");
		containerService.updateContainer(containerEntity);

		container = transformToContainerFormBean(containerEntity);
		// displays order items under orders
		List<Container> containerList = new ArrayList<Container>();

		containerList = (List<Container>) containerService.findContainerById(containerId);

		for(Container containerItemsLst : containerList) {
			orderItems.add(transformToContainerFormBean(containerItemsLst));
		}
		clearErrorsAndMessages();
		addActionMessage("Success");

		return SUCCESS;
	}

	public ContainerBean transformToContainerFormBean(Container entity) {

		ContainerBean formBean = new ContainerBean();
		formBean.setOrderNumber(entity.getOrderNumber());

		return formBean;
	}

    public String viewConsolidationContainerList() {
        List<Container> containerList = new ArrayList<Container>();
        containerList = containerService.findAllContainer();

        for (Container containerElem : containerList) {
            containers.add(transformContainerToFormBean(containerElem));
        }
        return SUCCESS;
    }

    public String viewConsolidationItemList() {
        List<OrderItems> orderItems = new ArrayList<OrderItems>();
        orderItems = orderService.findAllOrderItemLCL();

        for (OrderItems orderItemElem : orderItems) {
            orderItemsBeans.add(transformToOrderItemFormBean(orderItemElem));
            System.out.println(orderItemElem.getNameSize());
        }
        return SUCCESS;
    }

    public OrderItemsBean transformToOrderItemFormBean(OrderItems entity) {
        OrderItemsBean formBean = new OrderItemsBean();
        formBean.setNameSize(entity.getNameSize());
        formBean.setStatus(entity.getStatus());
        formBean.setOrderItemId(entity.getOrderItemId());
        formBean.setClientId(entity.getClientId());
        formBean.setNameSize(entity.getNameSize());
        formBean.setOrderId(entity.getOrderId());
        formBean.setQuantity(entity.getQuantity());
        formBean.setClassification(entity.getClassification());
        formBean.setCommodity(entity.getCommodity());
        formBean.setDeclaredValue(entity.getDeclaredValue());
        formBean.setComments(entity.getComments());
        formBean.setRate(entity.getRate());
        formBean.setCreatedTimeStamp(entity.getCreatedTimestamp());
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setModifiedBy(entity.getModifiedBy());
        formBean.setModifiedTimeStamp(entity.getModifiedTimestamp());
        formBean.setStatus(entity.getStatus());
        formBean.setWeight(entity.getWeight());
        formBean.setVendorSea(entity.getVendorSea());
        formBean.setVendorOrigin(entity.getVendorOrigin());
        formBean.setVendorDestination(entity.getVendorDestination());
        /*formBean.setVendorSea(entity.getVendorSea());*/
        formBean.setOrderNum(orderService.findOrdersById(entity.getOrderId()).getOrderNumber());
        formBean.setPort(orderService.findOrdersById(entity.getOrderId()).getDestinationPort());

        if (entity.getVesselScheduleId() == null || "".equals(entity.getVesselScheduleId())) {
            formBean.setVesselScheduleId("");
        } else {
            formBean.setVesselScheduleId(entity.getVesselScheduleId());
        }

        formBean.setFinalPickupDate(entity.getFinalPickupDate());
        formBean.setFinalDeliveryDate(entity.getFinalDeliveryDate());
        formBean.setDriverOrigin(entity.getDriverOrigin());
        formBean.setDriverDestination(entity.getDriverDestination());
        formBean.setTruckOrigin(entity.getTruckOrigin());
        formBean.setTruckDestination(entity.getTruckDestination());

        return formBean;
    }

    public ContainerBean transformContainerToFormBean(Container entity) {
        ContainerBean formBean = new ContainerBean();

        formBean.setContainerId(entity.getContainerId());
        formBean.setEirNumber(entity.getEirNumber());
        formBean.setDateTime(entity.getDateTime());
        formBean.setShipping(entity.getShipping());
        formBean.setTrucking(entity.getTrucking());
        formBean.setPlateNumber(entity.getPlateNumber());
        formBean.setVanNumber(entity.getVanNumber());
        formBean.setDriver(entity.getDriver());
        formBean.setOrderNumber(entity.getOrderNumber());
        formBean.setRemarks(entity.getRemarks());
        formBean.setVanTo(entity.getVanTo());
        formBean.setVanFrom(entity.getVanFrom());
        formBean.setContainerNumber(entity.getContainerNumber());
        formBean.setContainerSize(entity.getContainerSize());
        formBean.setContainerType(entity.getContainerType());
        formBean.setEirNumber2(entity.getEirNumber2());
        formBean.setSealNumber(entity.getSealNumber());
        formBean.setVanLocation(entity.getVanLocation());
        formBean.setLadenEmpty(entity.getLadenEmpty());

        return formBean;
    }

    private Integer getClientId() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer clientId = (Integer) sessionAttributes.get("clientId");
        return clientId;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public static Logger getLog() {
        return Log;
    }

    public Map getParamMap() {
        return paramMap;
    }

    public void setParamMap(Map paramMap) {
        this.paramMap = paramMap;
    }

    public String getOrderNoParam() {
        return orderNoParam;
    }

    public void setOrderNoParam(String orderNoParam) {
        this.orderNoParam = orderNoParam;
    }

    public String getEditParam() {
        return editParam;
    }

    public void setEditParam(String editParam) {
        this.editParam = editParam;
    }

    public Integer getOrderIdParam() {
        return orderIdParam;
    }

    public void setOrderIdParam(Integer orderIdParam) {
        this.orderIdParam = orderIdParam;
    }

    public Integer getOrderItemIdParam() {
        return orderItemIdParam;
    }

    public void setOrderItemIdParam(Integer orderItemIdParam) {
        this.orderItemIdParam = orderItemIdParam;
    }

    public Integer getContainerIdParam() {
        return containerIdParam;
    }

    public void setContainerIdParam(Integer containerIdParam) {
        this.containerIdParam = containerIdParam;
    }

    public Integer getNameSizeParam() {
        return nameSizeParam;
    }

    public void setNameSizeParam(Integer nameSizeParam) {
        this.nameSizeParam = nameSizeParam;
    }

    public Integer getVendorId() {
        return vendorId;
    }

    public void setVendorId(Integer vendorId) {
        this.vendorId = vendorId;
    }

    public List<OrderBean> getOrders() {
        return orders;
    }

    public void setOrders(List<OrderBean> orders) {
        this.orders = orders;
    }

    public List<ContainerBean> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<ContainerBean> orderItems) {
        this.orderItems = orderItems;
    }

    public List<ContainerBean> getContainers() {
        return containers;
    }

    public void setContainers(List<ContainerBean> containers) {
        this.containers = containers;
    }

    public List<Parameters> getStatusList() {
        return statusList;
    }

    public void setStatusList(List<Parameters> statusList) {
        this.statusList = statusList;
    }

    public List<Parameters> getUpdateStatusList() {
        return updateStatusList;
    }

    public void setUpdateStatusList(List<Parameters> updateStatusList) {
        this.updateStatusList = updateStatusList;
    }

    public OrderItemsBean getOrderItem() {
        return orderItem;
    }

    public void setOrderItem(OrderItemsBean orderItem) {
        this.orderItem = orderItem;
    }

    public OperationsBean getOperationsBean() {
        return operationsBean;
    }

    public void setOperationsBean(OperationsBean operationsBean) {
        this.operationsBean = operationsBean;
    }

    public OrderBean getOrder() {
        return order;
    }

    public void setOrder(OrderBean order) {
        this.order = order;
    }

    public ContainerBean getContainer() {
        return container;
    }

    public void setContainer(ContainerBean container) {
        this.container = container;
    }

    public OperationsService getOperationsService() {
        return operationsService;
    }

    public void setOperationsService(OperationsService operationsService) {
        this.operationsService = operationsService;
    }

    public OrderService getOrderService() {
        return orderService;
    }

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    public ParameterService getParameterService() {
        return parameterService;
    }

    public void setParameterService(ParameterService parameterService) {
        this.parameterService = parameterService;
    }

    public CommonUtils getCommonUtils() {
        return commonUtils;
    }

    public void setCommonUtils(CommonUtils commonUtils) {
        this.commonUtils = commonUtils;
    }

    public ContainerService getContainerService() {
        return containerService;
    }

    public void setContainerService(ContainerService containerService) {
        this.containerService = containerService;
    }

    public void setVendorService(VendorService vendorService) {
        this.vendorService = vendorService;
    }

    public List<OrderItemsBean> getOrderItemsBeans() {
        return orderItemsBeans;
    }

    public void setOrderItemsBeans(List<OrderItemsBean> orderItemsBeans) {
        this.orderItemsBeans = orderItemsBeans;
    }

    public VendorService getVendorService() {
        return vendorService;
    }
}