package utils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelReader {

	public static FileInputStream file;
	public static XSSFWorkbook workbook;
	public static XSSFSheet sheet;
	public static FileOutputStream fileout;
	public static XSSFRow row;
	public static XSSFCell col;
	public static int rowvalue;
	public static int colvalue;

	public static String readdata(String filepath, String sheetname, int rownumber, int colnumber) throws IOException

	{

		try {
			file = new FileInputStream(filepath);
			workbook = new XSSFWorkbook(file);
		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
		sheet = workbook.getSheet(sheetname);
		row = sheet.getRow(rownumber);
		col = row.getCell(colnumber);

		// String value = col.toString();
		String value;

		try {
			DataFormatter d = new DataFormatter();
			value = d.formatCellValue(col);
			return value;

		} catch (Exception e) {
			value = "";
		}
		workbook.close();
		file.close();
		return value;

	}

	public static void writedata(String filepath, String sheetname, int rownumber, int colnumber, String value)
			throws IOException {
		try {
			file = new FileInputStream(filepath);
			workbook = new XSSFWorkbook(file);
		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}

		sheet = workbook.getSheet(sheetname);

		row = sheet.getRow(rownumber);

		col = row.getCell(colnumber);

		col.setCellValue(value);

		try {
			fileout = new FileOutputStream(filepath);
			workbook.write(fileout);
		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		workbook.close();

		file.close();

		fileout.close();

	}

}
