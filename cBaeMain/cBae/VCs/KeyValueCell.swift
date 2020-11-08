//
//  KeyValueCell.swift
//  cBae
//
//  Created by muzna on 2020/11/08.
//

import UIKit

class KeyValueCell: BaseCell {

    @IBOutlet weak var leftTitleLabel: UILabel!
    @IBOutlet weak var rightTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareUI()
    }
    
   
    private func prepareUI() {
        leftTitleLabel.font = .boldSystemFont(ofSize: 15)
        leftTitleLabel.textColor = .gray
        rightTitleLabel.font = .systemFont(ofSize: 14)
        rightTitleLabel.textColor = .black
    }
}
