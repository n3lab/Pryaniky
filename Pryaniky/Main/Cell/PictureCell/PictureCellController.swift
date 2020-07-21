//
//  PictureCellController.swift
//  Pryaniky
//
//  Created by n3deep on 21.07.2020.
//  Copyright © 2020 n3deep. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class PictureCellController: TableCellController {
    
    fileprivate let cellData: CellData
    static let cellIdentifier = "PictureCell"
    var alertsDelegate: Alerts?
    
    init(cellData: CellData) {
        self.cellData = cellData
    }
        
    static func registerCell(on tableView: UITableView) {
        tableView.register(PictureCell.self, forCellReuseIdentifier: cellIdentifier)
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
    }
    
    func cellFromTableView(_ tableView: UITableView, forIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PictureCellController.cellIdentifier, for: indexPath) as! PictureCell
        
        cell.selectionStyle = .none
        cell.nameLabel.text = cellData.text
        
        if let url = URL(string: cellData.url ?? "") {
            cell.pictureImageView.kf.setImage(with: url)
        }

        return cell
    }
    
    func didSelectCell() {
        print("name: \(String(describing: cellData.text))")
        
        if let name = cellData.text {
            alertsDelegate?.presentAlert(title:"Картинка", message: "Выбрано: \(name)")
        }
    }
}
