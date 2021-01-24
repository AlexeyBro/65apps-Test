//
//  CacheManager.swift
//  ImageDownloader
//
//  Created by Alex Bro on 22.01.2021.
//

import UIKit

protocol CacheManager: AnyObject {
    func putImageCache(withImage image: UIImage, forKey: URL)
    func checkImageCache(forKey key: URL) -> UIImage?
}

final class CacheManagerImpl: CacheManager {
    
    private let cache = NSCache<NSString, UIImage>()
    
    func putImageCache(withImage image: UIImage, forKey: URL) {
        cache.setObject(image, forKey: forKey.absoluteString as NSString)
    }
    
    func checkImageCache(forKey key: URL) -> UIImage? {
        let cacheImage = cache.object(forKey: key.absoluteString as NSString)
        return cacheImage
    }
}
