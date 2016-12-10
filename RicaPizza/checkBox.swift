//
//  checkBox.swift
//  Pizzeria
//
//  Created by Jose Duin on 12/9/16.
//  Copyright © 2016 Jose Duin. All rights reserved.
//

import UIKit

class checkBox: UIButton {
    
    let checkedImage = UIImage(named: "ic_check_box")! as UIImage
    let uncheckedImage = UIImage(named: "ic_indeterminate_check_box")! as UIImage
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: .normal)
                self.tintColor = UIColor(red:207/255.0, green: 0/255.0, blue: 15/255.0, alpha: 1)
            } else {
                self.setImage(uncheckedImage, for: .normal)
                self.tintColor = UIColor.lightGray
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(checkBox.buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
        self.isChecked = false
        self.tintColor = UIColor.lightGray
    }
    
    func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
    
}
