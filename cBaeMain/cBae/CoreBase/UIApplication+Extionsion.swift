//
//  UIApplication+Extionsion.swift
//  Lite101
//
//  Created by muzna on 2020/10/18.
//  Copyright © 2020 eddie. All rights reserved.
//

import UIKit

extension UIApplication {
    static var delegateWindow: UIWindow? {
        guard let window = UIApplication.shared.delegate?.window else { return nil }

        return window
    }
    
}

//STD: JUST FOR FUN
extension UIApplication {
    
    /// shared.delegate 는 AppDelegate타입임.
    static func showMyAppDelegate() {
        guard let delegate = UIApplication.shared.delegate else { return }
        print("delegatetype is \(type(of: delegate))")
        // delegatetype is AppDelegate

    }
    static var myDelegateWindow: UIWindow? {
        guard let window = UIApplication.shared.delegate?.window else {
            return nil
        }
        return window
    }
}
