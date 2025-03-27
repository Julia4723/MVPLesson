//
//  MainPresenter.swift
//  MVPLesson
//
//  Created by user on 24.03.2025.
//

import UIKit

struct ViewModel {
    let name: String
    let image: String
}

protocol IMainPresenter {
    
    func getData() -> (image: [String], name: String)
    
    func tapImage(nameSelectedImage: String, currentLabelText: String)
}


final class MainPresenter{
    
    weak var view: IMainViewController?
    let router: IMainRouter
    let repository: Repository
    var counterScore = 0
    
    init(view: IMainViewController, router: IMainRouter, repository: Repository) {
        self.view = view
        self.router = router
        self.repository = repository
    }
}


extension MainPresenter: IMainPresenter {
    
    func getData() -> (image: [String], name: String) {
        let models = repository.getRandom(count: 3)
        let images = models.map { $0.image }
        let randomName = models.randomElement()?.nameCharacter ?? ""
        return (images, randomName)
    }
    
    
    func tapImage(nameSelectedImage: String, currentLabelText: String) {
        
        if nameSelectedImage == currentLabelText {
            counterScore += 1
            router.showAlert(message: "Верно, ваш счет \(counterScore)")
        } else {
            router .showAlert(message: "Ошибка")
        }
    }
}




