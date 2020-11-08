//
//  NibExtension.swift
//  Lite101
//
//  Created by muzna on 2020/10/17.
//  Copyright © 2020 eddie. All rights reserved.
//

import UIKit

extension UIView {
    func loadNib(nibName: String? = nil) -> UIView {
        guard let nibName = nibName ?? type(of: self).description().components(separatedBy: ".").last else {
            fatalError("Could not load nib with name: \(type(of: self).description())")
        }
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        guard let unwrappedNib = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Could not instantiate view with name: \(nibName)")
        }
        
        return unwrappedNib
    }
}
