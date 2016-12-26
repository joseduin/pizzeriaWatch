//
//  ConfirmacionController.swift
//  RicaPizza
//
//  Created by Jose Duin on 12/25/16.
//  Copyright © 2016 Jose Duin. All rights reserved.
//

import WatchKit
import Foundation


class ConfirmacionController: WKInterfaceController {

    @IBOutlet var tamaño: WKInterfaceLabel!
    @IBOutlet var masa: WKInterfaceLabel!
    @IBOutlet var queso: WKInterfaceLabel!
    @IBOutlet var ingredientes: WKInterfaceTable!
    
    var pizza: Pizza = Pizza()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        pizza = (context as! PizzaOrden).pizzaOrden
        tamaño.setText(pizza.tamaño)
        masa.setText(pizza.masa)
        queso.setText(pizza.queso)
        loadTableData(lista_ingredientes: pizza.ingredientes)
    }

    override func willActivate() {
        
        super.willActivate()
    }

    override func didDeactivate() {
       
        super.didDeactivate()
    }
    func loadTableData(lista_ingredientes: [String]) {
        ingredientes.setNumberOfRows(lista_ingredientes.count, withRowType: "Ingredientes")
        
        for (index, ingrediente) in lista_ingredientes.enumerated() {
            if let row = ingredientes.rowController(at: index) as? Ingredientes {
                row.textLabel.setText(ingrediente)
            }
        }
    }
    @IBAction func cocinar() {
        mensaje(mensaje: "¿Seguro de mandar su pizza a la cocina?")
    }
    func bueProvecho() {
        pushController(withName: "BuenProvechoController", context: nil)
    }
    func mensaje(mensaje: String) {
        let action1 = WKAlertAction(title: "Ok", style: .default, handler: {
            self.bueProvecho()
        })
        let action2 = WKAlertAction(title: "Cancelar", style: .cancel) {}
        
        presentAlert(withTitle: "Gerencia de Pizzeria", message: mensaje, preferredStyle: .actionSheet, actions: [action1, action2])
    }
}
