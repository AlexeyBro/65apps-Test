//
//  URLService.swift
//  ImageDownloader
//
//  Created by Alex Bro on 22.01.2021.
//

import UIKit

protocol URLManager {
    func createURL(whithIndex index: Int) -> URL?
}

final class URLManagerImpl: URLManager {
    
    func createURL(whithIndex index: Int) -> URL? {
        let baseURL = Constants.host + Constants.body + Constants.textParam
        return URL(string: "\(baseURL)\(index + 1)")
    }
}

enum Constants {
    static let host = "https://placehold.it/"
    static let body = "375x150"
    static let textParam = "?text="
}
