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
            delegate?.dataCellButton2Pressed()
        }
    }
    @IBAction func do1ButtonPressed(_ sender: UIButton) {
        if let _ = delegate {
            delegate?.dataCellButton1Pressed()
        }
    }
}

protocol DataCellProtocol {
    func dataCellButton1Pressed()
    func dataCellButton2Pressed()
}
