//
//  DataCellClass.swift
//  BinaryAddition
//
//  Created by Olivier Butler on 14/09/2017.
//  Copyright © 2017 Olivier Butler. All rights reserved.
//

import UIKit

class DataCell: UITableViewCell{
    var delegate:InitialViewController?
    
    @IBOutlet var addMinusButtons: [UIButton]!
    @IBOutlet weak var dataCellLabel: UILabel!
    
    @IBAction func do2ButtonPressed(_ sender: UIButton) {
        if let _ = delegate {
            if dataCellLabel.text != nil{
                delegate?.dataCellButton2Pressed(parentCell: self)
            }
            
        }
    }
    @IBAction func do1ButtonPressed(_ sender: UIButton) {
        if let _ = delegate {
            if dataCellLabel.text != nil{
                delegate?.dataCellButton1Pressed(parentCell: self)
            }
        }
    }
}

protocol DataCellProtocol {
    func dataCellButton1Pressed(parentCell: DataCell)
    func dataCellButton2Pressed(parentCell: DataCell)
}
