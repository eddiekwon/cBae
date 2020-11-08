//
//  AppDelegate.swift
//  cBae
//
//  Created by muzna on 2020/11/08.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIManager.shared.activateLogger()
        /*
         
         2019-06-12 15:35:40.396750+0900 Dot[14510:3687618] *** Assertion failure in -[UIApplication _runWithMainScene:transitionContext:completion:], /BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKitCore/UIKit-3698.119.2/UIApplication.m:3861
         2019-06-12 15:35:40.396991+0900 Dot[14510:3687618] *** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Application windows are expected to have a root view controller at the end of application launch'
         *** First throw call stack:
         (0x1aa6be3a8 0x1a98c3d00 0x1aa5d3780 0x1ab0ae32c 0x1d798ebc0 0x1d7220e4c 0x1d7229828 0x1d7220ab4 0x1d72213d0 0x1d721f618 0x1d721f2d4 0x1d7224004 0x1d7224e5c 0x1d7223eb8 0x1d7228ea8 0x1d798cca0 0x1d756f408 0x1ad07ffd0 0x1ad08a31c 0x1ad089a6c 0x100968778 0x10096c33c 0x1ad0bd18c 0x1ad0bce08 0x1ad0bd404 0x1aa64e444 0x1aa64e3c0 0x1aa64dc7c 0x1aa648950 0x1aa648254 0x1ac887d8c 0x1d79904c0 0x100643afc 0x1aa104fd8)
         libc++abi.dylib: terminating with uncaught exception of type NSException
         
         rootViewController를 지정해주어야 함. 아니면 이런 에러가 발생함.
         
        */
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()  as? MainTabBarController  {
          UIManager.shared.window.rootViewController = viewController
        }
        
        return true
    }

}
