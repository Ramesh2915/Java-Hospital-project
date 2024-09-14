package com.sonix.admindashboard;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.sonix.admindashboard.entity.Slot;
import com.sonix.admindashboard.repo.DBHandler;
import com.sonix.admindashboard.util.SlotName;
import com.sonix.admindashboard.util.SlotTiming;

public class SlotTest {
public static void main(String[] args) {
	Session session = DBHandler.getSession();
	Transaction transaction = session.beginTransaction();
	
	Slot slot1 = new Slot();
	slot1.setSlotName(SlotName.MORNING);
	slot1.setSlotTiming(SlotTiming.EIGHT_AM.getTiming());
	session.save(slot1);

    Slot slot2 = new Slot();
    slot2.setSlotName(SlotName.MORNING);
    slot2.setSlotTiming(SlotTiming.EIGHT_THIRTY_AM.getTiming());
    session.save(slot2);

    Slot slot3 = new Slot();
    slot3.setSlotName(SlotName.MORNING);
    slot3.setSlotTiming(SlotTiming.NINE_AM.getTiming());
    session.save(slot3);

    Slot slot4 = new Slot();
    slot4.setSlotName(SlotName.MORNING);
    slot4.setSlotTiming(SlotTiming.NINE_THIRTY_AM.getTiming());
    session.save(slot4);

    Slot slot5 = new Slot();
    slot5.setSlotName(SlotName.MORNING);
    slot5.setSlotTiming(SlotTiming.TEN_AM.getTiming());
    session.save(slot5);

    Slot slot6 = new Slot();
    slot6.setSlotName(SlotName.MORNING);
    slot6.setSlotTiming(SlotTiming.TEN_THIRTY_AM.getTiming());
    session.save(slot6);

    Slot slot7 = new Slot();
    slot7.setSlotName(SlotName.MORNING);
    slot7.setSlotTiming(SlotTiming.ELEVEN_AM.getTiming());
    session.save(slot7);

    Slot slot8 = new Slot();
    slot8.setSlotName(SlotName.MORNING);
    slot8.setSlotTiming(SlotTiming.ELEVEN_THIRTY_AM.getTiming());
    session.save(slot8);

    Slot slot9 = new Slot();
    slot9.setSlotName(SlotName.AFTERNOON);
    slot9.setSlotTiming(SlotTiming.TWELE_PM.getTiming());
    session.save(slot9);

    Slot slot10 = new Slot();
    slot10.setSlotName(SlotName.AFTERNOON);
    slot10.setSlotTiming(SlotTiming.TWELE_THIRTY_PM.getTiming());
    session.save(slot10);

    Slot slot11 = new Slot();
    slot11.setSlotName(SlotName.AFTERNOON);
    slot11.setSlotTiming(SlotTiming.ONE_PM.getTiming());
    session.save(slot11);

    Slot slot12 = new Slot();
    slot12.setSlotName(SlotName.AFTERNOON);
    slot12.setSlotTiming(SlotTiming.ONE_THIRTY_PM.getTiming());
    session.save(slot12);

    Slot slot13 = new Slot();
    slot13.setSlotName(SlotName.AFTERNOON);
    slot13.setSlotTiming(SlotTiming.TWO_PM.getTiming());
    session.save(slot13);

    Slot slot14 = new Slot();
    slot14.setSlotName(SlotName.AFTERNOON);
    slot14.setSlotTiming(SlotTiming.TWO_THIRTY_PM.getTiming());
    session.save(slot14);

    Slot slot15 = new Slot();
    slot15.setSlotName(SlotName.AFTERNOON);
    slot15.setSlotTiming(SlotTiming.THREE_PM.getTiming());
    session.save(slot15);

    Slot slot16 = new Slot();
    slot16.setSlotName(SlotName.AFTERNOON);
    slot16.setSlotTiming(SlotTiming.THREE_THIRTY_PM.getTiming());
    session.save(slot16);

    Slot slot17 = new Slot();
    slot17.setSlotName(SlotName.EVENING);
    slot17.setSlotTiming(SlotTiming.FOUR_PM.getTiming());
    session.save(slot17);

    Slot slot18 = new Slot();
    slot18.setSlotName(SlotName.EVENING);
    slot18.setSlotTiming(SlotTiming.FOUR_THIRTY_PM.getTiming());
    session.save(slot18);

    Slot slot19 = new Slot();
    slot19.setSlotName(SlotName.EVENING);
    slot19.setSlotTiming(SlotTiming.FIVE_PM.getTiming());
    session.save(slot19);

    Slot slot20 = new Slot();
    slot20.setSlotName(SlotName.EVENING);
    slot20.setSlotTiming(SlotTiming.FIVE_THIRTY_PM.getTiming());
    session.save(slot20);

    Slot slot21 = new Slot();
    slot21.setSlotName(SlotName.EVENING);
    slot21.setSlotTiming(SlotTiming.SIX_PM.getTiming());
    session.save(slot21);

    Slot slot22 = new Slot();
    slot22.setSlotName(SlotName.EVENING);
    slot22.setSlotTiming(SlotTiming.SIX_THIRTY_PM.getTiming());
    session.save(slot22);

    Slot slot23 = new Slot();
    slot23.setSlotName(SlotName.EVENING);
    slot23.setSlotTiming(SlotTiming.SEVEN_PM.getTiming());
    session.save(slot23);

    Slot slot24 = new Slot();
    slot24.setSlotName(SlotName.EVENING);
    slot24.setSlotTiming(SlotTiming.SEVEN_THIRTY_PM.getTiming());
    session.save(slot24);

    Slot slot25 = new Slot();
    slot25.setSlotName(SlotName.NIGHT);
    slot25.setSlotTiming(SlotTiming.EIGHT_PM.getTiming());
    session.save(slot25);

    Slot slot26 = new Slot();
    slot26.setSlotName(SlotName.NIGHT);
    slot26.setSlotTiming(SlotTiming.EIGHT_THIRTY_PM.getTiming());
    session.save(slot26);

    Slot slot27 = new Slot();
    slot27.setSlotName(SlotName.NIGHT);
    slot27.setSlotTiming(SlotTiming.NINE_PM.getTiming());
    session.save(slot27);

    Slot slot28 = new Slot();
    slot28.setSlotName(SlotName.NIGHT);
    slot28.setSlotTiming(SlotTiming.NINE_THIRTY_PM.getTiming());
    session.save(slot28);

    Slot slot29 = new Slot();
    slot29.setSlotName(SlotName.NIGHT);
    slot29.setSlotTiming(SlotTiming.TEN_PM.getTiming());
    session.save(slot29);

    Slot slot30 = new Slot();
    slot30.setSlotName(SlotName.NIGHT);
    slot30.setSlotTiming(SlotTiming.TEN_THIRTY_PM.getTiming());
    session.save(slot30);

    Slot slot31 = new Slot();
    slot31.setSlotName(SlotName.NIGHT);
    slot31.setSlotTiming(SlotTiming.ELEVEN_PM.getTiming());
    session.save(slot31);

    Slot slot32 = new Slot();
    slot32.setSlotName(SlotName.NIGHT);
    slot32.setSlotTiming(SlotTiming.ELEVEN_THIRTY_PM.getTiming());
    session.save(slot32);
	
	transaction.commit();
}
}
