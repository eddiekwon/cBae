//
//  ViewController.swift
//  Lite101
//
//  Created by muzna on 2020/10/17.
//  Copyright © 2020 eddie. All rights reserved.
//

import UIKit
/*
 
 스크롤뷰에서 처음 만나게 되는 경고
 Has ambiguous scrollable content width/height
 
 uiview를 하나 추가해서 - Content layout guide 에 상하좌우 모두 0으로 constraint 설정
 uiview를 를 Frame layoutguide는 가로, 세로의 width,  height 동일하게 설정함.
 
 uiview가 UIStackView로 구성된 경우라면 그 속에 UILabel을 여러개 놓자. 10개정도?
 그리고 UIStackView -- Frame Layout guide의 width와 동일하게 하자.
 그리고 UIStackView -- Frame Layout guide의 height와 동일하게 하자. --> 이때 content hugging 에러 발생 -> height 의 priority를 250으로 만듬. -> 해결됨
 
 */
class HomeViewController: BaseViewController {

    @IBOutlet var goMarketButton: UIButton!
    override func viewDidLoad() {
    super.viewDidLoad()
     
  }
}

