//
//  TerceraViewController.swift
//  Pizzeria
//
//  Created by Jose Duin on 12/9/16.
//  Copyright © 2016 Jose Duin. All rights reserved.
//

import UIKit

class TerceraViewController: UIViewController {
    
    // Inicializa la pizza en todos sus atributos defaults
    var pizzaOrden: Pizza = Pizza(tamaño: "", masa: "", queso: "", ingredientes: [String]())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Rica Pizza"
        navigationController?.navigationBar.barTintColor = UIColor(red:205/255.0, green: 0/255.0, blue: 15/255.0, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CuartaViewController" {
            
            let nav = segue.destination as! UINavigationController
            let addEventViewController = nav.topViewController as! CuartaViewController
            
            addEventViewController.pizzaOrden = self.pizzaOrden
        }
    }
    
    @IBAction func mozarela(_ sender: Any) {
        self.queso(tipo: "Mozarela")
    }
    
    @IBAction func cheddar(_ sender: Any) {
        self.queso(tipo: "Cheddar")
    }
 
    @IBAction func parmesano(_ sender: Any) {
        self.queso(tipo: "Parmesano")
    }
    
    @IBAction func ninguno(_ sender: Any) {
        self.queso(tipo: "Ninguno")
    }
    
    @IBAction func btnAtras(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    func queso(tipo: String) {
        pizzaOrden.queso = tipo
        performSegue(withIdentifier: "CuartaViewController", sender: nil)
    }
    
}
