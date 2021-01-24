//
//  SystemMessage.swift
//  CheckLogin
//
//  Created by Alex Bro on 27.09.2020.
//

import Foundation

enum SystemMessage {
    static let wrongLogin = "The minimum login length is 3 characters, the maximum is 32.\nLogin can consist of Latin letters, numbers, minus and period.\nLogin cannot start with a number, period, minus."
    static let correctLogin = "Login is correct"
}
