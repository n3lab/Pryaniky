//
//  MainCellFactory.swift
//  Pryaniky
//
//  Created by n3deep on 21.07.2020.
//  Copyright © 2020 n3deep. All rights reserved.
//

import Foundation
import UIKit

enum CellType: String {
    case hz = "hz"
    case picture = "picture"
    case selector = "selector"
}

class MainCellControllerFactory {
    
    func registerCells(on tableView: UITableView) {
        HZCellController.registerCell(on: tableView)
        PictureCellController.registerCell(on: tableView)
        SelectorCellController.registerCell(on: tableView)
    }
    
    func cellControllers(with pryanik: Pryanik) -> [TableCellController] {
        print(pryanik)
        return pryanik.view.map { cellType in

            switch cellType {
            case CellType.hz.rawValue:
                let hzData = pryanik.data.filter{ $0.name == CellType.hz.rawValue }
                let cellController = HZCellController(cellData: hzData.map{ $0.data }[0] )
                return cellController
            case CellType.picture.rawValue:
                let pictureData = pryanik.data.filter{ $0.name == CellType.picture.rawValue }
                let cellController = PictureCellController(cellData: pictureData.map{ $0.data }[0] )
                return cellController
            case CellType.selector.rawValue:
                let selectorData = pryanik.data.filter{ $0.name == CellType.selector.rawValue }
                let cellController = SelectorCellController(cellData: selectorData.map{ $0.data }[0] )
                return cellController
            default:
                let hzData = pryanik.data.filter{ $0.name == CellType.hz.rawValue }
                let cellController = HZCellController(cellData: hzData.map{ $0.data }[0] )
                return cellController
            }
        }
    }
}
