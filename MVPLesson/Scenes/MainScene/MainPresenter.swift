//
//  MainPresenter.swift
//  MVPLesson
//
//  Created by user on 24.03.2025.
//

import UIKit

struct ViewModel {
    let id: [Int]
    let name: String
    let image: [String]
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
    private var items: [String] = []
    private var idModels: [Int] = []
    
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
        
        validItem  = selectedData?.nameCharacter ?? ""
        items = randomData.map{ $0.image }
        idModels = randomData.map{ $0.id }
        
        let viewModel = ViewModel(id: idModels, name: validItem, image: items)
        view?.render(viewModel: viewModel)
    }
    
    func validate(index: Int) {
        let selectedButton = items[index]
        if selectedButton == validItem {
            counterScore += 1
            router.showAlert(message: "Правильно! Ваш счет \(counterScore)")
        } else {
            router.showAlert(message: "Ошибка!")
        }
    }
}
