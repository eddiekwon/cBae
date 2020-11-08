//
//  ManTab.swift
//  cBae
//
//  Created by muzna on 2020/11/08.
//

import UIKit

class MainTabBarController: UITabBarController, PhotoPickable {
  var pickerController: UIImagePickerController?
  
 
  override func viewDidLoad() {
    super.viewDidLoad()
    initSubViewControllers()
    self.delegate = self
  }
  
  func initSubViewControllers(){
   
    let vcLeft = HomeViewController.storyboardViewController()
    let vcRight = SettingViewController.storyboardViewController()
    let vcCenterFaked = UIViewController()
    
    vcLeft.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 0)
    vcRight.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
    vcCenterFaked.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0) // fake vc.
    
    self.viewControllers = [vcLeft,vcCenterFaked, vcRight]
  }
}
extension MainTabBarController:UITabBarControllerDelegate{
  
  /// 아래 메소드는 사용자가 Tap 할 때만 반응함.
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    
    // 가운데 Tab을 선택하면 카메라를 호출하게 이벤트를 가로챔.
    if viewControllers?.firstIndex(of: viewController) == 1 { // 가운데 뷰 인덱스.
      //showCamera()
      return false
    }
    return true
  }
}
