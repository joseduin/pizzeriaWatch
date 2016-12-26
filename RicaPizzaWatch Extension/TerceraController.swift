//
//  TerceraController.swift
//  RicaPizza
//
//  Created by Jose Duin on 12/25/16.
//  Copyright © 2016 Jose Duin. All rights reserved.
//

import WatchKit
import Foundation


class TerceraController: WKInterfaceController {
    
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
    @IBAction func mozarela() {
        queso(que: "Mozarela")
    }
    @IBAction func cheddar() {
        queso(que: "Cheddar")
    }
    @IBAction func parmesano() {
        queso(que: "Parmesano")
    }
    @IBAction func ninguno() {
        queso(que: "Ninguno")
    }
    func queso(que: String) {
        self.pizza.queso = que
        let pizzaOrden = PizzaOrden(pizzaOrden: pizza)
        pushController(withName: "CuartaController", context: pizzaOrden)
    }
}
