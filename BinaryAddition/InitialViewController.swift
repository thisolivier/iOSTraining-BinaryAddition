//
//  InitialViewController.swift
//  BinaryAddition
//
//  Created by Olivier Butler on 14/09/2017.
//  Copyright © 2017 Olivier Butler. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController, UITableViewDataSource, DataCellProtocol{
    @IBOutlet weak var multiplierChoicesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        multiplierChoicesTableView.dataSource = self
        multiplierChoicesTableView.allowsSelection = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Delegated actions from cells
    func dataCellButton1Pressed() {
        print("Button 1 Pressed")
    }
    
    func dataCellButton2Pressed() {
        print("Button 2 Pressed")
    }
    
    // Protocol methods for Table Data Source
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCell = tableView.dequeueReusableCell(withIdentifier: "DataCell") as! DataCell
        newCell.backgroundColor = newCell.contentView.backgroundColor
        newCell.delegate = self
        let intForText = pow(10, Double(indexPath.row))
        newCell.dataCellLabel.text = "\(intForText)"
        for button in newCell.addMinusButtons{
            button.layer.cornerRadius = 10
        }
        return newCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
}
