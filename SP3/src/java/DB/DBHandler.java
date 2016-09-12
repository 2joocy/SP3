/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import entities.User;
import java.awt.HeadlessException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

import servlets.Front;

/**
 *
 * @author William-PC
 */
public class DBHandler {
    
    private int checkLog;
    private double balance;
    private String username, email;

    public User checkLogin(String usrname, String pssword) {
        Front fr = new Front();
        User newUser = null;
        try {
            int count = 0;
            Class.forName("com.mysql.jdbc.Driver");   
            Connection myConn = DriverManager.getConnection("jdbc:mysql://77.66.117.72:3306/pfaffeeu_projects", "pfaffeeu_william", "william1O");
            java.sql.Statement mySt = myConn.createStatement();
            String rs = "SELECT username, password, email, balance FROM user WHERE username='" + usrname + "'AND password='" + pssword + "'";

            System.out.println(rs);
            ResultSet myRS = mySt.executeQuery(rs);
            while (myRS.next()) {
                newUser = new User(myRS.getString("username"),myRS.getString("password"),myRS.getString("email"),myRS.getDouble("balance"));
                
             
            count++;
            }

            if (count == 0) {
                return newUser;
            }

            if (count == 1) {
                return newUser;
                
               

            }
            myConn.close();
        } catch (SQLException | HeadlessException ex) {
            JOptionPane.showMessageDialog(null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        return newUser;
    }
    
    
    public void registerUser(String usrname, String pssword, Double balance, String email) {
       
        try {
            Class.forName("com.mysql.jdbc.Driver");   
            Connection myConn = DriverManager.getConnection("jdbc:mysql://77.66.117.72:3306/pfaffeeu_projects", "pfaffeeu_william", "william1O");
            java.sql.Statement mySt = myConn.createStatement();

            String myRS = "INSERT INTO user (username, password, balance, email)"
                    + "VALUES ('" + usrname + "', '" + pssword + "', '" + balance + "', '" + email + "')";

            mySt.executeUpdate(myRS);

            mySt.close();
        } catch (SQLException | HeadlessException ex) {
            JOptionPane.showMessageDialog(null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void addOrder(String id, String cake, double price){
        try {
            Class.forName("com.mysql.jdbc.Driver");   
            Connection myConn = DriverManager.getConnection("jdbc:mysql://77.66.117.72:3306/pfaffeeu_projects", "pfaffeeu_william", "william1O");
            java.sql.Statement mySt = myConn.createStatement();
            
            String myRS = "INSERT INTO orders (customer_id, cake, price)"
                    + "VALUES ('" + id + "', '" + cake + "', '" + price + "')";

            mySt.executeUpdate(myRS);

            mySt.close();
        } catch (SQLException | HeadlessException ex) {
            JOptionPane.showMessageDialog(null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void addBalance(double balance, String username){
        try {
            Class.forName("com.mysql.jdbc.Driver");   
            Connection myConn = DriverManager.getConnection("jdbc:mysql://77.66.117.72:3306/pfaffeeu_projects", "pfaffeeu_william", "william1O");
            java.sql.Statement mySt = myConn.createStatement();
            
            String myRS = "update user set balance="+ balance + "where username ='"+ username +"'";

            mySt.executeUpdate(myRS);

            mySt.close();
        } catch (SQLException | HeadlessException ex) {
            JOptionPane.showMessageDialog(null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
}
