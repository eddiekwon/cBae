//
//  SettingViewController.swift
//  Dot
//
//  Created by eddie on 16/05/2019.
//  Copyright © 2019 eddie. All rights reserved.
//

import UIKit
/*
 
 다운로드 https://developer.apple.com/sf-symbols/
 
 */

private let dataSource = [ "About", "event","ARS", "Preference", "version info"]

class SettingViewController: UIViewController {
   
    @IBOutlet var tableView: UITableView!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
    
    func setupTableView(){
         
    }
  
}
extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return dataSource.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        if indexPath.section == 0 {
            let id = String(describing: SettingTopCell.self)
            let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
            return cell
        } else {
            let id = String(describing: KeyValueCell.self)
            let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! KeyValueCell
            cell.leftTitleLabel.text = dataSource[indexPath.row]
            return cell
        }
    
    }
    
    
}
