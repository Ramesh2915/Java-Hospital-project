package com.sonix.admindashboard.serviceImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.sonix.admindashboard.entity.Shift;
import com.sonix.admindashboard.entity.Slot;
import com.sonix.admindashboard.exception.ShiftException;
import com.sonix.admindashboard.exception.SlotException;
import com.sonix.admindashboard.repo.DBHandler;
import com.sonix.admindashboard.service.SlotService;

public class SlotServiceImpl implements SlotService {
	private Session session;
	Transaction transaction;

	@Override
	public List<Slot> getAllSlot() throws SlotException {
			session = DBHandler.getSession();
			Query query = session.getNamedQuery("getAllSlot");
			@SuppressWarnings("unchecked")
			List<Slot> slot = query.list();
			if(slot==null) {
				throw new SlotException("Slot is empty");
			}
			return slot;
	}
	@Override
	public Slot getSlotById(int slotId) throws SlotException {
		session = DBHandler.getSession();
		Slot slot = (Slot)session.get(Slot.class, slotId);
		if(slot==null) {
			throw new ShiftException("No Slot data");
		}
		return slot;
	}
	
	@Override
    public List<Slot> getSlots(int pageNumber, int pageSize) throws SlotException {
        Session session = DBHandler.getSession();
        List<Slot> slots = null;
        try {
            Query query = session.createQuery("from Slot");
            query.setFirstResult((pageNumber - 1) * pageSize);
            query.setMaxResults(pageSize);
            slots = query.list();
        } catch (Exception e) {
            throw new SlotException("Unable to fetch slots");
        } finally {
            session.close();
        }
        return slots;
    }

    @Override
    public int getTotalSlots() throws SlotException {
        Session session = DBHandler.getSession();
        int totalSlots = 0;
        try {
            Query query = session.createQuery("select count(*) from Slot");
            totalSlots = ((Long) query.uniqueResult()).intValue();
        } catch (Exception e) {
            throw new SlotException("Unable to fetch total slots");
        } finally {
            session.close();
        }
        return totalSlots;
    }
}