//
//  UIView+Swizzle.swift
//  Lite101
//
//  Created by muzna on 2020/10/17.
//  Copyright © 2020 eddie. All rights reserved.
//
 
import UIKit

private func swizzle(_ view: UIView.Type) {
    [(#selector(view.traitCollectionDidChange(_:)), #selector(view.lap_traitCollectionDidChange(_:)))]
        .forEach { original, swizzled in
            
            guard let originalMethod = class_getInstanceMethod(view, original),
                let swizzledMethod = class_getInstanceMethod(view, swizzled) else { return }
            
            let didAddViewDidLoadMethod = class_addMethod(view,
                                                          original,
                                                          method_getImplementation(swizzledMethod),
                                                          method_getTypeEncoding(swizzledMethod))
            
            if didAddViewDidLoadMethod {
                class_replaceMethod(view,
                                    swizzled,
                                    method_getImplementation(originalMethod),
                                    method_getTypeEncoding(originalMethod))
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod)
            }
        }
}

private var hasSwizzled = false

extension UIView {
    class func doBadSwizzleStuff() {
        guard !hasSwizzled else { return }
        
        hasSwizzled = true
        swizzle(self)
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        if layer.isKind(of: CATransformLayer.self) == false {
             //silent warning: <CATransformLayer: 0x600000228760> - changing property borderColor in transform-only layer, will have no effect
            self.setBorder(color: .red, width: 1.0)
        }
        
        self.setupViews()
        self.bindViewModel()
    }

    @objc func setupViews() { }
    
    @objc func bindStyles() { }
    
    @objc func bindViewModel() { }
    
    static var defaultReusableId: String {
        self.description()
            .components(separatedBy: ".")
            .dropFirst()
            .joined(separator: ".")
    }
    
    @objc func lap_traitCollectionDidChange(_ previousTraitCollection: UITraitCollection) {
        self.lap_traitCollectionDidChange(previousTraitCollection)
        self.bindStyles()
    }
}
