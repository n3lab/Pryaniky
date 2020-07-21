//
//  SelectorCell.swift
//  Pryaniky
//
//  Created by n3deep on 21.07.2020.
//  Copyright © 2020 n3deep. All rights reserved.
//

import UIKit

class SelectorCell: UITableViewCell {

    @IBOutlet weak var pickerView: UIPickerView!
    
    var alertsDelegate: Alerts? 
    
    var data: CellData? {
        didSet {
            pickerView.reloadAllComponents()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        pickerView.selectedRow(inComponent: data?.selectedId ?? 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension SelectorCell: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data?.variants?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return data?.variants?[row].text
    }
}

extension SelectorCell: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("selected id: \(data?.variants?[row].id ?? 0), name: \(String(describing: data?.variants?[row].text))")
        
        if let variant = data?.variants?[row].text {
            alertsDelegate?.presentAlert(title:"Селектор", message: "Выбрано: \(variant)")
        }
    }
}
