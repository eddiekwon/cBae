//
//  Storyboard+extension.swift
//  Lite101
//
//  Created by muzna on 2020/10/17.
//  Copyright © 2020 eddie. All rights reserved.
//


import UIKit

protocol Storyboard: class {
    static var defaultStoryboardName: String { get }
}

extension Storyboard where Self: UIViewController {
    static var defaultStoryboardName: String { String(describing: self) }
    
    static func storyboard() -> UIStoryboard { UIStoryboard(name: defaultStoryboardName, bundle: nil) }
    
    static func storyboardViewController() -> Self {
        guard let vc = storyboard().instantiateViewController(withIdentifier: defaultStoryboardName) as? Self else {
            fatalError("이름을 변경해주세요.: \(defaultStoryboardName)")
        }
        return vc
    } 
}

extension UIViewController: Storyboard { }

extension UIStoryboard {
    func instantiateViewController<T: UIViewController>(withClass: T.Type) -> UIViewController {
        let className = String(describing: withClass)
        return instantiateViewController(withIdentifier: className)
    }
}
