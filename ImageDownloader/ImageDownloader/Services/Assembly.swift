//
//  Assembly.swift
//  ImageDownloader
//
//  Created by Alex Bro on 22.01.2021.
//

import UIKit

enum Modules {
    case mainView
}

protocol Assembly {
    func makeModule(module: Modules) -> UIViewController
}

final class AssemblyImpl: Assembly {
    
    private let imageDownloader = ImageDownloaderImpl()
    private let cacheManager = CacheManagerImpl()
    private let urlManager = URLManagerImpl()
    
    init() {
        imageDownloader.cacheManager = cacheManager
    }
    
    func makeModule(module: Modules) -> UIViewController {
        switch module {
        case .mainView:
            return makeMainView()
        }
    }
    
    private func makeMainView() -> UIViewController {
        let viewModel = ViewModelImpl(imageDownloader: imageDownloader, urlManager: urlManager)
        let viewController = ViewController(viewModel: viewModel)
        viewModel.view = viewController
        return viewController
    }
}
