//
//  ViewController.swift
//  Lab
//
//  Created by Macbook Pro on 22/02/2020.
//  Copyright © 2020 Macbook Pro. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    private lazy var startButton: UIButton = {
        
        let button = UIButton(type: .system)
        let title = "Start"
        let attributes: [NSAttributedStringKey : Any] = [NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1),
                                                         NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 25.0),
                                                         NSAttributedStringKey.strokeWidth : 8.0]
        
        let attributedString = NSAttributedString(string: title, attributes: attributes)
        button.setAttributedTitle(attributedString, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.layer.cornerRadius = view.bounds.width / 6
        button.layer.borderWidth = 2.0
        button.layer.borderColor = #colorLiteral(red: 0.2418514331, green: 0.4035136421, blue: 0.1255771155, alpha: 1).cgColor
        
        button.backgroundColor = #colorLiteral(red: 0.4002273679, green: 0.7344907286, blue: 0.2039166028, alpha: 1)
        button.addTarget(self, action: #selector(handleStartTapped(_:)), for: .touchUpInside)
        return button
        
    }()
    
    private let containerView: UIView = {
        
        let inputView = UIView()
        inputView.translatesAutoresizingMaskIntoConstraints = false
        inputView.backgroundColor = #colorLiteral(red: 0.6592719178, green: 0.8495598033, blue: 0.5881748809, alpha: 1)
        
        inputView.layer.cornerRadius = 5.0
        inputView.layer.borderWidth = 1.0
        inputView.layer.borderColor = UIColor.gray.cgColor
        
        return inputView
        
    }()
    
    private let arrayOperationsButton: UIButton = {
        
        let button = UIButton(type: .system)
        let title = "Operations on arrays"
        let attributes: [NSAttributedStringKey : Any] = [NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1),
                                                         NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 17.0)]
        
        let attributedString = NSAttributedString(string: title, attributes: attributes)
        button.setAttributedTitle(attributedString, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(handleArrayTapped(_:)), for: .touchUpInside)
        return button
        
    }()
    
    private let separator_1: UIView = {
        
        let separator = UIView()
        separator.backgroundColor = .gray
        separator.translatesAutoresizingMaskIntoConstraints = false
        
        return separator
        
    }()
    
    private let databaseButton: UIButton = {
        
        let button = UIButton(type: .system)
        let title = "Database functionality"
        let attributes: [NSAttributedStringKey : Any] = [NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1),
                                                         NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 17.0)]
        
        let attributedString = NSAttributedString(string: title, attributes: attributes)
        button.setAttributedTitle(attributedString, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(handleDatabaseTapped(_:)), for: .touchUpInside)
        return button
    
    }()
    
    private let separator_2: UIView = {
        
        let separator = UIView()
        separator.backgroundColor = .gray
        separator.translatesAutoresizingMaskIntoConstraints = false
        
        return separator
    
    }()
    
    private let dynamicStructuresButton: UIButton = {
        
        let button = UIButton(type: .system)
        let title = "Working with dynamic structures"
        let attributes: [NSAttributedStringKey : Any] = [NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1),
                                                         NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 17.0)]
        
        let attributedString = NSAttributedString(string: title, attributes: attributes)
        button.setAttributedTitle(attributedString, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(handleStructuresTapped(_:)), for: .touchUpInside)
        return button
    
    }()
    
    private func configureContainerView() {
        
        view.addSubview(containerView)
        
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40.0).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 150.0).isActive = true
        
        containerView.addSubview(arrayOperationsButton)
        containerView.addSubview(separator_1)
        containerView.addSubview(databaseButton)
        containerView.addSubview(separator_2)
        containerView.addSubview(dynamicStructuresButton)
        
        arrayOperationsButton.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        arrayOperationsButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        arrayOperationsButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        arrayOperationsButton.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1/3).isActive = true
        
        separator_1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        separator_1.topAnchor.constraint(equalTo: arrayOperationsButton.bottomAnchor).isActive = true
        separator_1.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        separator_1.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        
        databaseButton.topAnchor.constraint(equalTo: arrayOperationsButton.bottomAnchor).isActive = true
        databaseButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        databaseButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        databaseButton.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1/3).isActive = true

        separator_2.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        separator_2.topAnchor.constraint(equalTo: databaseButton.bottomAnchor).isActive = true
        separator_2.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        separator_2.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        
        dynamicStructuresButton.topAnchor.constraint(equalTo: databaseButton.bottomAnchor).isActive = true
        dynamicStructuresButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        dynamicStructuresButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        dynamicStructuresButton.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1/3).isActive = true
        
    }
    
    private func configureStartButton() {
        
        view.addSubview(startButton)
        
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: view.bounds.width / 3).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: view.bounds.width / 3).isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8359611994, green: 1, blue: 0.8136566179, alpha: 1)
        configureStartButton()
    }
    
    override var navigationItem: UINavigationItem {
        return UINavigationItem(title: "Menu")
    }
    
    @objc private func handleStartTapped(_ button: UIButton) {
        button.isEnabled = false
        UIView.animate(withDuration: 1.0, animations: {
            button.alpha = 0.0
        }) { (success) in
            self.configureContainerView()
            self.containerView.transform = CGAffineTransform(scaleX: 0.2, y: 2.5)
            UIView.animate(withDuration: 1.0, delay: 0.0,
                           usingSpringWithDamping: 0.4, initialSpringVelocity: 0.0,
                           options: .allowUserInteraction, animations: {
                           self.containerView.transform = .identity
            })
        }
    }
    
    @objc private func handleArrayTapped(_ button: UIButton) {
        let arrayOperationsVC = ArrayOperationsViewController()
        self.navigationController?.pushViewController(arrayOperationsVC, animated: true)
    }
    
    @objc private func handleDatabaseTapped(_ button: UIButton) {
        let databaseVC = DatabaseViewController()
        self.navigationController?.pushViewController(databaseVC, animated: true)
    }
    
    @objc private func handleStructuresTapped(_ button: UIButton) {
        
    }
    


}














