//
//  CuartaController.swift
//  RicaPizza
//
//  Created by Jose Duin on 12/25/16.
//  Copyright © 2016 Jose Duin. All rights reserved.
//

import WatchKit
import Foundation


class CuartaController: WKInterfaceController {

    @IBOutlet var jamon: WKInterfaceSwitch!
    @IBOutlet var peperoni: WKInterfaceSwitch!
    @IBOutlet var pavo: WKInterfaceSwitch!
    @IBOutlet var salchica: WKInterfaceSwitch!
    @IBOutlet var aceituna: WKInterfaceSwitch!
    @IBOutlet var cebolla: WKInterfaceSwitch!
    @IBOutlet var pimiento: WKInterfaceSwitch!
    @IBOutlet var pina: WKInterfaceSwitch!
    @IBOutlet var anchoas: WKInterfaceSwitch!
    @IBOutlet var maiz: WKInterfaceSwitch!
    
    var pizza: Pizza = Pizza()
    
    var ingredientes_componentes = [WKInterfaceSwitch: Bool]()
    var ingredientes_listado: [String] = [String]()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        pizza = (context as! PizzaOrden).pizzaOrden
        ingredientes_componentes = [jamon: false,
                                    peperoni: false,
                                    pavo: false,
                                    salchica: false,
                                    aceituna: false,
                                    cebolla: false,
                                    pimiento: false,
                                    pina: false,
                                    anchoas: false,
                                    maiz: false]
    }

    override func willActivate() {
       
        super.willActivate()
    }

    override func didDeactivate() {
       
        super.didDeactivate()
    }
    @IBAction func jamonS(_ value: Bool) {
        elegir(ingrediente: "Jamòn", value: value, elemento: jamon)
    }
    @IBAction func peperoniS(_ value: Bool) {
        elegir(ingrediente: "Peperoni", value: value, elemento: peperoni)
    }
    @IBAction func pavoS(_ value: Bool) {
        elegir(ingrediente: "Pavo", value: value, elemento: pavo)
    }
    @IBAction func salchichaS(_ value: Bool) {
        elegir(ingrediente: "Salchicha", value: value, elemento: salchica)
    }
    @IBAction func aceitunaS(_ value: Bool) {
        elegir(ingrediente: "Aceituna", value: value, elemento: aceituna)
    }
    @IBAction func cebollaS(_ value: Bool) {
        elegir(ingrediente: "Cebolla", value: value, elemento: cebolla)
    }
    @IBAction func pimientoS(_ value: Bool) {
        elegir(ingrediente: "Pimiento", value: value, elemento: pimiento)
    }
    @IBAction func piñaS(_ value: Bool) {
        elegir(ingrediente: "Piña", value: value, elemento: pina)
    }
    @IBAction func anchoaS(_ value: Bool) {
        elegir(ingrediente: "Anchoas", value: value, elemento: anchoas)
    }
    @IBAction func maizS(_ value: Bool) {
        elegir(ingrediente: "Maiz", value: value, elemento: maiz)
    }
    func elegir(ingrediente: String, value: Bool, elemento: WKInterfaceSwitch) {
        ingredientes_componentes[elemento] = value
        if (value) {
            ingredientes_listado.append(ingrediente)
            if (ingredientes_listado.count == 5) {
                isEnableSwitch(valor: false)
                mensaje(mensaje: "Número maximo de ingredientes")
            }
        } else {
            isEnableSwitch(valor: true)
            removerIngrediente(ingrediente: ingrediente)
        }
    }
    func removerIngrediente(ingrediente: String) {
        for index in 0..<ingredientes_listado.count {
            if (ingredientes_listado[index] == ingrediente) {
                ingredientes_listado.remove(at: index)
                break
            }
        }
    }
    func isEnableSwitch(valor: Bool) {
        for (suiche, boleano) in ingredientes_componentes {
            if (!boleano) {
                suiche.setEnabled(valor)
            }
        }
        
    }
    @IBAction func guardarIngredientes() {
        if (ingredientes_listado.count > 0 && ingredientes_listado.count < 6) {
            self.pizza.ingredientes = ingredientes_listado
            let pizzaOrden = PizzaOrden(pizzaOrden: pizza)
            pushController(withName: "ConfirmacionController", context: pizzaOrden)
        } else {
            mensaje(mensaje: "Debe escojer al menos un ingrediente")
        }
    }
    func mensaje(mensaje: String) {
        let action1 = WKAlertAction(title: "Ok", style: .default) {}
        
        presentAlert(withTitle: "Gerencia de Pizzeria", message: mensaje, preferredStyle: .actionSheet, actions: [action1])
    }

}
