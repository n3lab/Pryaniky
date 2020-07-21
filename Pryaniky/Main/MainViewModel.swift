//
//  MainViewModel.swift
//  Pryaniky
//
//  Created by n3deep on 20.07.2020.
//  Copyright © 2020 n3deep. All rights reserved.
//

import Foundation

class MainViewModel {
    
    var pryanik: Pryanik?
    var selectedIndexPath: IndexPath?
    
    func fetchPryanik(completion: @escaping() -> ()) {
        let pryanikyManager = PryanikyManager()
        pryanikyManager.fetchPryanik(onSuccess: { pryanik in
            self.pryanik = pryanik
            completion()
        }, onFailed: { _ in
            print("fetch error")
        })
        
    }
}
