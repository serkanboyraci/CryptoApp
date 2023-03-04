//
//  CryptoViewModel.swift
//  CryptoApp
//
//  Created by Ali serkan Boyracı  on 4.03.2023.
//

import Foundation

// to use arrays
struct CryptoListViewModel {
    let cryptocurrencyList : [CryptoElement]
    /*
    func numberOfRowsInSection() -> Int {
        return self.cryptocurrencyList.count
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel { // to connect 2 viewmodels
        let crypto = self.cryptocurrencyList[index]
        return CryptoViewModel(cryptocurrency: crypto)
    }
    */
}

extension CryptoListViewModel { // ypu can use it with extensions, sb use it like this to test quickly and better.
    func numberOfRowsInSection() -> Int {
        return self.cryptocurrencyList.count
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel { // to connect 2 viewmodels
        let crypto = self.cryptocurrencyList[index]
        return CryptoViewModel(cryptocurrency: crypto)
    }
}

// to use only one crypto
struct CryptoViewModel {
    let cryptocurrency : CryptoElement
    
    var name : String {
        return self.cryptocurrency.currency!
    }
    
    var price : String {
        return self.cryptocurrency.price!
    }
}
