//
//  ViewController.swift
//  MVPLesson
//
//  Created by user on 24.03.2025.
//

import UIKit

//презентер через протокол обращается к контроллеру
protocol IMainViewController: AnyObject {
    func render(viewModel: ViewModel)
}

final class MainViewController: UIViewController {
    
    var presenter: IMainPresenter!
    
    private let label = UILabel()
    private var labelScore = UILabel()
    private let buttonFirst = UIButton()
    private let buttonSecond = UIButton()
    private let buttonThird = UIButton()
    private var buttons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        setup()
        presenter.getData()
        
    }
    
    
    @objc
    private func tapButton(_ sender: UIButton) {
        presenter.validate(index: sender.tag)
    }
}

extension MainViewController {
    func setup(){
        setupSubviews()
        setupLayout()
        setupLabel()
        setupActions()
    }
    
    func setupLabel() {
        label.font = .systemFont(ofSize: 20, weight: .regular)
        labelScore.font = .systemFont(ofSize: 20, weight: .regular)
    }
    
    func setupActions() {
        buttonFirst.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        buttonSecond.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        buttonThird.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        
        buttonFirst.tag = 0
        buttonSecond.tag = 1
        buttonThird.tag = 2
    }
    
    func setupSubviews() {
        buttons = [buttonFirst, buttonSecond, buttonThird]
        view.addSubview(label)
        view.addSubview(labelScore)
        view.addSubview(buttonFirst)
        view.addSubview(buttonSecond)
        view.addSubview(buttonThird)
    }
    
    func setupLayout() {
        label.translatesAutoresizingMaskIntoConstraints = false
        labelScore.translatesAutoresizingMaskIntoConstraints = false
        buttonFirst.translatesAutoresizingMaskIntoConstraints = false
        buttonSecond.translatesAutoresizingMaskIntoConstraints = false
        buttonThird.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            labelScore.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 12),
            labelScore.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonFirst.topAnchor.constraint(equalTo: labelScore.bottomAnchor, constant: 20),
            buttonFirst.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonFirst.heightAnchor.constraint(equalToConstant: 100),
            buttonFirst.widthAnchor.constraint(equalToConstant: 100),
            
            buttonSecond.topAnchor.constraint(equalTo: buttonFirst.bottomAnchor, constant: 20),
            buttonSecond.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonSecond.heightAnchor.constraint(equalToConstant: 100),
            buttonSecond.widthAnchor.constraint(equalToConstant: 100),
            
            buttonThird.topAnchor.constraint(equalTo: buttonSecond.bottomAnchor, constant: 20),
            buttonThird.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonThird.heightAnchor.constraint(equalToConstant: 100),
            buttonThird.widthAnchor.constraint(equalToConstant: 100),
            
        ])
    }
}



extension MainViewController: IMainViewController {
    func render(viewModel: ViewModel) {
        label.text = "Выберите: \(viewModel.name)"
        labelScore.text = presenter.getScore().formatted()
        
        for (index, button) in buttons.enumerated() {
            let imageName = viewModel.image[index].image
            button.setImage(UIImage(named: imageName), for: .normal)
        }
    }
}
