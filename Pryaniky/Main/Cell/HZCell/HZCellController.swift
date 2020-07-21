//
//  MainTableCellController.swift
//  Pryaniky
//
//  Created by n3deep on 21.07.2020.
//  Copyright © 2020 n3deep. All rights reserved.
//

import Foundation
import UIKit

class HZCellController: TableCellController {
    
    fileprivate let cellData: CellData
    static let cellIdentifier = "HZCell"
    var alertsDelegate: Alerts?
    
    init(cellData: CellData) {
        self.cellData = cellData
    }
        
    static func registerCell(on tableView: UITableView) {
        tableView.register(HZCell.self, forCellReuseIdentifier: cellIdentifier)
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
}
    
    func cellFromTableView(_ tableView: UITableView, forIndexPath indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: type(of: self).cellIdentifier, for: indexPath) as! HZCell
    
        let cell = tableView.dequeueReusableCell(withIdentifier: HZCellController.cellIdentifier, for: indexPath) as! HZCell
        
        cell.selectionStyle = .none
        cell.nameLabel.text = cellData.text
        
        return cell
    }
    
    func didSelectCell() {
        print("name: \(String(describing: cellData.text))")
        
        if let name = cellData.text {
            alertsDelegate?.presentAlert(title:"Текст", message: "Выбрано: \(name)")
        }
    }
}
