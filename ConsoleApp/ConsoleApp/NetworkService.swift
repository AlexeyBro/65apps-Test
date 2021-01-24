//
//  NetworkService.swift
//  ConsoleApp
//
//  Created by Alex Bro on 22.09.2020.
//

import Foundation
import Alamofire

final class NetworkService {
    
    func fetchRepos(withName name: String, completion: @escaping ([Repos]) -> Void) {
        let url = "https://api.github.com/users/\(name)/repos"
        AF.request(url).responseJSON { response in
            if let data = response.data {
                do {
                    let repos = try JSONDecoder().decode([Repos].self, from: data)
                    completion(repos)
                } catch {
                    print(SystemMessage.noUser)
                }
            }
        }
    }
}
