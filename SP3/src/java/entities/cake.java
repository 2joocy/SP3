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
class cake {

    bottom Bot = new bottom();
    topping Top = new topping();
    String recipe;
    int price;

    public cake(bottom Bot, topping Top) {
        this.Bot = Bot;
        this.Top = Top;
        recipe = Top.topping + ";" + Bot.bottom;
        this.price = Bot.price + Top.price;
    }

    public cake() {
        this.Bot.bottom = "";
        this.Bot.price = 0;
        this.Top.topping = "";
        this.Top.price = 0;
        this.recipe = "";
        this.price = 0;

    }

}
