//
//  LoginValidate.swift
//  CheckLogin
//
//  Created by Alex Bro on 29.09.2020.
//

import Foundation

protocol LoginValidate {
    func isAllowed(withLogin login: String?) -> Bool
}

final class LoginValidateImpl: LoginValidate {
    
    static let shared: LoginValidate = LoginValidateImpl()
    //Check the login for the specified conditions
    func isAllowed(withLogin login: String?) -> Bool {
        let regex = "^((?!([0-9/./-]))[a-zA-Z0-9/@/./-]{3,32})$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: login)
    }
}
