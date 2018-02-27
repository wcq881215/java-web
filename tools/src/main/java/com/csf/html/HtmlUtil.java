package com.csf.html;

import org.apache.commons.lang3.StringEscapeUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class HtmlUtil {
    private static final String regEx_script = "<script[^>]*?>[\\s\\S]*?<\\/script>"; // 定义script的正则表达式
    private static final String regEx_style = "<style[^>]*?>[\\s\\S]*?<\\/style>"; // 定义style的正则表达式
    private static final String regEx_html = "<[^>]+>"; // 定义HTML标签的正则表达式
    private static final String regEx_space = "\r|\n";// 定义空格回车换行符 \s|\t暂时不替换
    private static final String regEx_note = "<!--[\\s\\S]*?-->"; // 定义script的正则表达式
    private static final List<String> remove_tag = new ArrayList<String>(Arrays.asList("img", "script", "select"));

    /**
     * @param htmlStr
     * @return 删除Html标签
     */
    public static String delHTMLTag(String htmlStr) {

        Pattern p_note = Pattern
                .compile(regEx_note, Pattern.CASE_INSENSITIVE);
        Matcher m_note = p_note.matcher(htmlStr);
        htmlStr = m_note.replaceAll(""); // 过滤空注释信息


        Pattern p_script = Pattern.compile(regEx_script,
                Pattern.CASE_INSENSITIVE);
        Matcher m_script = p_script.matcher(htmlStr);
        htmlStr = m_script.replaceAll(""); // 过滤script标签

        Pattern p_style = Pattern
                .compile(regEx_style, Pattern.CASE_INSENSITIVE);
        Matcher m_style = p_style.matcher(htmlStr);
        htmlStr = m_style.replaceAll(""); // 过滤style标签

        Pattern p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);
        Matcher m_html = p_html.matcher(htmlStr);
        htmlStr = m_html.replaceAll(""); // 过滤html标签

        Pattern p_space = Pattern
                .compile(regEx_space, Pattern.CASE_INSENSITIVE);
        Matcher m_space = p_space.matcher(htmlStr);
        htmlStr = m_space.replaceAll(""); // 过滤空格回车标签


        return htmlStr.trim(); // 返回文本字符串
    }

    public static String getTextFromHtml(String htmlStr) {
        Document doc = Jsoup.parse(htmlStr);
        for (Element element : doc.getAllElements()) {
            if (remove_tag.contains(element.tagName())) {
                element.remove();
            }
        }
        for (Element element : doc.select("tr")) {
            String d = "";
            for (Element td : element.select("td,th")) {
                System.out.println(td.text());
                if ("".equalsIgnoreCase(d)) {
                    d = td.text();
                } else {
                    d += ("&nbsp;&nbsp;&nbsp;&nbsp;" + td.text().trim());
                }
                td.remove();
            }
            element.append(d + "#&#");
        }
        htmlStr = doc.select("body").outerHtml();
        htmlStr = htmlStr.replaceAll("<br/>", "#&#");
        htmlStr = htmlStr.replaceAll("</p>", "#&#");
//        htmlStr = htmlStr.replaceAll("　　", "#&#");
        htmlStr = delHTMLTag(htmlStr);
        htmlStr = htmlStr.replaceAll("\n\r", "#&#");
        htmlStr = htmlStr.replaceAll("\r\n", "#&#");
        htmlStr = htmlStr.replaceAll("\n", "#&#");
        htmlStr = htmlStr.replaceAll("\r", "#&#");
//        htmlStr = htmlStr.replaceAll("&nbsp;", "");
//        htmlStr = htmlStr.replaceAll("&amp;", "&");
        htmlStr = StringEscapeUtils.unescapeHtml4(htmlStr).trim();
        String[] h = htmlStr.split("#&#");
        String ret_html = "";
        for (int i = 0; i < h.length; i++) {
            if (h[i] != null & !"".equalsIgnoreCase(h[i].trim())) {
                if ("".equalsIgnoreCase(ret_html.trim())) {
                    ret_html = h[i].trim();
                } else {
                    ret_html += ("#&#" + h[i].trim());
                }
            }
        }
        return ret_html;
    }

    public static void main(String[] args) {
        String str = "<div class=\"RL_details_content\">\n" +
                "                        <p>&nbsp;&nbsp;&nbsp;&nbsp;国家能源局数据显示，2017年中国可再生能源发电量1.7万亿千瓦时，占全部发电量的26.4%。截至2017年底，中国可再生能源发电装机达6.5亿千瓦，占全部<e_m_i c=\"2052\">电力</e_m_i>装机的36.6%。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;具体来看：</p><p>&nbsp;&nbsp;&nbsp;&nbsp;装机容量方面：<e_m_i c=\"5134\">水电</e_m_i>装机3.41亿千瓦、风电装机1.64亿千瓦、光伏发电装机1.3亿千瓦、生物质发电装机1488万千瓦，分别同比增长2.7%，10.5%，68.7%和22.6%。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;发电量方面：<e_m_i c=\"5134\">水电</e_m_i>达11945亿千瓦时，同比增长1.7%；风电3057亿千瓦时，同比增长26.3%；光伏发电1182亿千瓦时，同比增长78.6%；生物质发电794亿千瓦时，同比增长22.7%。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;利用情况方面：全年弃<e_m_i c=\"5134\">水电</e_m_i>量515亿千瓦时，水能利用率达96%左右；弃风电量419亿千瓦时，弃风率12%，同比下降5.2个百分点；弃光电量73亿千瓦时，弃光率6%，同比下降4.3个百分点。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;由此可知，<e_m_i c=\"5134\">水电</e_m_i>仍是中国可再生能源的主力，<e_m_i c=\"5134\">水电</e_m_i>是目前效率最高、最经济、综合利用最好的可再生能源。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;<e_m_i c=\"5134\">水电</e_m_i>仍是中国可再生能源的主力，<e_m_i c=\"5134\">水电</e_m_i>发电量占可再生能源发电量70%。<e_m_i c=\"5134\">水电</e_m_i>是效率最高的可再生能源，<e_m_i c=\"5134\">水电</e_m_i>装机是风电2.2倍，发电量是风电4倍；装机是光伏2.6倍，发电量是其10倍。目前<e_m_i c=\"5134\">水电</e_m_i>是最经济的可再生能源，平均上网电价约是风电一半多，光伏的三分之一多。<e_m_i c=\"5134\">水电</e_m_i>是综合利用最好的可再生能源，具有防洪、灌溉、供水、水资源调控、<e_m_i c=\"2068\">旅游</e_m_i>等综合效益。</p>\n" +
                "                    </div>";
        // str = " aaa \n\n\n\n 春节过后";
        //System.out.println(str);
        String htm = getTextFromHtml(str);
        System.out.println(htm);
    }
}