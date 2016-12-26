//
//  Pizza.swift
//  RicaPizza
//
//  Created by Jose Duin on 12/25/16.
//  Copyright © 2016 Jose Duin. All rights reserved.
//

import Foundation

class Pizza {
    
    var tamaño: String
    var masa: String
    var queso: String
    var ingredientes: [String]
    
    // Inicializacion convencional
    init(tamaño: String, masa: String, queso: String, ingredientes: [String]) {
        self.tamaño = tamaño
        self.masa = masa
        self.queso = queso
        self.ingredientes = ingredientes
    }
    
    convenience init() {
        self.init(tamaño: "", masa: "", queso: "", ingredientes: [String]())
    }
    
}
