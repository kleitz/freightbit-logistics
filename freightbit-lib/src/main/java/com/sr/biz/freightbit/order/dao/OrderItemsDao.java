package com.sr.biz.freightbit.order.dao;

import com.sr.biz.freightbit.order.entity.OrderItems;

import java.util.List;

public interface OrderItemsDao {

    public List<OrderItems> findAllItemByOrderId(Integer orderId);

    public List<OrderItems> findOrderItemByName(String nameSize);

    public void addItems(OrderItems orderItems);

    public void deleteItem(OrderItems orderItems);

    public OrderItems findOrderItemByOrderItemId(Integer orderItemId);

    public OrderItems findOrderItemByCode(String nameSize);

    public List<OrderItems> findAllOrderItemLCL();

    public List<OrderItems> findAllOrderItemsByContainerId(Integer containerId);

}
