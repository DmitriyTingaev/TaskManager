//
//  LoginInteractor.swift
//  Task manager
//
//  Created by Macbook on 03.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import Foundation

class LoginInteractor: LoginInteractorProtocol {
    
    weak var presenter: LoginPresenterProtocol!
    
    init(_ presenter: LoginPresenter) {
        self.presenter = presenter
    }

    func authorize(email: String, password: String) {
        AppRouter.showLoader()
        SessionService.shared().authorize(path: .auth, email: email, password: password, success: {
            AppRouter.hideLoader()
            self.presenter.authorizeSuccess()
        }) { error in
            AppRouter.hideLoader()
            AppRouter.presentAlert(error: error)
        }
    }
    
    func register(email: String, password: String, confirmPassword: String) {
        
        if password != confirmPassword {
            AppRouter.presentAlert(title: "Validation error", message: "Passwords do not match")
            return
        }
        
        AppRouter.showLoader()
        SessionService.shared().authorize(path: .register, email: email, password: password, success: {
            AppRouter.hideLoader()
            self.presenter.authorizeSuccess()
        }) { error in
            AppRouter.hideLoader()
            AppRouter.presentAlert(error: error)
        }
    }
    
}
