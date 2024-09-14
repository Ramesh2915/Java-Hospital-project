package com.sonix.admindashboard.util;

public enum Shift {
	   	MORNING("08:00 AM - 12:00 PM"),
	    AFTERNOON("12:00 PM - 04:00 PM"),
	    EVENING("04:00 PM - 08:00 PM"),
	    NIGHT("08:00 PM - 12:00 AM"),
	    GENERAL("10:00 AM - 05:00 PM");
    private String timing;

    Shift(String timing) {
        this.timing = timing;
    }

    public String getTiming() {
        return timing;
    }
}
