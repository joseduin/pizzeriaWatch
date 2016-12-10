//
//  ConfirmacionViewController.swift
//  Pizzeria
//
//  Created by Jose Duin on 12/9/16.
//  Copyright © 2016 Jose Duin. All rights reserved.
//

import UIKit

class ConfirmacionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tamaño: UILabel!
    @IBOutlet weak var masa: UILabel!
    @IBOutlet weak var queso: UILabel!
    @IBOutlet weak var ingredientes: UITableView!
    
    var listaIngrediente = [String]()
    
    // Inicializa la pizza en todos sus atributos defaults
    var pizzaOrden: Pizza = Pizza(tamaño: "", masa: "", queso: "", ingredientes: [String]())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientes.delegate = self
        ingredientes.dataSource = self
        ingredientes.separatorStyle = .none
        ingredientes.backgroundColor = UIColor.clear
        
        self.navigationItem.title = "Rica Pizza"
        navigationController?.navigationBar.barTintColor = UIColor(red:205/255.0, green: 0/255.0, blue: 15/255.0, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Actualizamos los campos
        tamaño.text = pizzaOrden.tamaño
        masa.text = pizzaOrden.masa
        queso.text = pizzaOrden.queso
        
        listaIngrediente.removeAll()
        for index in 0..<pizzaOrden.ingredientes.count {
            listaIngrediente.insert(pizzaOrden.ingredientes[index], at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            ingredientes.insertRows(at: [indexPath], with: .automatic)
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaIngrediente.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientesCellTableViewCell") as! IngredientesCellTableViewCell
        
        cell.ingrediente.text = listaIngrediente[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    @IBAction func cocinar(_ sender: Any) {
        mensaje(mensaje: "¿Seguro de mandar su pizza a la cocina? ")
    }
    
    @IBAction func btnAtras(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func buenApetito() {
        performSegue(withIdentifier: "ViewController", sender: nil)
    }
    
    func mensaje(mensaje: String) {
        let refreshAlert = UIAlertController(title: "Gerencia de Pizzeria", message: mensaje, preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            self.buenApetito()
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
}
