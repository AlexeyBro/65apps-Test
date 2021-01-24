//
//  Coordinator.swift
//  ImageDownloader
//
//  Created by Alex Bro on 22.01.2021.
//

import UIKit

protocol Coordinator {
    func start()
}

final class CoordinatorImpl: Coordinator {
    
    private let window: UIWindow
    private let assembly: Assembly?
    
    init(window: UIWindow, assembly: Assembly?) {
        self.window = window
        self.assembly = assembly
    }
    
    func start() {
        let viewController = assembly?.makeModule(module: .mainView)
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
