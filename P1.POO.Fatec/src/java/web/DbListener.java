/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.*;

/**
 * Web application lifecycle listener.
 *
 * @author feoli
 */
public class DbListener implements ServletContextListener {
    
    private static final String CLASS_NAME = "org.sqlite.JDBC";
    private static final String DB_URL = "jdbc:sqlite:disciplinas.db";
    
    public static String exceptionMessage;
    
    public static Connection getConnection() throws Exception{
        return DriverManager.getConnection(DB_URL);
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        Connection con = null;
        Statement stmt = null;
        
        try{
            Class.forName(CLASS_NAME);
            con = getConnection();
            stmt = con.createStatement();
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
    }finally{
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
