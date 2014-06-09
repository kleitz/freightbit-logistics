package com.sr.biz.freightbit.common.dao;

import com.sr.biz.freightbit.common.entity.Contacts;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 5/26/14.
 */
public interface ContactsDao {

    public void addContact(Contacts contacts);

    public void deleteContact(Contacts contacts);

    public void updateContact(Contacts contacts);

    public List<Contacts> findAllContacts(long clientId);

    public Contacts findContactById(long id);

//    public List<Contacts> findAllContactsByClientId(long clientId);

    public Contacts findContactByReferenceTableAndId(String referenceTable, Integer referenceID);
    
    public Contacts  findContactByRefTableAndIdAndType(String referenceTable, Integer referenceId, String contactType);
}