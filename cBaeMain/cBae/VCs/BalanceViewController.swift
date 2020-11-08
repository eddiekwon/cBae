//
//  BalanceViewController.swift
//  Dot
//
//  Created by eddie on 16/05/2019.
//  Copyright © 2019 eddie. All rights reserved.
//

import UIKit

class BalanceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  @IBAction func goTab3(_ sender: Any) {
    
    // 코드로 탭바 인덱스를 변경하는 부분.
    if let tabbarController = UIApplication.shared.keyWindow?.rootViewController as? MainTabBarController{
      tabbarController.selectedIndex  = 2
    }
  } 

}
