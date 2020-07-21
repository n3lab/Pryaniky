//
//  Pryanik.swift
//  Pryaniky
//
//  Created by n3deep on 20.07.2020.
//  Copyright © 2020 n3deep. All rights reserved.
//

import Foundation

struct Pryanik: Codable {
    
    let data: [Data]
    let view: [String]
}

struct Data: Codable {

    let name: String
    var data: CellData
}

struct CellData: Codable {

    let text: String?
    let url: String?
    var selectedId: Int?
    let variants: [DataSelectorVariants]?
}

struct DataSelectorVariants: Codable {
    
    let id: Int
    let text: String
}
