package com.sonix.admindashboard.service;

import java.util.List;

import com.sonix.admindashboard.entity.Slot;
import com.sonix.admindashboard.exception.SlotException;

public interface SlotService {
	
	public List<Slot>  getAllSlot() throws SlotException;
	public Slot getSlotById(int slotId) throws SlotException;
	List<Slot> getSlots(int pageNumber, int pageSize) throws SlotException;
    int getTotalSlots() throws SlotException;

}