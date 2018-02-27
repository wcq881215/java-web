package com.csf.excel;

import com.csf.common.EncodingDetect;
import com.csf.html.HtmlUtil;
import com.csf.http.HttpUtil;
import com.csvreader.CsvReader;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by changqi.wu on 2018/2/26.
 */

public class CSVUtil {
    public static String path = "C:\\Users\\changqi.wu\\Desktop\\文字直播室老师发言-UTF8-2.csv";
    public static final String result_excel = "C:\\Users\\changqi.wu\\Desktop\\文字直播室老师发言-UTF8-2.xlsx";

    public static void main(String[] args) throws IOException {
        pasrse();
    }

    public static void pasrse() throws IOException {
        XSSFWorkbook resultWorkbook = new XSSFWorkbook();

        XSSFSheet dataSheet = resultWorkbook.createSheet("处理掉html的数据");
        XSSFSheet parseSheet = resultWorkbook.createSheet("算法分析结果");

//        String url = "http://54.222.205.14:8003/nlp-service-server/analysis";
        String url = "http://192.168.30.134:8003/nlp-service-server/analysis";

        XSSFRow dataSheetTitleRow = dataSheet.createRow(0);
        dataSheetTitleRow.createCell(0).setCellValue("ID");
        dataSheetTitleRow.createCell(1).setCellValue("去标签内容");

        XSSFRow parseSheetTitleRow = parseSheet.createRow(0);
        parseSheetTitleRow.createCell(0).setCellValue("ID");
        parseSheetTitleRow.createCell(1).setCellValue("分析结果");

        String charset = EncodingDetect.getJavaEncode(path);
        CsvReader reader = new CsvReader(path, ',', Charset.forName(charset));
        reader.setSafetySwitch(false);
        reader.readHeaders();    // 跳过表头

        //定义列变量
        String content = null;
        String name = null;
        String id = null;
        int i = 0;
        while (reader.readRecord()) { //逐行读入除表头的数据

            try {

                String[] lineData = reader.getValues();
                content = lineData[0];
                id = lineData[1];
                name = lineData[3];
                content = HtmlUtil.getTextFromHtml(content).replaceAll("#&#", "\n");
                System.out.println(id);
                System.out.println(content);

                i++;
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

            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        resultWorkbook.write(new FileOutputStream(result_excel));

    }


}
