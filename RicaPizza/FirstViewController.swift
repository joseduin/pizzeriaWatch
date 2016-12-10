//
//  FirstViewController.swift
//  Pizzeria
//
//  Created by Jose Duin on 12/9/16.
//  Copyright © 2016 Jose Duin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    // Inicializa la pizza en todos sus atributos defaults
    var pizzaOrden: Pizza = Pizza(tamaño: "", masa: "", queso: "", ingredientes: [String]())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Rica Pizza"
        navigationController?.navigationBar.barTintColor = UIColor(red:205/255.0, green: 0/255.0, blue: 15/255.0, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondViewController" {
            
            let nav = segue.destination as! UINavigationController
            let addEventViewController = nav.topViewController as! SecondViewController
            
            addEventViewController.pizzaOrden = self.pizzaOrden
        }
    }
    
    
    @IBAction func pizza_chica(_ sender: Any) {
        self.tamaño(tama: "Chica")
    }
    
    
    @IBAction func pizza_media(_ sender: Any) {
        self.tamaño(tama: "Media")
    }
    
    @IBAction func pizza_grande(_ sender: Any) {
        self.tamaño(tama: "Grande")
    }
    
    
    func tamaño(tama: String) {
        pizzaOrden.tamaño = tama
        performSegue(withIdentifier: "SecondViewController", sender: nil)
    }
    
}

