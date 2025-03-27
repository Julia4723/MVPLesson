//
//  MainRouter.swift
//  MVPLesson
//
//  Created by user on 24.03.2025.
//

import UIKit

protocol IMainRouter: BaseRouting {
    
}


final class MainRouter {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension MainRouter: IMainRouter {
    func showAlert(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        navigationController.topViewController?.present(alert, animated: true)
    }
    
    
}
