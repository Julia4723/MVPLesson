//
//  MainAssembly.swift
//  MVPLesson
//
//  Created by user on 24.03.2025.
//
import UIKit


final class MainAssembly {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
}

extension MainAssembly: BaseAssembly {
    func configure(viewController: UIViewController) {
        guard let mainVC = viewController as? MainViewController else {return}
        let router = MainRouter(navigationController: navigationController)
        let repository = Repository()
       
        let presenter = MainPresenter(view: mainVC, router: router, repository: repository)
        mainVC.presenter = presenter
        presenter.view = mainVC
    }
    
}
