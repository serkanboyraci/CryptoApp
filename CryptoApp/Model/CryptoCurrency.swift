//
//  CryptoCurrency.swift
//  CryptoApp
//
//  Created by Ali serkan Boyracı  on 26.02.2023.
//

import Foundation

struct CryptoElement: Decodable { // to take data from API and show
    // Encodable to send data to server
    // Codable to use together
    var currency: String?
    var price: String?
}
