package com.sonix.admindashboard.util;

public enum SlotTiming {

	  EIGHT_AM("08:00 AM"),
	  EIGHT_THIRTY_AM("08:30 AM"),
	  NINE_AM("09:00 AM"),
	  NINE_THIRTY_AM("09:30 AM"),
	  TEN_AM("10:00 AM"),
	  TEN_THIRTY_AM("10:30 AM"),
	  ELEVEN_AM("11:00 AM"),
	  ELEVEN_THIRTY_AM("11:30 AM"),
	  TWELE_PM("12:00 PM"),
	  TWELE_THIRTY_PM("12:30 PM"),
	  ONE_PM("13:00 PM"),
	  ONE_THIRTY_PM("13:30 PM"),
	  TWO_PM("14:00 PM"),
	  TWO_THIRTY_PM("14:30 PM"),
	  THREE_PM("15:00 PM"),
	  THREE_THIRTY_PM("15:30 PM"),
	  FOUR_PM("16:00 PM"),
	  FOUR_THIRTY_PM("16:30 PM"),
	  FIVE_PM("17:00 PM"),
	  FIVE_THIRTY_PM("17:30 PM"),
	  SIX_PM("18:00 PM"),
	  SIX_THIRTY_PM("18:30 PM"),
	  SEVEN_PM("19:00 PM"),
	  SEVEN_THIRTY_PM("19:30 PM"),
	  EIGHT_PM("20:00 PM"),
	  EIGHT_THIRTY_PM("20:30 PM"),
	  NINE_PM("21:00 PM"),
	  NINE_THIRTY_PM("21:30 PM"),
	  TEN_PM("22:00 PM"),
	  TEN_THIRTY_PM("22:30 PM"),
	  ELEVEN_PM("23:00 PM"),
	  ELEVEN_THIRTY_PM("23:30 PM"),
	  ;

	  private final String timing;

	  SlotTiming(String timing) {
	    this.timing = timing;
	  }

	  public String getTiming() {
	    return timing;
	  }
	} 
