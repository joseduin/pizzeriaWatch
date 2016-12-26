//
//  SecondController.swift
//  RicaPizza
//
//  Created by Jose Duin on 12/25/16.
//  Copyright © 2016 Jose Duin. All rights reserved.
//

import WatchKit
import Foundation


class SecondController: WKInterfaceController {
    
    var pizza: Pizza = Pizza()

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        pizza = (context as! PizzaOrden).pizzaOrden
    }

    override func willActivate() {
       
        super.willActivate()
    }

    override func didDeactivate() {
       
        super.didDeactivate()
    }
    @IBAction func crujiente() {
        masa(ma: "Crujiente")
    }
    @IBAction func delgada() {
        masa(ma: "Delgada")
    }
    @IBAction func gruesa() {
        masa(ma: "Gruesa")
    }
    func masa(ma: String) {
        self.pizza.masa = ma
        let pizzaOrden = PizzaOrden(pizzaOrden: pizza)
        pushController(withName: "TerceraController", context: pizzaOrden)
    }
}
