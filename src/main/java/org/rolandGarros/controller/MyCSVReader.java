package org.rolandGarros.controller;

import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.opencsv.CSVParser;
import com.opencsv.CSVParserBuilder;
import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;
import com.opencsv.exceptions.CsvValidationException;

public class MyCSVReader {
	public static List<Map<String,String>> readCSV(String file) throws CsvValidationException, IOException {
		FileReader reader = new FileReader(file,StandardCharsets.UTF_8);
		String[] headers = null;
		List<Map<String,String>> list = new ArrayList<>();

		CSVParser parser = new CSVParserBuilder().withSeparator(';').build();
		CSVReader csvReader = new CSVReaderBuilder(reader).withCSVParser(parser)
                .build();
		
		String[] line;
		while ((line = csvReader.readNext()) != null) {
			if(headers==null) {
				headers = line;
			}else {
				Map<String,String> map = new HashMap<String,String>();
				for (int i=0;i<line.length;i++) {
					map.put(headers[i], line[i]);
					
				}
				list.add(map);
			}
		}
		reader.close();
		csvReader.close();
		return list;
	}
}
