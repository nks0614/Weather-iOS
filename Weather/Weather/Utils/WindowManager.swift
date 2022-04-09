//
//  WindowManager.swift
//  Weather
//
//  Created by nkstar on 2022/04/05.
//

import Foundation
import UIKit

final class WindowManager {
    
    private var window: UIWindow
    
    init(with window: UIWindow = UIWindow()) {
        self.window = window
    }
    
    convenience init(with scene: UIWindowScene) {
        let window = UIWindow(windowScene: scene)
        self.init(with: window)
    }
    
    func setRootViewController(_ controller: UIViewController = MainViewController()) {
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }
}
