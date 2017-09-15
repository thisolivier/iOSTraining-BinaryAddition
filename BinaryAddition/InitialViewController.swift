//
//  InitialViewController.swift
//  BinaryAddition
//
//  Created by Olivier Butler on 14/09/2017.
//  Copyright © 2017 Olivier Butler. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController, UITableViewDataSource, DataCellProtocol{
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var multiplierChoicesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        multiplierChoicesTableView.dataSource = self
        multiplierChoicesTableView.allowsSelection = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func updateTotal(deltaVal:Int){
        var newVal = deltaVal
        if let currentString = totalLabel.text {
            let componentsOfString = currentString.components(separatedBy: " ")
            if componentsOfString.count == 2, let currentValue = Int(componentsOfString[1]) {
                print(currentValue)
                newVal = currentValue + deltaVal
            }
        }
        if newVal >= 0{
            totalLabel.text = "Total: \(newVal)"
        } else {
            totalLabel.text = "Total: 0"
        }
    }
    // Delegated actions from cells
    func dataCellButton1Pressed(parentCell: DataCell) {
        print("Button 1 Pressed")
        if let numberAsString = parentCell.dataCellLabel.text{
            let number = Int(numberAsString)
            updateTotal(deltaVal: number ?? 0)
        }
        
    }
    
    func dataCellButton2Pressed(parentCell: DataCell) {
        print("Button 2 Pressed")
        if let numberAsString = parentCell.dataCellLabel.text{
            let number = (Int(numberAsString) ?? 0) * -1
            updateTotal(deltaVal: number)
        }
    }
    
    // Protocol methods for Table Data Source
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCell = tableView.dequeueReusableCell(withIdentifier: "DataCell") as! DataCell
        newCell.backgroundColor = newCell.contentView.backgroundColor
        newCell.delegate = self
        let intForText = pow(10, Double(indexPath.row))
        newCell.dataCellLabel.text = "\(Int(intForText))"
        for button in newCell.addMinusButtons{
            button.layer.cornerRadius = 10
        }
        return newCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
}
