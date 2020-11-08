//
//  View+Extension.swift
//  Lite101
//
//  Created by muzna on 2020/10/17.
//  Copyright © 2020 eddie. All rights reserved.
//

import UIKit
 
extension UIView {
    @IBInspectable public var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
        get {
            layer.cornerRadius
        }
    }
    
    @IBInspectable public var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            
            return UIColor(cgColor: color)
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            layer.borderWidth
        }
    }

    func setBorder(color: UIColor?, width: CGFloat) {
        borderColor = color
        borderWidth = width
    }
 
    func drawBoldLines() -> UIView {
      setBorder(color: UIColor.red, width: 0.5)
      return self
    }
}
