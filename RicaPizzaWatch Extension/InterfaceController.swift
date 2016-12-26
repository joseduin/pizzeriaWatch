//
//  InterfaceController.swift
//  RicaPizzaWatch Extension
//
//  Created by Jose Duin on 12/25/16.
//  Copyright © 2016 Jose Duin. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    var pizza: Pizza = Pizza()

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
    }
    override func willActivate() {
      
        super.willActivate()
    }
    override func didDeactivate() {
       
        super.didDeactivate()
    }
    @IBAction func chica() {
        tamaño(tama: "Chica")
    }
    @IBAction func media() {
        tamaño(tama: "Media")
    }
    @IBAction func grande() {
        tamaño(tama: "Grande")
    }
    func tamaño(tama: String) {
        self.pizza.tamaño = tama
        let pizzaOrden = PizzaOrden(pizzaOrden: pizza)
        pushController(withName: "SecondController", context: pizzaOrden)
    }
}
