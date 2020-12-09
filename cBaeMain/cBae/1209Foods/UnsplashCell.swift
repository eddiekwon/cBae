//
//  UnsplashCell.swift
//  cBae
//
//  Created by muzna on 2020/12/09.
//

import UIKit
import Kingfisher

/*
 
 tip: cellImageView 에서 layout 이 붉은색으로 에러를 나타낼 것임.
 witdh, height constraint가 없기 때문임
 사실 이미지 데이터가 들어오면 폭, 높이가 정해지기 때문에 문제가 없지만 IB에서 보기싫다.
 이를 해결하려면 xib - layout 쪽- intrinsic size 속성 - placeHolder를 추가하면 된다.(임시 크기를 정해줌)
 */

class UnsplashCell: UICollectionViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var cellImageView: UIImageView!
    @IBOutlet private weak var likeCountLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    func build(with cellModel: UnsplashModel) {
        
        cellImageView.contentMode = .scaleAspectFill
        titleLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.7)
        titleLabel.text = cellModel.alt_description
        titleLabel.textColor = UIColor.white
 
        //likeCountLabel.text = "xxx"
        
        guard let imgUrl = URL(string: cellModel.urls.thumb) else { return }
        cellImageView.kf.setImage(with: imgUrl,
                                  placeholder: nil,
                                  options: [.transition(.fade(1))])
//
//        layoutIfNeeded()
    }
     
}

extension String {
    var asImage: UIImage {
        return UIImage(named: self) ?? UIImage()
    }
    
    var asUrl: URL? {
        guard let imgUrl = URL(string: self) else { return nil }
        return imgUrl
    }
}
