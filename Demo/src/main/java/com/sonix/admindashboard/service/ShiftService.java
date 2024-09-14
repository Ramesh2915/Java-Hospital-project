package com.sonix.admindashboard.service;

import java.util.List;

import com.sonix.admindashboard.entity.Shift;
import com.sonix.admindashboard.exception.ShiftException;

public interface ShiftService {
	public List<Shift>  getAllShift() throws ShiftException;
	public Shift getShiftById(int shiftId) throws ShiftException;
}
