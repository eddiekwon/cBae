//
//  ViewModelType.swift
//  Lite101
//
//  Created by muzna on 2020/10/17.
//  Copyright © 2020 eddie. All rights reserved.
//

import Foundation

protocol ViewModelType {
  associatedtype Input
  associatedtype Output
  
  func transform(_ input: Input) -> Output
}
