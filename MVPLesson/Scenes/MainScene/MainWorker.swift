//
//  MainWorker.swift
//  MVPLesson
//
//  Created by user on 27.03.2025.
//

import UIKit

protocol IMainWorker {
    func validate(name: String) -> Bool
}

final class MainWorker {    
    
    let model: [Character] = []
    
}

extension MainWorker: IMainWorker {
    func validate(name: String) -> Bool {
        true
    }
    
    
}
