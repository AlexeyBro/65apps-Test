//
//  ViewModel.swift
//  ImageDownloader
//
//  Created by Alex Bro on 22.01.2021.
//

import UIKit

protocol ViewModel {
    var numberOfRows: Int { get }
    func downloadImage(withURL url: URL, cell: UITableViewCell)
    func createURL(whithIndex index: Int) -> URL?
}

final class ViewModelImpl: ViewModel {
    
    var numberOfRows = 100
    weak var view: View?
    private weak var imageDownloader: ImageDownloader?
    private var urlManager: URLManager?
    
    init(imageDownloader: ImageDownloader?, urlManager: URLManager?) {
        self.imageDownloader = imageDownloader
        self.urlManager = urlManager
        self.imageDownloader?.delegat = self
    }
    
    func createURL(whithIndex index: Int) -> URL? {
        urlManager?.createURL(whithIndex: index)
    }
    
    func downloadImage(withURL url: URL, cell: UITableViewCell) {
        imageDownloader?.downloadImage(withURL: url, cell: cell)
    }
}

//MARK: - ImageDownloaderDelegat
extension ViewModelImpl: ImageDownloaderDelegat {
    func loadDidFinish() {
        view?.refreshView()
    }
}
