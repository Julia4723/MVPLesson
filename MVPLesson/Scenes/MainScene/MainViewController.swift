//
//  ViewController.swift
//  MVPLesson
//
//  Created by user on 24.03.2025.
//

import UIKit

//презентер через протокол обращается к контроллеру
protocol IMainViewController: AnyObject {
    
}

final class MainViewController: UIViewController {
    
    var presenter: IMainPresenter!
    
    private let label = UILabel()
    private let buttonFirst = UIButton()
    private let buttonSecond = UIButton()
    private let buttonThird = UIButton()
    private var currentImage: String = ""
    private var buttonImagesName: [String] = []
    
    var labelText: String {
        get {
            label.text ?? ""
        }
        set {
            label.text = newValue
        }
    }
    
    var image: String {
        get {
            currentImage
        }
        set {
            currentImage = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        setup()
        setupData()
        
    }
    
    private func setupData() {
        let data = presenter.getData()
        buttonImagesName = data.image

        labelText = data.name
        
        if buttonImagesName.count >= 3 {
            buttonFirst.setImage(UIImage(named: buttonImagesName[0]), for: .normal)
            buttonSecond.setImage(UIImage(named: buttonImagesName[1]), for: .normal)
            buttonThird.setImage(UIImage(named: buttonImagesName[2]), for: .normal)
        }
    }
    
    @objc
    private func tapButton(_ sender: UIButton) {
        
        guard let selectedImage = sender.currentImage else {return}
        let selectedImageName = buttonImagesName.first { UIImage(named: $0) == selectedImage} ?? ""
        
        print("Tap Button \(selectedImageName)")
        
        presenter?.tapImage(nameSelectedImage: selectedImageName, currentLabelText: labelText)
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
    }
    
    func setupActions() {
        buttonFirst.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        buttonSecond.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        buttonThird.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
    }
    
    func setupSubviews() {
        view.addSubview(label)
        view.addSubview(buttonFirst)
        view.addSubview(buttonSecond)
        view.addSubview(buttonThird)
    }
    
    func setupLayout() {
        label.translatesAutoresizingMaskIntoConstraints = false
        buttonFirst.translatesAutoresizingMaskIntoConstraints = false
        buttonSecond.translatesAutoresizingMaskIntoConstraints = false
        buttonThird.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonFirst.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
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



extension MainViewController: IMainViewController {}
