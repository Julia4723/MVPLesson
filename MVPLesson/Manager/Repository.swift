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
        Character(image: "Cat", nameCharacter: "Кот Матроскин"),
        Character(image: "Cheburashka", nameCharacter: "Чебурашка"),
        Character(image: "Dog", nameCharacter: "Шарик"),
        Character(image: "Fedor", nameCharacter: "Дядя Федор"),
        Character(image: "Gena", nameCharacter: "Крокодил Гена"),
        Character(image: "Pig", nameCharacter: "Пятачок"),
        Character(image: "ViniPuh", nameCharacter: "Винни Пух"),
    ]
}


extension Repository: IReposytory {
    func getRandom(count: Int) -> [Character] {
        return characterList.shuffled().prefix(count).map { $0 }
    }
}
