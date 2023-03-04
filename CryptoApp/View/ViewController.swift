//
//  ViewController.swift
//  CryptoApp
//
//  Created by Ali serkan Boyracı  on 14.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
 
    }
    
    func getData() {
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONdataSet/master/crypto.json")!
        Webservice().downloadCurrencies(url: url) { (cryptos) in
            if let cryptos = cryptos {
                
                self.cryptoListViewModel = CryptoListViewModel(cryptocurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    


}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        
        return cell 
    }
    
    
}

extension ViewController : UITableViewDelegate {
    
}

