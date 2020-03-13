//
//  LoginProtocols.swift
//  Task manager
//
//  Created by Macbook on 04.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import UIKit
import Foundation

protocol LoginViewProtocol: class {
    func onSignInMode()
    func onSignUpMode()
}

protocol LoginPresenterProtocol: class {
    func loginAction(email: String?, password: String?, confirmPassword: String?)
    func authorizeSuccess()
    func authorizeFailure(error: Error)
}

protocol LoginInteractorProtocol: class {
    func authorize(email: String, password: String)
    func register(email: String, password: String, confirmPassword: String)
}

protocol LoginRouterProtocol: class {
     func close()
}
