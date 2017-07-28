package com.csf.log4j;

import org.apache.log4j.Logger;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * Created by changqi.wu on 2017/7/20.
 */

public class LogFile {

    private static Random random = new Random();
    private static final Logger log = Logger.getLogger(LogFile.class);
    private static final SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss SSS");

    public static void main(String[] args) throws IOException, InterruptedException {
        boolean flag = true;
        int i =0;
        while (flag){
            Thread.sleep(20);
            creatInfo(i);
            i++;
        }

    }


    public static String creatInfo(int index) {
        StringBuffer sb = new StringBuffer();
        if (index % 20 == 0) {
            sb.append(creatException());
        } else {
            String time = sf.format(new Date());
            String url = getAPIURL(index);
            String info = info_templete.replace("${0}", time).replace("${1}", url).replace("${2}", random.nextInt(1000) + "");
            sb.append(info);
            log.info(sb.toString());
        }
        sb.append("\n");
        System.out.println(sb.toString());
        return sb.toString();
    }


    public static String getAPIURL(int index) {
        int size = urls.size();
        return urls.get(index % size);
    }

    public static String creatException() {
        StringBuffer sb = new StringBuffer();
        int s1 = random.nextInt(3);
        if (s1 == 0) {
            sb.append(excep1_templete);
        }else if(s1 == 1){
            sb.append(excep2_templete);
        } else {
            sb.append(excep3_templete);
        }
        log.error(sb.toString());
        return sb.toString();
    }

    public static final String info_templete = "INFO ${0} com.csf.frame.interceptors.LoggingInterceptor     (38) -  Request uri [ ${1} ] cost time ${2} ms";

    public static final String excep1_templete = "Caused by: java.net.ConnectException: Connection timed out";
    public static final String excep2_templete = "javax.ws.rs.NotFoundException: Could not find resource for full path: http://localhost:7027/shukugang/api/ucenter/optional/shares/add";
    public static final String excep3_templete = "2017-07-25 09:26:26 [ERROR] RefererInvocationHandler invoke Error: uri=motan://10.0.251.65:0/com.csf.service.datasupply.service.IStockService requestId=1573855939042737492 interface=com.csf.service.datasupply.service.IStockService method=fetchStockShareHistory(java.lang.String,java.lang.Integer)\n" +
            "com.weibo.api.motan.exception.MotanFrameworkException: error_message: encode error: isResponse=true, status: 503, error_code: 20002,r=null\n" +
            "        at com.weibo.api.motan.protocol.rpc.DefaultRpcCodec.encode(DefaultRpcCodec.java:67)\n" +
            "        at com.weibo.api.motan.transport.netty.NettyEncoder.encode(NettyEncoder.java:54)\n" +
            "        at org.jboss.netty.handler.codec.oneone.OneToOneEncoder.handleDownstream(OneToOneEncoder.java:66)\n" +
            "        at org.jboss.netty.channel.DefaultChannelPipeline.sendDownstream(DefaultChannelPipeline.java:591)\n" +
            "        at org.jboss.netty.channel.DefaultChannelPipeline$DefaultChannelHandlerContext.sendDownstream(DefaultChannelPipeline.java:776)\n" +
            "        at org.jboss.netty.channel.SimpleChannelHandler.writeRequested(SimpleChannelHandler.java:304)\n" +
            "        at org.jboss.netty.channel.SimpleChannelHandler.handleDownstream(SimpleChannelHandler.java:266)\n" +
            "        at org.jboss.netty.channel.DefaultChannelPipeline.sendDownstream(DefaultChannelPipeline.java:591)\n" +
            "        at org.jboss.netty.channel.DefaultChannelPipeline.sendDownstream(DefaultChannelPipeline.java:582)\n" +
            "        at org.jboss.netty.channel.Channels.write(Channels.java:611)\n" +
            "        at org.jboss.netty.channel.Channels.write(Channels.java:578)\n" +
            "        at org.jboss.netty.channel.AbstractChannel.write(AbstractChannel.java:251)\n" +
            "        at com.weibo.api.motan.transport.netty.NettyChannelHandler.processRequest(NettyChannelHandler.java:153)\n" +
            "        at com.weibo.api.motan.transport.netty.NettyChannelHandler.access$000(NettyChannelHandler.java:47)\n" +
            "        at com.weibo.api.motan.transport.netty.NettyChannelHandler$1.run(NettyChannelHandler.java:116)\n" +
            "        at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n" +
            "        at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)\n" +
            "        at java.lang.Thread.run(Thread.java:745)\n" +
            "Caused by: java.lang.NumberFormatException: For input string: \"\"\n" +
            "        at java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)\n" +
            "        at java.lang.Long.parseLong(Long.java:601)\n" +
            "        at java.lang.Long.parseLong(Long.java:631)\n" +
            "        at com.csf.service.datasupply.service.StockService.lambda$20(StockService.java:1283)\n" +
            "        at com.csf.service.datasupply.service.StockService$$Lambda$15/1707709186.accept(Unknown Source)\n" +
            "        at java.util.stream.ForEachOps$ForEachOp$OfRef.accept(ForEachOps.java:184)\n" +
            "        at java.util.stream.ReferencePipeline$2$1.accept(ReferencePipeline.java:175)\n" +
            "        at java.util.ArrayList$ArrayListSpliterator.forEachRemaining(ArrayList.java:1374)\n" +
            "        at java.util.stream.AbstractPipeline.copyInto(AbstractPipeline.java:512)\n" +
            "        at java.util.stream.AbstractPipeline.wrapAndCopyInto(AbstractPipeline.java:502)\n" +
            "        at java.util.stream.ForEachOps$ForEachOp.evaluateSequential(ForEachOps.java:151)\n" +
            "        at java.util.stream.ForEachOps$ForEachOp$OfRef.evaluateSequential(ForEachOps.java:174)\n" +
            "        at java.util.stream.AbstractPipeline.evaluate(AbstractPipeline.java:234)\n" +
            "        at java.util.stream.ReferencePipeline.forEach(ReferencePipeline.java:418)\n" +
            "        at com.csf.service.datasupply.service.StockService.lambda$18(StockService.java:1279)\n" +
            "        at com.csf.service.datasupply.service.StockService$$Lambda$13/1783251923.apply(Unknown Source)\n" +
            "        at com.google.common.collect.Lists$TransformingRandomAccessList.get(Lists.java:572)\n" +
            "        at java.util.AbstractList$Itr.next(AbstractList.java:358)\n" +
            "        at com.caucho.hessian.io.CollectionSerializer.writeObject(CollectionSerializer.java:115)\n" +
            "        at com.caucho.hessian.io.Hessian2Output.writeObject(Hessian2Output.java:465)\n" +
            "        at com.weibo.api.motan.serialize.Hessian2Serialization.serialize(Hessian2Serialization.java:42)\n" +
            "        at com.weibo.api.motan.codec.AbstractCodec.serialize(AbstractCodec.java:42)\n" +
            "        at com.weibo.api.motan.protocol.rpc.DefaultRpcCodec.encodeResponse(DefaultRpcCodec.java:237)\n" +
            "        at com.weibo.api.motan.protocol.rpc.DefaultRpcCodec.encode(DefaultRpcCodec.java:61)\n" +
            "        ... 17 more";

    private static List<String> urls = new ArrayList<>();

    static {
        urls.add("/ucenter/optional/shares/add");
        urls.add("/csf/index/realtime/state");
        urls.add("/stock/realtime/state");
        urls.add("/hq/stock/time/share/daily");
        urls.add("/csf/index/capital/flows/ranking");
        urls.add("/csf/index/capital/flows/details");
        urls.add("/financeData/queryMarket");
        urls.add("/hqprice/realtime");
        urls.add("/hq/stock/price/date");
        urls.add("/hq/stock/price");
        urls.add("/hq/index/price.json");
        urls.add("/hq/index/price");
        urls.add("/market/index/realtime/quotes");
        urls.add("/market/index/realtime/indicators");
    }


}
