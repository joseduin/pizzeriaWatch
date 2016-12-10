//
//  IngredientesCellTableViewCell.swift
//  Pizzeria
//
//  Created by Jose Duin on 12/10/16.
//  Copyright © 2016 Jose Duin. All rights reserved.
//

import UIKit

class IngredientesCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ingrediente: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
