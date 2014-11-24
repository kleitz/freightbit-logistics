package com.sr.biz.freightbit.documentation.dao;

import com.sr.biz.freightbit.documentation.entity.Documents;
import com.sr.biz.freightbit.order.entity.Orders;

import java.util.List;

public interface DocumentsDao {

    public List<Documents> findDocumentationByCriteria(String column, String value);

    public List<Orders> findAllOrdersDocuments();

    public void addDocuments(Documents documents);

    public List<Documents> findOrderDocumentations();

    public List<Documents> findDocumentsByOrderId(Integer orderId);

    public Documents findDocumentById(Integer documentId);

    public List <Documents> findDuplicateDocumentByDocumentName(String documentName, Integer documentId);

    public void updateDocument(Documents documents);

    public List<Documents> findDocumentByOutboundStageAndID(Integer outboundStage, Integer referenceId);

    public List<Documents> findDocumentByInboundStageAndID(Integer inboundStage, Integer referenceId);

    public List<Documents> findDocumentByFinalOutboundStageAndID(Integer finalOutboundStage, Integer referenceId);

    public List<Documents> findDocumentByFinalInboundStageAndID(Integer finalInboundStage, Integer referenceId);

    public List<Documents> findDocumentByArchiveStageAndID(Integer archiveStage, Integer referenceId);

    public List<Documents> findDocumentByBillingStageAndID(Integer billingStage, Integer referenceId);

    public Documents findDocumentByOrderNoVendorCodeAndName(String referenceNumber, String vendorCode, String documentName);

    public Documents findDocumentByNameAndVendorCode(String documentName, String vendorCode);

    public List<Documents> findDocumentNameAndId(String documentName, Integer orderItemId);

    public void deleteDocument(Documents documents);

    public List<Documents> findEIRAndRefId (String documentName, Integer referenceId, String referenceTable);

}
