//
//  MainPresenter.swift
//  MVPLesson
//
//  Created by user on 24.03.2025.
//

import UIKit

struct ViewModel {
    let name: String
    let image: [Character]
}

protocol IMainPresenter {
    func getData()
    func validate(index: Int)
}


final class MainPresenter{
    
    weak var view: IMainViewController?
    private let router: IMainRouter
    private let repository: IReposytory
    
    private var validItem: String = ""
    private var items: [Character] = []
    
    private let selectedButton = Int()
    private var counterScore = 0
    
    init(view: IMainViewController, router: IMainRouter, repository: Repository) {
        self.view = view
        self.router = router
        self.repository = repository
    }
}


extension MainPresenter: IMainPresenter {
    
    func getData() {
        let randomData = repository.getRandom(count: 3)
        let selectedData = randomData.randomElement()
        
        validItem = selectedData?.nameCharacter ?? ""
        items = randomData
        
        let viewModel = ViewModel(name: validItem, image: items)
        view?.render(viewModel: viewModel)
    }
    
    func validate(index: Int) {
        let selectedCharacter = items[index]
        
        print("\(selectedCharacter.nameCharacter)")
        print("\(validItem)")
        
        if selectedCharacter.nameCharacter == validItem {
            counterScore += 1
            router.showAlert(message: "Правильно! Ваш счет \(counterScore)")
        } else {
            router.showAlert(message: "Ошибка!")
        }
    }
}
