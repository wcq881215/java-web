package com.csf.mongo;

import java.util.List;

/**
 * Created by changqi.wu on 2018/3/6.
 */

public class Recursive {

    private int max = 10;
    private String start;
    private String end;
    private List<RelationShip> ships;

    private int line = 0;

    public void init(){

    }


    public void recursive(){

    }



    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public List<RelationShip> getShips() {
        return ships;
    }

    public void setShips(List<RelationShip> ships) {
        this.ships = ships;
    }


}
