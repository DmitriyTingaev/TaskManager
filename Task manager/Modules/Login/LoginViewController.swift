//
//  LoginViewController.swift
//  Task manager
//
//  Created by Macbook on 02.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Base view config
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var switcherView: CustomSwitch!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextView: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    
    //MARK: - Properties
    
    var presenter: LoginPresenterProtocol!
        
    //MARK: - Internal
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter(self)
    }
    
    //MARK: - IBAction
    
    @IBAction func loginAction(_ sender: Any) {
            
        presenter.loginAction(email: emailTextField.text,
                              password: passwordTextField.text,
                              confirmPassword: confirmPasswordTextView.text)
    }
    
}

//MARK: - LoginViewProtocol

extension LoginViewController: LoginViewProtocol {
    
    func onSignInMode() { changeMode(isSignUp: false) }
    func onSignUpMode() { changeMode(isSignUp: true) }
    
    private func changeMode(isSignUp: Bool) {
        let buttonText = isSignUp ? "Register" : "Login"
        let transform = isSignUp ? CGAffineTransform(translationX: 200, y: 0) : .identity
        confirmPasswordTextView.transform = transform
        UIView.animate(withDuration: 0.25) {
            self.confirmPasswordTextView.isHidden = !isSignUp
            self.actionButton.setTitle(buttonText, for: .normal)
            self.confirmPasswordTextView.alpha = !isSignUp ? 0 : 1
            self.confirmPasswordTextView.transform = .identity
        }
    }
    
}
