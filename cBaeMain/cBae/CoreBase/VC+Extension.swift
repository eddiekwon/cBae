//
//  VC+Extension.swift
//  Lite101
//
//  Created by muzna on 2020/10/17.
//  Copyright © 2020 eddie. All rights reserved.
//
 
import UIKit
import ObjectiveC

private func swizzle(_ vc: UIViewController.Type) {
    [
        (#selector(vc.viewDidLoad), #selector(vc.lap_viewDidLoad)),
        (#selector(vc.viewWillAppear(_:)), #selector(vc.lap_viewWillAppear(_:))),
        (#selector(vc.traitCollectionDidChange(_:)), #selector(vc.lap_traitCollectionDidChange(_:)))
    ].forEach { original, swizzled in
            
            guard let originalMethod = class_getInstanceMethod(vc, original),
                let swizzledMethod = class_getInstanceMethod(vc, swizzled) else { return }
            
            let didAddViewDidLoadMethod = class_addMethod(vc,
                                                          original,
                                                          method_getImplementation(swizzledMethod),
                                                          method_getTypeEncoding(swizzledMethod))
            
            if didAddViewDidLoadMethod {
                class_replaceMethod(vc,
                                    swizzled,
                                    method_getImplementation(originalMethod),
                                    method_getTypeEncoding(originalMethod))
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod)
            }
    }
}

private var hasSwizzled = false

extension UIViewController {
    class func doBadSwizzleStuff() {
        guard !hasSwizzled else { return }
        
        hasSwizzled = true
        swizzle(self)
    }
    
    @objc func lap_viewDidLoad() {
        self.lap_viewDidLoad()

        self.setupViews()
        self.bindViewModel()
        self.bindActions()
    }
    
    @objc func lap_viewWillAppear(_ animated: Bool) {
        self.lap_viewWillAppear(animated)
        
        if !self.hasViewAppeared {
            self.bindStyles()
            self.hasViewAppeared = true
        }
    }

    /**
    The entry point to initialize styles ( font, color ), data ( text, image, model etc... ) to UI elements ( JUST ONE ). Called just before `viewDidLoad`.

    Ex) titleLabel.color = .green
     titleLabel.text = "TEST"
     titleImageView.image = UIImage(named: "")
    */
    @objc open func setupViews() { }
    
    /**
     The entry point to bind all view model outputs. Called just before `viewDidLoad`.
     */
    @objc open func bindViewModel() { }
    @objc open func bindActions() { }
    /**
     The entry point to bind all styles to UI elements. Called just after `viewWillAppear`.
     */
    @objc open func bindStyles() { }
    
    @objc func lap_traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        self.lap_traitCollectionDidChange(previousTraitCollection)
        self.bindStyles()
    }
    
    private struct AssociatedKeys {
        static var hasViewAppeared: String = "hasViewAppeared"
    }
    
    // Helper to figure out if the `viewWillAppear` has been called yet
    private var hasViewAppeared: Bool {
        get {
            (objc_getAssociatedObject(self, &AssociatedKeys.hasViewAppeared) as? Bool) ?? false
        }
        set {
            objc_setAssociatedObject(self,
                                     &AssociatedKeys.hasViewAppeared,
                                     newValue,
                                     .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

