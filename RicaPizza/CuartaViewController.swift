//
//  CuartaViewController.swift
//  Pizzeria
//
//  Created by Jose Duin on 12/9/16.
//  Copyright © 2016 Jose Duin. All rights reserved.
//

import UIKit

class CuartaViewController: UIViewController {
    
    @IBOutlet weak var jamon: checkBox!
    @IBOutlet weak var peperoni: checkBox!
    @IBOutlet weak var pavo: checkBox!
    @IBOutlet weak var salchichas: checkBox!
    @IBOutlet weak var aceitunas: checkBox!
    @IBOutlet weak var cebolla: checkBox!
    @IBOutlet weak var pimiento: checkBox!
    @IBOutlet weak var piña: checkBox!
    @IBOutlet weak var anchoas: checkBox!
    @IBOutlet weak var maiz: checkBox!
    
    // Inicializa la pizza en todos sus atributos defaults
    var pizzaOrden: Pizza = Pizza(tamaño: "", masa: "", queso: "", ingredientes: [String]())
    
    var ingredientes: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Rica Pizza"
        navigationController?.navigationBar.barTintColor = UIColor(red:205/255.0, green: 0/255.0, blue: 15/255.0, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ConfirmacionViewController" {
            
            let nav = segue.destination as! UINavigationController
            let addEventViewController = nav.topViewController as! ConfirmacionViewController
            
            addEventViewController.pizzaOrden = self.pizzaOrden
        }
    }
    
    @IBAction func btnJamon(_ sender: Any) {
        removeIngregientes(ingrediente: "Jamon", check: jamon)
        addIngrediente(ingrediente: "Jamon", check: jamon)
    }
    
    @IBAction func btnPavo(_ sender: Any) {
        removeIngregientes(ingrediente: "Pavo", check: pavo)
        addIngrediente(ingrediente: "Pavo", check: pavo)
    }
    
    @IBAction func btnAceitunas(_ sender: Any) {
        removeIngregientes(ingrediente: "Aceitunas", check: aceitunas)
        addIngrediente(ingrediente: "Aceitunas", check: aceitunas)
    }
    
    @IBAction func btnPimiento(_ sender: Any) {
        removeIngregientes(ingrediente: "Pimiento", check: pimiento)
        addIngrediente(ingrediente: "Pimiento", check: pimiento)
    }
    
    @IBAction func btnSalchichas(_ sender: Any) {
        removeIngregientes(ingrediente: "Salchichas", check: salchichas)
        addIngrediente(ingrediente: "Salchichas", check: salchichas)
    }
    
    @IBAction func btnPeperoni(_ sender: Any) {
        removeIngregientes(ingrediente: "Peperoni", check: peperoni)
        addIngrediente(ingrediente: "Peperoni", check: peperoni)
    }
    
    @IBAction func btnCebolla(_ sender: Any) {
        removeIngregientes(ingrediente: "Cebollas", check: cebolla)
        addIngrediente(ingrediente: "Cebollas", check: cebolla)
    }
    
    @IBAction func btnPiña(_ sender: Any) {
        removeIngregientes(ingrediente: "Piña", check: piña)
        addIngrediente(ingrediente: "Piña", check: piña)
    }
    
    @IBAction func btnAnchoas(_ sender: Any) {
        removeIngregientes(ingrediente: "Anchoas", check: anchoas)
        addIngrediente(ingrediente: "Anchoas", check: anchoas)
    }
    
    @IBAction func btnMaiz(_ sender: Any) {
        removeIngregientes(ingrediente: "Maiz", check: maiz)
        addIngrediente(ingrediente: "Maiz", check: maiz)
    }
    
    func addIngrediente(ingrediente: String, check: checkBox) {
        if (!check.isChecked) {
            if (ingredientes.count < 5) {
                ingredientes.append(ingrediente)
                actIngredientes()
            } else {
                check.buttonClicked(sender: check)
                self.mensaje(mensaje: "El maximo de ingredientes en una pizza es 5 ")
            }
            
        }
    }
    
    func removeIngregientes(ingrediente: String, check: checkBox) {
        if (check.isChecked) {
            for index in 0..<ingredientes.count {
                if (ingredientes[index] == ingrediente) {
                    ingredientes.remove(at: index)
                    actIngredientes()
                    break
                }
            }
        }
    }
    
    func actIngredientes() {
        pizzaOrden.ingredientes = ingredientes
    }
    
    @IBAction func btnGuardarIngredientes(_ sender: Any) {
        if (ingredientes.count < 1) {
            
            mensaje(mensaje: "Debe escojer al menos un ingrediente")
            return
        }
        
        performSegue(withIdentifier: "ConfirmacionViewController", sender: nil)
    }
    
    @IBAction func btnAtras(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func mensaje(mensaje: String) {
        let mostrarMensaje = UIAlertController(title: "Gerencia de Pizzeria", message: mensaje, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        mostrarMensaje.addAction(okAction)
        
        self.present(mostrarMensaje, animated: true, completion: nil)
    }
    
}
