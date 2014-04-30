package net.eyelock.sakila.helpers;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import flexjson.transformer.AbstractTransformer;

public class FlexJsonDateTransformer extends AbstractTransformer {

    @Override
    public void transform(Object object) {
	Calendar calender = (Calendar) object;
	String formattedString = "";

	if (calender != null) {
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
	    formattedString = sdf.format(calender.getTime());
	}

	getContext().writeQuoted(formattedString);
    }
}
