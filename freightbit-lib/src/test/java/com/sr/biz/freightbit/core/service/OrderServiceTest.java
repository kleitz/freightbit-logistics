package com.sr.biz.freightbit.core.service;

/**
 * Created by JMXPSX on 5/27/14.
 */
import com.sr.biz.freightbit.core.entity.User;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.MockitoAnnotations.Mock;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sr.biz.freightbit.core.dao.OrderDao;
import com.sr.biz.freightbit.core.entity.Orders;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.exceptions.OrderAlreadyExistsException;
import com.sr.biz.freightbit.core.service.impl.OrderServiceImpl;


@ContextConfiguration(locations = {"classpath:/conf/applicationContext-lib.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class OrderServiceTest {

    @Mock
    private OrderDao orderDao;

    @InjectMocks
    private OrderServiceImpl orderService;

    @Before
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }

    @Test(expected=OrderAlreadyExistsException.class)
    public void testAddExistingOrder() {
        Orders orders = initOrder();
        List<Orders> existingOrderList = new ArrayList<>();
        existingOrderList.add(orders);

        Mockito.when(orderDao.findOrdersByOrderNumber(213)).thenReturn(existingOrderList);
        orderService.addOrder(orders);
    }

    @Test
    public void testFindAllOrdersByClientId() {
        Integer clientId = 1;
        List <Orders> orders = new ArrayList();
        orders.add(initOrder());

        Mockito.when(orderDao.findAllOrdersByClientId(clientId)).thenReturn(orders);
        List<Orders> results = orderService.findAllOrdersByClientId(clientId);
        Assert.assertEquals(orders.size(), 1);

    }

    @Test
    public void testFindAllOrders() {
        Integer clientId = 1;
        List <Orders> orders = new ArrayList();
        orders.add(initOrder());

    }


    private Orders initOrder() {
        Client client = new Client("Ernest", new Date(), "JMX", new Date(), "JMX");

        Orders orders = new Orders();
        orders.setClient(client);
        orders.setOrderNumber(213);
        orders.setServiceType("FCL");
        orders.setServiceMode("D/D");
        orders.setNotificationType("SMS");
        orders.setPaymentMode("on hand");
        orders.setQuantity(1);
        orders.setSize("Large");
        orders.setClassification("A");
        orders.setEstimatedWeight(2.0f);
        orders.setDeclaredValue(15.0f);
        orders.setCommodity("boxes");
        orders.setComments("fragile");
        orders.setRate(4.0f);
        orders.setOrderStatus("Ready");
        orders.setVendorCode("AAA");
        orders.setTruckCode("AXY");
        orders.setTrailerCode("LLL");
        orders.setDriverCode("AADF");
        orders.setVesselNumber("saeujtyh");
        orders.setAccountRep("haeghaeg");


        return orders;

    }
}
