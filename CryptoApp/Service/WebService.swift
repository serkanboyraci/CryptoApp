//
//  WebService.swift
//  CryptoApp
//
//  Created by Ali serkan Boyracı  on 26.02.2023.
//

import Foundation

class Webservice {
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoElement]?) -> ()) { // escaping = after completion loading and use this func.
        // cryptoelemant is array beacuse of this we must use square brackets. Also we use it as a optional
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil) // if there is error no data will be taken
            } else if let data = data {
                let cryptolist = try? JSONDecoder().decode([CryptoElement].self, from: data)
                
                print(cryptolist)
                
                if let cryptolist = cryptolist {
                    completion(cryptolist)
                }
            }
        }.resume() // to start work
    }
}
