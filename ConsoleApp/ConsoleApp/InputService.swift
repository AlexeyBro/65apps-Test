//
//  InputService.swift
//  ConsoleApp
//
//  Created by Alex Bro on 22.09.2020.
//

import Foundation

final class InputService {
    
    private let networkSevice = NetworkService()
    
    func input() {
        print(SystemMessage.helloMessage)
        //Start a cycle for continuous operation of the application
        while true {
            let input = readLine()
            if let name = input {
                //Put the data entered into the terminal and get a list of repositories
                networkSevice.fetchRepos(withName: name) { repos in
                    !repos.isEmpty ? self.printRepos(withRepos: repos, userName: name) : print(SystemMessage.noRepos)
                }
                RunLoop.main.run(until: Date(timeIntervalSinceNow: 10))
            }
        }
    }
    //Print the list of repositories
    private func printRepos(withRepos repos: [Repos], userName: String) {
        print("\(SystemMessage.userRepos) '\(userName)':")
        repos.forEach { name in
            print("- \(name.name)")
        }
    }
}
