//
//  LoginRouter.swift
//  Task manager
//
//  Created by Macbook on 03.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import Foundation

class LoginRouter: LoginRouterProtocol {
    
    func close() {
        AppRouter.presentInitialVC()
    }
    
    func showAlert(error: Error) {
        AppRouter.presentAlert(error: error)
    }

}
