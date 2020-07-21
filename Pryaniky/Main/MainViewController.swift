//
//  MainViewController.swift
//  Pryaniky
//
//  Created by n3deep on 20.07.2020.
//  Copyright © 2020 n3deep. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MainViewModel?
        
    fileprivate var cellControllers = [TableCellController]()
    fileprivate let cellControllerFactory = MainCellControllerFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        
         
        cellControllerFactory.registerCells(on: tableView)
            
        viewModel = MainViewModel()
        viewModel?.fetchPryanik(completion: { [weak self] in
            DispatchQueue.main.async {
                if let pryanik = self!.viewModel?.pryanik {
                    self!.cellControllers = self!.cellControllerFactory.cellControllers(with: pryanik)
                    
                    for var cellController in self!.cellControllers {
                        cellController.alertsDelegate = self
                    }

                }
                self?.tableView.reloadData()
            }
        })
        
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cellControllers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return cellControllers[indexPath.row].cellFromTableView(tableView, forIndexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellControllers[indexPath.row].didSelectCell()
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension MainViewController: Alerts {

    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
