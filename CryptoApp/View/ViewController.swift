//
//  ViewController.swift
//  CryptoApp
//
//  Created by Ali serkan Boyracı  on 14.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
      
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONdataSet/master/crypto.json")!
        Webservice().downloadCurrencies(url: url) { (cryptos) in
            if let cryptos = cryptos {
                
            }
        }
    }
    


}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        
        return cell 
    }
    
    
}

extension ViewController : UITableViewDelegate {
    
}

