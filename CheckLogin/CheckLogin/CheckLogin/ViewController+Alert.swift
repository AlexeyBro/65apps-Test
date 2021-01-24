//
//  ViewController+Alert.swift
//  CheckLogin
//
//  Created by Alex Bro on 27.09.2020.
//

import UIKit

extension ViewController {
    
    //Alert message
    func alert(withMessage message: String) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}
