//
//  MVXProtocol.swift
//  MVPLesson
//
//  Created by user on 24.03.2025.
//

import UIKit

protocol BaseAssembly {
    func configure(viewController: UIViewController)
}


protocol BaseRouting {
    func showAlert(message: String)
}
