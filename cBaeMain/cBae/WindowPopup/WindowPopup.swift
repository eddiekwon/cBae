//
//  WindowPopup.swift
//  Dot
//
//  Created by eddie on 16/05/2019.
//  Copyright © 2019 eddie. All rights reserved.
//

import UIKit

typealias BoolVoid = (_ isAction: Bool) -> Void
private var windows: [UIWindow] = []

class WindowPopup: UIViewController{
  class func show(title: String?, message: String?, handler:@escaping BoolVoid ){
    let storyboard = UIStoryboard(name: "Popup", bundle: nil)
    let popup = storyboard.instantiateViewController(withIdentifier: "WindowPopup") as! WindowPopup
    WindowPopup.showWindow(type: .alert , sender: popup)
    popup.buttonHandler = handler
    popup.contentView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
    
    UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: [.curveEaseOut], animations: {
      popup.contentView.transform = CGAffineTransform.identity
    }, completion: nil)
  }
  @IBOutlet weak var contentView: UIView!
  var buttonHandler: BoolVoid?
  
  // ====================================================================
  // ====================================================================
  
  // ---------- 보여주고 --------------
  static func showWindow(type:WindowType, sender: UIViewController ){
    
    var window = findSameLevelWindow(type: type)
    if windows.isEmpty {
      let newWindow = UIWindow(frame: UIScreen.main.bounds)
      newWindow.backgroundColor = UIColor.blue
      newWindow.windowLevel = type.getWindowLabel()
      newWindow.makeKeyAndVisible()
      windows.append(newWindow)
      window = newWindow
      
    }else{
      window?.rootViewController?.view.removeFromSuperview()
    }
    window?.rootViewController = sender
  }
  
  // -------------- 숨기고 --------------
  static func hideWindow(type:WindowType){
    guard let window = self.findSameLevelWindow(type: type) else {return}
    
    window.removeFromSuperview()
    if let idx = windows.firstIndex(of: window) {
      windows.remove(at: idx)
    }
  }
  
  // ====================================================================
  // ====================================================================
  
  static func findSameLevelWindow(type: WindowType)->UIWindow?{
    return windows.first(where: {$0.windowLevel == type.getWindowLabel() })
  }
  @IBAction func onCancel(_ sender: UIButton) {
    self.buttonHandler?(false)
    WindowPopup.hideWindow(type:.alert)
  }
  @IBAction func onDone(_ sender: UIButton) {
    self.buttonHandler?(true)
    WindowPopup.hideWindow(type:.alert)
  }
  
}

enum WindowType: Int{
  case normal,alert, loadingIndicator
  
  func getWindowLabel() -> UIWindow.Level{
    var level: UIWindow.Level
    switch self  {
    case .normal:
      level = UIWindow.Level.normal + 100
    case .alert:
      level = UIWindow.Level.normal + 200
    case .loadingIndicator:
      level = UIWindow.Level.normal + 300
    }
    return level
  }
}
