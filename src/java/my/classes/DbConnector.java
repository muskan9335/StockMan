/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package my.classes;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Subhash
 */
public class DbConnector {
    Connection con;
    String DRIVER = "com.mysql.jdbc.Driver";
    String URL = "jdbc:mysql://localhost:3306/stockman";
    String USERNAME = "root";
    String PASSWORD = "";
    
    public Connection getConnection(){
    try{
        Class.forName(DRIVER);
        con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }
    catch(Exception e){
    
    }
        return con;
    }
}
