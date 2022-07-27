//
//  ViewController.swift
//  CurrencyRate
//
//  Created by yongseok lee on 2022/07/27.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var currencyTableView: UITableView!
    
    var currency = Currency(currencyRate: 1200, koreanWon: 0, USDoller: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyTableView.delegate = self
        currencyTableView.dataSource = self
        currencyTableView.register(UINib(nibName: CurrencyTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CurrencyTableViewCell.identifier)
    
       
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = currencyTableView.dequeueReusableCell(withIdentifier: CurrencyTableViewCell.identifier, for: indexPath) as? CurrencyTableViewCell else { return UITableViewCell()}
        cell.enterButton.tag = indexPath.row
        
        cell.currencyLabel.text = "\(currency.currencyRate)won/$"
        cell.resultLabel.text = "\(currency.exchangeWonToDoller)"
        
        return cell
    }

}

