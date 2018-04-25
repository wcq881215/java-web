package com.csf.mongo;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import com.mongodb.ServerAddress;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class DBUtils {

    public static DBCollection getMongoConn(String host, String dbname, String coll) throws UnknownHostException {
        List<ServerAddress> seeds = new ArrayList<ServerAddress>();
        seeds.add(new ServerAddress(host, 27017));
        MongoClient mongoClient = new MongoClient(seeds);
        DB db = mongoClient.getDB(dbname);
        return db.getCollection(coll);
    }

    public static MongoCollection<Document> getMongoClient(String host, String dbname, String coll) throws UnknownHostException {
        List<ServerAddress> seeds = new ArrayList<ServerAddress>();
        seeds.add(new ServerAddress(host, 27017));
        MongoClient mongoClient = new MongoClient(seeds);
        MongoDatabase db = mongoClient.getDatabase(dbname);
        return db.getCollection(coll);
    }


    public static void loadData() throws Exception {
        MongoCollection collection = getMongoClient("192.168.250.208", "zs_poc", "supply_chain_relation");
        FindIterable<Document> cursor = collection.find();
        MongoCursor<Document> it = cursor.iterator();
        List<RelationShip> list = new ArrayList<>(20305);
        while (it.hasNext()) {
            Document obj = it.next();
            Map primay = obj.get("prime", Map.class);
            String pcode = (String) primay.get("cd");

            Map related = obj.get("related", Map.class);
            String ship = (String) related.get("rtyp");
            Map name = (Map) related.get("name");
            String rcode = (String) name.get("cd");
            RelationShip rs = new RelationShip();
            rs.setPcode(pcode);
            rs.setRcode(rcode);
            rs.setShip(ship);
            list.add(rs);
        }

        list.forEach( v -> System.out.println(v));

    }

    public static void query() throws Exception {
        MongoCollection collection = getMongoClient("192.168.250.208", "zs_poc", "dict_industry");
        FindIterable<Document> cursor = collection.find();
        MongoCursor<Document> it = cursor.iterator();
        List<RelationShip> list = new ArrayList<>(1000);
        while (it.hasNext()) {
            Document obj = it.next();
//            List rs = obj.get("code", List.class);
//            System.out.println(rs);

            System.out.println(obj.get("sam_code"));
        }


    }

    public static void main(String[] args) throws Exception{
        query();

//        String dbPath = "";
//        GraphDatabaseFactory dbFactory = new GraphDatabaseFactory();
//        GraphDatabaseService db= dbFactory.newEmbeddedDatabase(new File(dbPath));
    }


}