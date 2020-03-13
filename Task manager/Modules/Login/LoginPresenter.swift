//
//  LoginPresenter.swift
//  Task manager
//
//  Created by Macbook on 03.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import UIKit
import Foundation

class LoginPresenter: LoginPresenterProtocol {

    //MARK: - Properties
    
    enum ViewMode {
        case signIn
        case signUp
    }
    
    weak var view: LoginViewProtocol!
    var interactor: LoginInteractorProtocol!
    var router: LoginRouterProtocol!
    
    var currentMode: ViewMode {
        didSet {
            switch self.currentMode {
            case .signIn: view.onSignInMode()
            case .signUp: view.onSignUpMode()
            }
        }
    }
    
    init(_ view: LoginViewController) {
        self.view = view
        self.currentMode = .signIn
        view.switcherView.delegate = self
        interactor = LoginInteractor(self)
        router = LoginRouter()
    }
    
    //MARK: - LoginPresenterProtocol Methods

    func loginAction(email: String?, password: String?, confirmPassword: String?) {
        
        let email = email ?? ""
        let password = password ?? ""
        let confirmPassword = confirmPassword ?? ""
        
        switch currentMode {
        case .signIn: interactor.authorize(email: email , password: password)
        case .signUp: interactor.register(email: email, password: password, confirmPassword: confirmPassword)
        }
        
    }
    
    func authorizeSuccess() {
        router.close()
    }
    
    func authorizeFailure(error: Error) {
        AppRouter.presentAlert(error: error)
    }
    
}

extension LoginPresenter: CustomSwitchDelegate {
    
    func swith(to: Bool) {
        currentMode = to ? .signUp : .signIn
    }
    
}
