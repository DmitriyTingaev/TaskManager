//
//  AppRouter.swift
//  Task manager
//
//  Created by Macbook on 06.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import UIKit

class AppRouter {
    
    private var window: UIWindow!
    private var loader = LoadingView.create()
    
    private static var shared = AppRouter()
        
    //MARK: - Private
    
    private class func setRootVC(_ rootVC: UIViewController) {
        let navigationVC = UINavigationController(rootViewController: rootVC)
        shared.window.rootViewController = navigationVC
        shared.window.makeKeyAndVisible()
    }
    
    //MARK: - Public
    
    class func setWindow(_ window: UIWindow) {
        shared.window = window
    }
    
    class func getWindow() -> UIWindow {
        return shared.window
    }

    class func presentVC(_ presentVC: UIViewController, animated: Bool) {
        if let navigation = shared.window.rootViewController as? UINavigationController {

            if let presntedVC = navigation.presentedViewController as? UINavigationController {
        
                presntedVC.pushViewController(presentVC, animated: animated)
                
            } else {
                
                let newNavigation = UINavigationController(rootViewController: presentVC)
                navigation.present(newNavigation, animated: animated)
                
            }
            
        }
    }
    
    class func hidePresentedVC() {
        if
            let navigation = shared.window.rootViewController as? UINavigationController,
            let presntedVC = navigation.presentedViewController {
            presntedVC.dismiss(animated: true, completion: nil)
        }
    }
    
    class func popPresentedVC() {
        if
            let navigation = shared.window.rootViewController as? UINavigationController,
            let presntedVC = navigation.presentedViewController as? UINavigationController {
            presntedVC.popViewController(animated: true)
        }
    }

    
    class func pushVC(_ pushedVC: UIViewController, animated: Bool) {
        if let navigation = shared.window.rootViewController as? UINavigationController {
            navigation.pushViewController(pushedVC, animated: true)
        }
    }
    
    class func presentInitialVC() {
        let taskListVC = TaskListTableViewController.create()
        setRootVC(taskListVC)
    }
    
    class func presentLoginScreen() {
        let loginVC = LoginViewController.create()
        shared.window.rootViewController = loginVC
    }

    class func presentAlert(error: Error) {
        
        var title: String?
        
        if let error = error as? BaseError {
            title = error.title
        }
        
        let alert = UIAlertController(title: title ?? "Error", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        
        shared.window.rootViewController?.present(alert, animated: true)
    }
    
    class func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        
        shared.window.rootViewController?.present(alert, animated: true)
    }
    
    
    class func showLoader() {
        shared.window.addSubview(shared.loader)
    }
    
    class func hideLoader() {
        shared.loader.removeFromSuperview()
    }

}
