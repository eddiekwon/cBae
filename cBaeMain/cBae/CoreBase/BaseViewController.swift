//
//  BaseViewController.swift
//  Lite101
//
//  Created by muzna on 2020/10/17.
//  Copyright © 2020 eddie. All rights reserved.
//

struct DisposeBag {
    init() {
        print("fake disposebag")
    }
}
import UIKit
//import RxSwift

class BaseViewController: UIViewController {
  
  private(set) var disposeBag = DisposeBag()
  private(set) lazy var className: String = {
    type(of: self).description().components(separatedBy: ".").last ?? ""
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
