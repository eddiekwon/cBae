//
//  ViewController.swift
//  Lite101
//
//  Created by muzna on 2020/10/17.
//  Copyright © 2020 eddie. All rights reserved.
//

import UIKit
/*
 ref: https://corykim0829.github.io//ios/UIScrollView-with-storyboard/#\
 
 step1:
     스크롤뷰에서 처음 만나게 되는 경고
     Has ambiguous scrollable content width/height
     
     uiview를 하나 추가해서 - Content layout guide 에 상하좌우 모두 0으로 constraint 설정
     uiview를 를 Frame layoutguide는 가로, 세로의 width,  height 동일하게 설정함.
     
     uiview가 UIStackView로 구성된 경우라면 그 속에 UILabel을 여러개 놓자. 10개정도?
     그리고 UIStackView -- Frame Layout guide의 width와 동일하게 하자.
     그리고 UIStackView -- Frame Layout guide의 height와 동일하게 하자. --> 이때 content hugging 에러 발생 -> height 의 priority를 250으로 만듬. -> 해결됨
 
 step2:
     innerScrollView를 추가해줌
     storyboard에서 scrollView속에 또 다른 scrollView_b를 추가한후에 scrollView_b 안에 subview를 추가할 수 없는 버그? 가 있는 것으로 보임
     따라서 scrollView_b를 추가하기 전에 그냥 uiview를 먼저 추가하고 scrollView속에 embed해준다 ( 우측하단 constraint icon에서 찾을 수 있다.)
 
 
 */
class HomeViewController: BaseViewController {

    @IBOutlet var goMarketButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

