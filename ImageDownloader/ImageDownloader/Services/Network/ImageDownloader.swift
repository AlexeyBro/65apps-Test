//
//  ImageDownloader.swift
//  ImageDownloader
//
//  Created by Alex Bro on 22.01.2021.
//

import UIKit

protocol ImageDownloaderDelegat: AnyObject {
    func loadDidFinish()
}

protocol ImageDownloader: AnyObject {
    var delegat: ImageDownloaderDelegat? { get set }
    func downloadImage(withURL url: URL, cell: UITableViewCell)
}

final class ImageDownloaderImpl: ImageDownloader {
    
    weak var cacheManager: CacheManager?
    weak var delegat: ImageDownloaderDelegat?
    
    func downloadImage(withURL url: URL, cell: UITableViewCell) {
        //Сheck if the image is in the cache
        if let cacheImage = cacheManager?.checkImageCache(forKey: url) {
            DispatchQueue.main.async {
                if let cell = cell as? TableViewCell {
                    cell.imageCell.image = nil
                    cell.imageCell.image = cacheImage
                }
            }
        } else {
            let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10)
            URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
                guard let self = self else { return }
                let response = response as? HTTPURLResponse
                if let error = error {
                    print(error.localizedDescription)
                    return
                } else if let data = data,
                          response?.statusCode == 200,
                          let image = UIImage(data: data) {
                    //Put the picture in the cache
                    self.cacheManager?.putImageCache(withImage: image, forKey: url)
                    DispatchQueue.main.async {
                        if let cell = cell as? TableViewCell {
                            cell.imageCell.image = nil
                            cell.imageCell.image = image
                            self.delegat?.loadDidFinish()
                        }
                    }
                }
            }.resume()
        }
    }
}
