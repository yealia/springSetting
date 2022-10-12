package org.zerock.spring1.controller.converter;



import org.springframework.core.convert.converter.Converter;

import javax.swing.text.DateFormatter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;


public class LocalDateConverter implements Converter<String, LocalDate> {

    @Override
    public LocalDate convert(String source) {

        return LocalDate.parse(source, DateTimeFormatter.ISO_DATE);
    }
}
