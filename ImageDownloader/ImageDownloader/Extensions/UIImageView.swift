//
//  UIImageView.swift
//  ImageDownloader
//
//  Created by Alex Bro on 22.01.2021.
//

import UIKit

extension UIImageView {
    
    convenience init(image: UIImage? = nil,
                     contentMode: UIView.ContentMode = .scaleAspectFit) {
            self.init()
            
            self.image = image
            self.contentMode = contentMode
        }
}
