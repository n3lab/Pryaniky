//
//  MainTableCellController.swift
//  Pryaniky
//
//  Created by n3deep on 21.07.2020.
//  Copyright © 2020 n3deep. All rights reserved.
//

import Foundation
import UIKit

protocol TableCellController {
    
    static func registerCell(on tableView: UITableView)
    func cellFromTableView(_ tableView: UITableView, forIndexPath indexPath: IndexPath) -> UITableViewCell
    func didSelectCell()
    
    var alertsDelegate: Alerts? { get set }
}
