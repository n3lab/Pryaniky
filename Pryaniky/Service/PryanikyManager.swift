//
//  PryanikyManager.swift
//  Pryaniky
//
//  Created by n3deep on 20.07.2020.
//  Copyright © 2020 n3deep. All rights reserved.
//

import Foundation
import Alamofire

class PryanikyManager {
    
    let apiURL = "https://pryaniky.com/static/json/sample.json"
        
    func fetchPryanik(onSuccess: @escaping  (Pryanik) -> Void, onFailed: @escaping  (String) -> Void) {

        AF.request(apiURL,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: nil)
            .responseString { (response) in
                switch response.result {
                case .success(_):
                    if let pryanik: Pryanik = try? JSONDecoder().decode(Pryanik.self, from: response.data!) {

                        onSuccess(pryanik)
                    } else {
                        onFailed("error")
                    }
                case .failure(let error):
                    onFailed(error.errorDescription ?? "unknown error")
           }
        }

    }
}
