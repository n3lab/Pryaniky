//
//  PictureCellController.swift
//  Pryaniky
//
//  Created by n3deep on 21.07.2020.
//  Copyright © 2020 n3deep. All rights reserved.
//

import Foundation
import UIKit

class PictureCellController: TableCellController {
    
    //fileprivate let item: ListItem
    
    /*
    init(item: ListItem) {
        self.item = item
    }
    */
    
    fileprivate static var cellIdentifier: String {
        return String(describing: type(of: PictureCell.self))
    }
    
    static func registerCell(on tableView: UITableView) {
        tableView.register(UINib(nibName: cellIdentifier, bundle: Bundle(for: PictureCell.self)), forCellReuseIdentifier: cellIdentifier)
    }
    
    func cellFromTableView(_ tableView: UITableView, forIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: self).cellIdentifier, for: indexPath) as! PictureCell
        
        // Configure photo cell...
        
        return cell
    }
    
    func didSelectCell() {
        // Do something for photo...
    }
}
