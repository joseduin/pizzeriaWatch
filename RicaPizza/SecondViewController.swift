//
//  SecondViewController.swift
//  Pizzeria
//
//  Created by Jose Duin on 12/9/16.
//  Copyright © 2016 Jose Duin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    // Inicializa la pizza en todos sus atributos defaults
    var pizzaOrden: Pizza = Pizza(tamaño: "", masa: "", queso: "", ingredientes: [String]())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Rica Pizza"
        navigationController?.navigationBar.barTintColor = UIColor(red:205/255.0, green: 0/255.0, blue: 15/255.0, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TerceraViewController" {
            
            let nav = segue.destination as! UINavigationController
            let addEventViewController = nav.topViewController as! TerceraViewController
            
            addEventViewController.pizzaOrden = self.pizzaOrden
        }
    }
    
    
    @IBAction func crujiente(_ sender: Any) {
        self.masa(tipo: "Crujiente")
    }
    
    @IBAction func delgada(_ sender: Any) {
        self.masa(tipo: "Delgada")
    }
    
    @IBAction func gruesa(_ sender: Any) {
        self.masa(tipo: "Gruesa")
    }
    
    @IBAction func btnAtras(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func masa(tipo: String) {
        pizzaOrden.masa = tipo
        performSegue(withIdentifier: "TerceraViewController", sender: nil)
    }
    
}

