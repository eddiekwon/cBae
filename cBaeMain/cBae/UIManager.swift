//
//  UIManager.swift
//  cBae
//
//  Created by muzna on 2020/11/08.
//

import UIKit

final class UIManager: NSObject {
  static let shared = UIManager()
  let window: UIWindow
  override init() {
    self.window = UIWindow(frame: UIScreen.main.bounds.insetBy(dx: 20, dy: 20))
    window.backgroundColor = UIColor.yellow
    window.makeKeyAndVisible()
    print("windows 만들어짐.") // 싱글턴이 불리면 자동으로 init도 호출됨. 아무 메소드를 호출하여도 이 init이 호출될 것임.
  }
  
  func activateLogger(){
    print("activateLogger 호출됨.")
  }
}
