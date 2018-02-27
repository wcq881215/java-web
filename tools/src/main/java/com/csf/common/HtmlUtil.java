package com.csf.common;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class HtmlUtil {
	private static final String regEx_script = "<script[^>]*?>[\\s\\S]*?<\\/script>"; // 定义script的正则表达式
	private static final String regEx_style = "<style[^>]*?>[\\s\\S]*?<\\/style>"; // 定义style的正则表达式
	private static final String regEx_html = "<[^>]+>"; // 定义HTML标签的正则表达式
	private static final String regEx_space = "\\s|\t|\r|\n";// 定义空格回车换行符

	/**
	 * @param htmlStr
	 * @return 删除Html标签
	 */
	public static String delHTMLTag(String htmlStr) {
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
		htmlStr = htmlStr.replaceAll("\n\r", "#&#");
		htmlStr = htmlStr.replaceAll("\r\n", "#&#");
		htmlStr = htmlStr.replaceAll("\n", "#&#");
		htmlStr = htmlStr.replaceAll("\r", "#&#");
		htmlStr = htmlStr.replaceAll("<br/>", "#&#");
		htmlStr = htmlStr.replaceAll("</p>", "#&#");
		htmlStr = htmlStr.replaceAll("　　", "#&#");
		
		htmlStr = delHTMLTag(htmlStr);
		htmlStr = htmlStr.replaceAll("&nbsp;", "");
		
		int len = htmlStr.length();
		while(true) {
			htmlStr = htmlStr.replaceAll("#&##&#", "#&#");
			if(htmlStr.length() == len) {
				break;
			} else {
				len = htmlStr.length();
			}
		}
		
		return htmlStr;
	} 

	public static void main(String[] args) {
		String str = "<P class=Para>　　视觉(中国)文化发展股份有限公司</p><p class=Para>　111</p></p></p><a></p></p></p></p>222　投资者关系活动登记表</p><p class=Para>　　编号：2017-004</p><p class=Para>　　投资者关系</p><p class=Para>　　活动类别</p><p class=Para>　　?特定对象调研 □分析师会议</p><p class=Para>　　□媒体采访 □业绩说明会</p><p class=Para>　　□新闻发布会 □路演活动</p><p class=Para>　　□现场参观</p><p class=Para>　　□其他 (分析师电话会议)</p><p class=Para>　　参与单位名称</p><p class=Para>　　及人员姓名 华泰柏瑞基金管理有限公司 陈晓光</p><p class=Para>　　厦门普尔投资管理有限责任公司 姚玥</p><p class=Para>　　国金证券股份有限公司 王泽佳</p><p class=Para>　　天风证券股份有限公司 张爽</p><p class=Para>　　中泰证券股份有限公司 宋易潞</p><p class=Para>　　中金公司 丁民杰</p><p class=Para>　　中再资产 程军、胡换录</p><p class=Para>　　时 间 2017年03月16日上午10:15-11:45</p><p class=Para>　　地 点 公司一楼会议室</p><p class=Para>　　上市公司接待</p><p class=Para>　　人员姓名 证券事务代表彭晶。</p><p class=Para>　　资者关系活动主要内容介绍</p><p class=Para>　　彭晶首先介绍了公司的基本情况，回答提问环节记录如下：</p><p class=Para>　　1、问：请问公司图片库的版权归属?自有版权图片的数量?</p><p class=Para>　　答：公司图片库中的图片来源主要有三部分：一部分来自于签约供应商，例如Getty Images;一部分来自签约供稿人，目前公司有近17000名签约供稿人;最后一部分是公司自有版权图片，例如来自Corbis和东星娱乐图片。</p><p class=Para>　　2、问：请问公司代理图片需要付费吗?</p><p class=Para>　　答：公司代理图片不需要提前支付费用，图片授权产生收入后再按照协议约定进行分成。</p><p class=Para>　　3、问：请介绍和腾讯的战略合作?</p><p class=Para>　　答：本次合作，公司将与腾讯网媒在正版内容采购、共建“企鹅媒体平台内容资源库”以及自媒体运营等方面建立战略合作关系。公司向腾讯网媒开放全部正版图片、视频、音乐资源，将与腾讯一起服务数十万自媒体用户，为自媒体用户提供优质正版内容，共同构建自媒体共赢生态圈。</p><p class=Para>　　本次战略合作协议的签署，是公司主营业务拓展的重要里程碑，对公司业务升级具有重要意义。鉴于公司的正版PGC视觉内容的核心资源优势，公司将在正版内容采购、共建“企鹅媒体平台”以及自媒体合作等方面，与腾讯建立战略合作关系。特别是公司与腾讯共建“企鹅媒体平台内容资源库”，开放全部正版图片、视频、音乐资源，与企鹅媒体平台一起服务数十万自媒体，为自媒体用户提供优质正版内容，对于共同构建网络自媒体共赢生态圈具有重要意义。</p><p class=Para>　　目前，公司已与腾讯企鹅号、一点资讯以及凤凰号达成战略合作，之后将与更多大流量平台合作，共同打通长尾市场。</p><p class=Para>　　4、问：请问公司每年用于图片侵权的诉讼费用?</p><p class=Para>　　答： 近年来国家政策打击盗版使得企业违法成本上升、版权价值的提升激发了权利人的版权意识。作为中国版权协会理事单位，视觉中国践行“视觉创造价值、视觉服务中国”的理念。公司在业务开展过程中，我们发现有大量未经授权使用视觉中国代理的版权人或机构图片的现象，一方面我们积极沟通协商，与这些对优质图片有需求的用户签署长期合作协议，为他们提供专业高效的正版产品与版权服务;而对极少数恶意侵权拒绝正版合作的机构，公司会依法通过诉讼，维护广大版权人的合法权益。近年来，公司的维权案例多次得到最高院的胜诉支持，其中两起判例分别入选2010、2014年度知识产权典型案例向全国各级法院示范推广。</p><p class=Para>　　5、问：请介绍去年与Getty的合作?是否并表?</p><p class=Para>　　答：2016年上半年，公司参与了Getty Images香港公司的增资扩股，持有其50%的股份，此次合作将有助于公司夯实“PGC视觉内容”核心业务，一方面推动公司业务进入新的区域市场，有利于公司本土内容在港台地区的市场推广;同时也将增强中国大陆、香港、台湾等大中华地区的业务协同效应。公司与Getty公司在中国大陆、香港、台湾三大区域建立更为深入紧密的战略合作关系。</p><p class=Para>　　公司对于GettyImages香港公司不并表，只并利润。</p><p class=Para>　　6、问：请介绍12301平台建设情况?</p><p class=Para>　　答：12301国家智慧旅游平台是一个连接出行者、从业者、监管者的具有公信力的服务聚合平台。有五大功能，旅游公共信息发布及咨询、旅游产业运行监管、景区门票预约和客流预警、多语种旅游形象推广、大数据集成平台。目前采用全媒体交互技术的12301国家旅游服务热线已全面建成，已经实现31省12301集中受理咨询与投诉，12301微信公众号，微信城市服务旅游投诉、支付宝城市服务旅游投诉已全面开通，游客可以用手机实现12301一键投诉。2016年8月，由国家旅游局、视觉中国、唱游公司联合开发建设的“全国导游公共服务监管平台”已正式上线，全国导游公共服务监管平台实现了导游执业管理，导游执业信息全记录，导游服务评价和投诉，旅游部门监管执法和其他公共服务五大功能。“12301国家智慧旅游公共服务平台”、“全国导游公共服务监管平台”将同时成为面向消费者的全媒体交互平台。</p><p class=Para>　　7、问：请问公司近年收购的亿迅、司马彦公司等和公司主业的协同性?</p><p class=Para>　　答：公司近年的收购主要有亿迅、司马彦、上海卓越和Corbis资产。亿迅资产组“全媒体交互中心”是与C端进行交互的核心技术，是有效满足现代服务业C端客户互动和服务的完整解决方案。 “全媒体交互中心”解决方案是公司未来2B2C战略和行业视觉服务战略发展的重要技术支持，同时也为“国家智慧旅游公共服务平台”提供核心支撑技术。</p><p class=Para>　　司马彦公司字帖业务也涉及版权，属于公司互联网传媒与娱乐业务板块。另外，公司在教育行业处于起步阶段，通过对“司马彦字帖”业务的投资参股，实现了以版权IP切入教育行业的初步战略布局。</p><p class=Para>　　上海卓越是一家全案整合营销的公司，具有较强的品牌创意与策划能力、较丰富的客户资源，能够弥补公司整合营销能力的不足。另外，上海卓越在旅游目的地、城市综合体及主题公园等目的地营销服务领域有多年的积累，与公司的数字娱乐(艾特凡斯)与智慧旅游(12301国家智慧旅游公共服务平台)业务具有很强的协同效应。</p><p class=Para>　　收购Corbis资产不仅丰富了公司自有版权的视觉内容素材库，而且公司通过此次交易拥有了大量具有历史收藏价值的老照片或“原始照片”(Vintage Print)的物权，收购的资产与公司核心业务高度协同。</p><p class=Para>　　8、问：请问司马彦公司并表吗?</p><p class=Para>　　答：公司持有司马彦公司49%股权，不并表。</p><p class=Para>　　9、问：请问除了图片行业，公司在战略上还会重点发展其他行业吗?</p><p class=Para>　　答：鉴于文化创意、内容版权行业发展前景，公司将会继续聚焦主营业务，保持高速的内生增长。除此以外，公司重点依托“12301国家智慧旅游公共服务平台”，连接监管、消费者、涉旅企业，打造旅游行业大数据平台。</p><p class=Para>　　10、问：请问公司的2C业务?</p><p class=Para>　　答：公司要实现2C主要以优质PGC视觉内容为核心，依托互联网技术手段，通过渠道、内容运营，与具有C端大流量入口的合作伙伴合作，打造视觉内容虚拟运营平台，实现由B2B向B2B2C延展。</p><p class=Para>　　附件清单(如有) 无</p><p class=Para>　　日 期 2017年03月16日</P>";
		// str = " aaa \n\n\n\n 春节过后";
		System.out.println(str);
		System.out.println(getTextFromHtml(str));
	}
}