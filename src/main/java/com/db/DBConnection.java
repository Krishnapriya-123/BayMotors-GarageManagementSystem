package com.db;
import java.sql.Connection;
import java.sql.DriverManager;


public class DBConnection {
    public static Connection con = null;
    public static String DRIVER  = "com.mysql.cj.jdbc.Driver";
    public static String CONNECTION_URL = "jdbc:mysql://localhost:3306/BayMotors";
    public static String USERNAME = "root";
    public static String PASSWORD = "vineeth";

    static{
        try{
            Class.forName(DRIVER);
            con = DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD);
            con.setAutoCommit(false);
        }
        catch(Exception e){
            System.out.println(e);
        }
    }

    public static Connection getCon() {
        return con;
    }
}