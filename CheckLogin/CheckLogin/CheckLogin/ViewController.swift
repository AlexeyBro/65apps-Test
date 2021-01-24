//
//  ViewController.swift
//  CheckLogin
//
//  Created by Alex Bro on 24.09.2020.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var loginTextFied: UITextField!
    
    //Showing alert
    @IBAction func checkLogin(_ sender: UIButton) {
        LoginValidateImpl.shared.isAllowed(withLogin: loginTextFied.text) ?
            alert(withMessage: SystemMessage.correctLogin) :
            alert(withMessage: SystemMessage.wrongLogin)
    }

}




