/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import java.awt.HeadlessException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author William-PC
 */
public class frontHandler {
    public String writeTopping(){
        String output = ""; 
        String topping;
        double price;
        try {
            
            Class.forName("com.mysql.jdbc.Driver");   
            Connection myConn = DriverManager.getConnection("jdbc:mysql://77.66.117.72:3306/pfaffeeu_projects", "pfaffeeu_william", "william1O");
            java.sql.Statement mySt = myConn.createStatement();
            String rs = "SELECT * FROM topping";
            ResultSet myRS = mySt.executeQuery(rs);
            while (myRS.next()) {
                topping = myRS.getString("topping");
                price = myRS.getDouble("price");
                 output += "<form method ='POST' action='first'>"+ topping  +"&nbsp;<input type='hidden' name='toppingText' value='"+topping+"'><input type='hidden' name='toppingTextPrice' value='"+price+"'>Price: "+ price +"<br><button type='submit'>Add To Basket</button></form>"; 
            }

            myConn.close();
        } catch (SQLException | HeadlessException ex) {
            JOptionPane.showMessageDialog(null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        return output;         
    }
    
    public String writeBottom(){
        String output = ""; 
        String bottom;
        double price;
        try {
            
            Class.forName("com.mysql.jdbc.Driver");   
            Connection myConn = DriverManager.getConnection("jdbc:mysql://77.66.117.72:3306/pfaffeeu_projects", "pfaffeeu_william", "william1O");
            java.sql.Statement mySt = myConn.createStatement();
            String rs = "SELECT * FROM bottom";
            ResultSet myRS = mySt.executeQuery(rs);
            while (myRS.next()) {
                bottom = myRS.getString("bottom");
                price = myRS.getDouble("price");
                 output += "<form method ='POST' action='second'>"+ bottom  +"&nbsp;<input type='hidden' name='bottomText' value='"+bottom+"'><input type='hidden' name='bottomTextPrice' value='"+price+"'>Price: "+ price +"<br><button type='submit'>Add To Basket</button></form>"; 
            }

            myConn.close();
        } catch (SQLException | HeadlessException ex) {
            JOptionPane.showMessageDialog(null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        return output;         
    }
}
