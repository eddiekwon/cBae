//
//  ViewModelStub.swift
//  Lite101
//
//  Created by muzna on 2020/10/17.
//  Copyright © 2020 eddie. All rights reserved.
//

//import RxSwift

final class JustSampleViewModel: ViewModelType {
  let disponseBag = DisposeBag()
  
  struct Input {
    var count: Int = 0
  }
  
  struct Output {
  }
  
  func transform(_ input: Input) -> Output {
    Output()
  }
}
