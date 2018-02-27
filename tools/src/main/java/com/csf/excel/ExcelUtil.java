package com.csf.excel;

import com.csf.html.HtmlUtil;
import com.csf.http.HttpUtil;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by changqi.wu on 2018/2/26.
 */

public class ExcelUtil {

    public static final String PATHS = "C:\\Users\\changqi.wu\\Desktop\\文章数据.xlsx";
    public static final String result_excel = "C:\\Users\\changqi.wu\\Desktop\\文章数据_result.xlsx";

    public static void main(String[] args) throws IOException {
        pasrse();
    }

    public static void pasrseResult() throws IOException {



    }


    public static void pasrse() throws IOException {
        XSSFWorkbook xssfWorkbook = getWorkbook(PATHS);
        XSSFWorkbook resultWorkbook = new XSSFWorkbook();

        XSSFSheet dataSheet = resultWorkbook.createSheet("处理掉html的数据");
        XSSFSheet parseSheet = resultWorkbook.createSheet("算法分析结果");

        XSSFSheet sheet = xssfWorkbook.getSheet("Sheet2");
        int end = sheet.getLastRowNum();

        String url = "http://54.222.205.14:8003/nlp-service-server/analysis";

        XSSFRow dataSheetTitleRow = dataSheet.createRow(0);
        dataSheetTitleRow.createCell(0).setCellValue("ID");
        dataSheetTitleRow.createCell(1).setCellValue("去标签内容");

        XSSFRow parseSheetTitleRow = parseSheet.createRow(0);
        parseSheetTitleRow.createCell(0).setCellValue("ID");
        parseSheetTitleRow.createCell(1).setCellValue("分析结果");


        for (int i = 1; i <= end; i++) {
            XSSFRow row = sheet.getRow(i);
            String id = row.getCell(0).getRawValue();
            String name = row.getCell(1).getRawValue();
            String content = row.getCell(4).getStringCellValue();
            content = HtmlUtil.getTextFromHtml(content).replaceAll("#&#", "\n");

            dataSheetTitleRow = dataSheet.createRow(i);
            dataSheetTitleRow.createCell(0).setCellValue(id);
            dataSheetTitleRow.createCell(1).setCellValue(content);

            Map<String, String> param = new HashMap<>();
            param.put("name", name);
            param.put("url", "--");
            param.put("content", content);
            String resp = HttpUtil.post(url.toString(), param);
            System.out.println(resp);

            parseSheetTitleRow = parseSheet.createRow(i);
            parseSheetTitleRow.createCell(0).setCellValue(id);
            parseSheetTitleRow.createCell(1).setCellValue(resp);
        }

        resultWorkbook.write(new FileOutputStream(result_excel));

    }

    /**
     * @return
     * @throws IOException
     * @throws FileNotFoundException
     */
    private static XSSFWorkbook getWorkbook(String path) throws FileNotFoundException, IOException {
        return new XSSFWorkbook(new FileInputStream(path));
    }

}
