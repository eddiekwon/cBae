//
//  SafeAsync.swift
//  Lite101
//
//  Created by muzna on 2020/10/18.
//  Copyright © 2020 eddie. All rights reserved.
//

import Foundation

extension DispatchQueue {
    
    func safeAsync(_ block: @escaping () -> Void) {
        if self === DispatchQueue.main && Thread.isMainThread {
            block()
        } else {
            async(execute: block)
        }
    }
}
