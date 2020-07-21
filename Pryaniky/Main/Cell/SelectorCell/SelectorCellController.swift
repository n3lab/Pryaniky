//
//  SelectorCellController.swift
//  Pryaniky
//
//  Created by n3deep on 21.07.2020.
//  Copyright © 2020 n3deep. All rights reserved.
//

import Foundation
import UIKit

class SelectorCellController: TableCellController, Alerts {

    fileprivate let cellData: CellData
    static let cellIdentifier = "SelectorCell"
    var alertsDelegate: Alerts?
    
    init(cellData: CellData) {
        self.cellData = cellData
    }

    static func registerCell(on tableView: UITableView) {
        tableView.register(SelectorCell.self, forCellReuseIdentifier: cellIdentifier)
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
    }
    
    func cellFromTableView(_ tableView: UITableView, forIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SelectorCellController.cellIdentifier, for: indexPath) as! SelectorCell
        
        cell.selectionStyle = .none
        cell.data = cellData
        cell.alertsDelegate = self
        return cell
    }
    
    func didSelectCell() {

    }
    
    func presentAlert(title: String, message: String) {
        
        alertsDelegate?.presentAlert(title: title, message: message)
    }
}
