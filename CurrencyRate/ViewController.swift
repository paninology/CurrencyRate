//
//  ViewController.swift
//  CurrencyRate
//
//  Created by yongseok lee on 2022/07/27.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var currencyTableView: UITableView!
    
    var currency = [
        Currency(currencyName: "USD",currencyRate: 1200, koreanWon: 0, foreignCurrency: 0),
        Currency(currencyName: "Euro", currencyRate: 1300, koreanWon: 0, foreignCurrency: 0)
    ] {
        didSet {
            currencyTableView.reloadData()
        }
    
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyTableView.delegate = self
        currencyTableView.dataSource = self
        currencyTableView.register(UINib(nibName: CurrencyTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CurrencyTableViewCell.identifier)
    
       
    }
    @objc func enterButtonClicked(sender: UIButton) {
        view.endEditing(true)
        // 여기서 텍스트필드값을 어떻게 받아오느냐ㅣ........현재로서는 키보드 엔터를 반드시 쳐야 입력됨
        //태그를 이용해서 인덱스패스로 셀을 찾아서 필드값을 가져올 수 있을까...
        let indexpath = IndexPath(row: sender.tag, section: 0)
        let cell = currencyTableView.cellForRow(at: indexpath) as! CurrencyTableViewCell
        
        currency[sender.tag].exchangeWonToDoller = Double(cell.userTextField.text!) ?? 0

    }
    
    @objc func userTextFieldEntered(sender: UITextField) {

        currency[sender.tag].exchangeWonToDoller = Double(sender.text ?? "") ?? 0
        print(currency[sender.tag].exchangeWonToDoller)
//        sender.text = nil
       
    }
    
    func updateLabels() {
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currency.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = currencyTableView.dequeueReusableCell(withIdentifier: CurrencyTableViewCell.identifier, for: indexPath) as? CurrencyTableViewCell else { return UITableViewCell()}
        
        cell.userTextField.tag = indexPath.row
        cell.userTextField.placeholder = "한화 액수 입력"
        cell.userTextField.addTarget(self, action: #selector(userTextFieldEntered), for: .editingDidEndOnExit)
        cell.enterButton.tag = indexPath.row
        cell.enterButton.addTarget(self, action: #selector(enterButtonClicked), for: .touchUpInside)
        
        cell.currencyLabel.text =   "\(currency[indexPath.row].currencyRate)won/\(currency[indexPath.row].currencyName)"  // currency로 옮길것 컴퓨티드로
        cell.resultLabel.text = "\((round(currency[indexPath.row].exchangeWonToDoller*100)/100))\(currency[indexPath.row].currencyName)"
        
        return cell
    }

}

