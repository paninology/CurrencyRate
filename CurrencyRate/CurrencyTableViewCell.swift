//
//  CurrencyTableViewCell.swift
//  CurrencyRate
//
//  Created by yongseok lee on 2022/07/27.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {

    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var useTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    static let identifier = "CurrencyTableViewCell"
    
    @IBAction func enterButtonClicked(_ sender: UIButton) {
    }
    
    
    
}
