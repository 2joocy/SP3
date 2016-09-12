/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author William-PC
 */
class topping {

    String topping;
    int price;
    
    public topping(String topping, int price){
        this.topping = topping;
        this.price = price;
    }
    
    public topping(){
        this.topping = "";
        this.price = 0;
    }
    
}
