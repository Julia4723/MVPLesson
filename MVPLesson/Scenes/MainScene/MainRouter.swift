//
//  MainRouter.swift
//  MVPLesson
//
//  Created by user on 24.03.2025.
//

import UIKit

protocol IMainRouter: BaseRouting {
    
}

protocol MainRouterDelegate: AnyObject {
    func didDismissAler()
}

final class MainRouter {
    private let navigationController: UINavigationController
    
    var delegate: MainRouterDelegate?
   
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension MainRouter: IMainRouter {

    func alertButtonTap(action: UIAlertAction) {
        delegate?.didDismissAler()
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { action in
            self.alertButtonTap(action: action)
        }
        alert.addAction(action)
        navigationController.topViewController?.present(alert, animated: true)
    }
    
    
}
