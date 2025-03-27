//
//  Repository.swift
//  MVPLesson
//
//  Created by user on 24.03.2025.
//

import UIKit

protocol IReposytory {
    func getRandom(count: Int) -> [Character]
}


final class Repository {
    private let characterList: [Character] = [
        Character(id: 0, image: "Cat", nameCharacter: "Кот Матроскин"),
        Character(id: 1, image: "Cheburashka", nameCharacter: "Чебурашка"),
        Character(id: 2, image: "Dog", nameCharacter: "Шарик"),
        Character(id: 3, image: "Fedor", nameCharacter: "Дядя Федор"),
        Character(id: 4, image: "Gena", nameCharacter: "Крокодил Гена"),
        Character(id: 5, image: "Pig", nameCharacter: "Пятачок"),
        Character(id: 6, image: "ViniPuh", nameCharacter: "Винни Пух"),
    ]
}


extension Repository: IReposytory {
    func getRandom(count: Int) -> [Character] {
        return characterList.shuffled().prefix(count).map { $0 }
    }
}
