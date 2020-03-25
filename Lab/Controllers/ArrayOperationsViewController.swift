//
//  ArrayOperationsViewController.swift
//  Lab
//
//  Created by Macbook Pro on 23/02/2020.
//  Copyright © 2020 Macbook Pro. All rights reserved.
//

import UIKit

class ArrayOperationsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Operations on arrays"
        
        // - Set up fill button
        setUpFillButtonBackgroundView()
        setUpFillButton()
        
        // - Set up dimensions in container view
        setUpContainerView()
        setUpContainerViewWithDimensions()
        
        // - Set up area for items
        setUpItemsContainerView()
    
    }
    
    // MARK: - Configure UIElements
    
    private let itemsContainerView: UIView = {
        
        let container = UIView()
        container.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        container.layer.cornerRadius = 10.0
        container.layer.borderColor = UIColor.black.cgColor
        container.layer.borderWidth = 1.0
        container.layer.masksToBounds = true
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
        
    }()
    
    private func setUpItemsContainerView() {
        
        view.addSubview(itemsContainerView)
        itemsContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 72.0).isActive = true
        itemsContainerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10.0).isActive = true
        itemsContainerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10.0).isActive = true
        itemsContainerView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: -7.0).isActive = true
    }
    
    private let fillButtonBackgroundView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return view
        
    }()
    
    private func setUpFillButtonBackgroundView() {
        
        view.addSubview(fillButtonBackgroundView)
        fillButtonBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10.0).isActive = true
        fillButtonBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10.0).isActive = true
        fillButtonBackgroundView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10.0).isActive = true
        fillButtonBackgroundView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
    }
    
    private let fillButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.3442970391, green: 0.4653404564, blue: 1, alpha: 1)
        button.layer.cornerRadius = 10.0
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.0
        button.setTitle("Configure array", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleConfigureArray(_:)), for: .touchUpInside)
        return button
        
    }()
    
    private func setUpFillButton() {
        
        fillButtonBackgroundView.addSubview(fillButton)
        fillButton.bottomAnchor.constraint(equalTo: fillButtonBackgroundView.bottomAnchor).isActive = true
        fillButton.leftAnchor.constraint(equalTo: fillButtonBackgroundView.leftAnchor).isActive = true
        fillButton.rightAnchor.constraint(equalTo: fillButtonBackgroundView.rightAnchor).isActive = true
        fillButton.topAnchor.constraint(equalTo: fillButtonBackgroundView.topAnchor).isActive = true
        
    }
    
    // MARK: - Array Configuration
    @objc private func handleConfigureArray(_ sender: UIButton) {
        
        // Configure Array
        updateModel()
        self.model = Matrix.init(dimension: dimension)
        updateViewFromModel()
        
        // Delete Views
        fillButton.removeFromSuperview()
        containerView.subviews.forEach { $0.removeFromSuperview() }
        
        // Create New Views
        setUpBackAndRefillButtons()
        setUpContainerViewWithOperations()
        
    }
    
    private let containerView: UIView = {
        
        let container = UIView()
        container.backgroundColor = #colorLiteral(red: 0.3442970391, green: 0.4653404564, blue: 1, alpha: 1)
        container.layer.cornerRadius = 10.0
        container.layer.borderColor = UIColor.black.cgColor
        container.layer.borderWidth = 1.0
        container.layer.masksToBounds = true
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
        
    }()
    
    private var oneDimensionalButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("One-dimensional", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleOneDimensionButton(_:)), for: .touchUpInside)
        return button
        
    }()
    
    @objc private func handleOneDimensionButton(_ sender: UIButton) {
        didSelectButton(sender)
        self.dimension = 1
    }
    
    private let separator_1: UIView = {
        
        let separator = UIView()
        separator.backgroundColor = .black
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
        
    }()
    
    private var twoDimensionalButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Two-dimensional", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleTwoDimensionButton), for: .touchUpInside)
        return button
        
    }()
    
    @objc private func handleTwoDimensionButton(_ sender: UIButton) {
        didSelectButton(sender)
        self.dimension = 2
    }
    
    private let separator_2: UIView = {
        
        let separator = UIView()
        separator.backgroundColor = .black
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
        
    }()
    
    private var stepsButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Steps", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleStepsButton(_:)), for: .touchUpInside)
        return button
        
    }()
    
    @objc private func handleStepsButton(_ sender: UIButton) {
        didSelectButton(sender)
        self.dimension = 3
    }
    
    private func setUpContainerView() {
        
        view.addSubview(containerView)
        containerView.bottomAnchor.constraint(equalTo: fillButtonBackgroundView.topAnchor, constant: -10.0).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10.0).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10.0).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 152.0).isActive = true
        
    }
    
    private func setUpContainerViewWithDimensions() {
        
        containerView.addSubview(oneDimensionalButton)
        oneDimensionalButton.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        oneDimensionalButton.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        oneDimensionalButton.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        oneDimensionalButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        containerView.addSubview(separator_1)
        separator_1.topAnchor.constraint(equalTo: oneDimensionalButton.bottomAnchor).isActive = true
        separator_1.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        separator_1.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        separator_1.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        
        containerView.addSubview(twoDimensionalButton)
        twoDimensionalButton.topAnchor.constraint(equalTo: separator_1.bottomAnchor).isActive = true
        twoDimensionalButton.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        twoDimensionalButton.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        twoDimensionalButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        containerView.addSubview(separator_2)
        separator_2.topAnchor.constraint(equalTo: twoDimensionalButton.bottomAnchor).isActive = true
        separator_2.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        separator_2.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        separator_2.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        
        containerView.addSubview(stepsButton)
        stepsButton.topAnchor.constraint(equalTo: separator_2.bottomAnchor).isActive = true
        stepsButton.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        stepsButton.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        stepsButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
    }
    
    private func didSelectButton(_ item: UIButton) {
        if let alreadySelectedItem = oneAndOnlySelectedItem {
            if item != alreadySelectedItem {
                alreadySelectedItem.backgroundColor = #colorLiteral(red: 0.3442970391, green: 0.4653404564, blue: 1, alpha: 1)
                item.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
                oneAndOnlySelectedItem = item
            } else {
                item.backgroundColor = #colorLiteral(red: 0.3442970391, green: 0.4653404564, blue: 1, alpha: 1)
                oneAndOnlySelectedItem = nil
            }
        } else {
            item.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            oneAndOnlySelectedItem = item
        }
    }
    
    private var oneAndOnlySelectedItem: UIButton?
    private var dimension: Int?
    private var model: Matrix?

    // MARK: - Update Model
    
    private func updateViewFromModel() {
        Item.uniqueidentifier = 0
        if let matrix = model {
            for rowOfItems in matrix.items {
                for item in rowOfItems {
                    
                    // - PreSet Up Item Views
                    let itemView = ItemView()
                    itemsContainerView.addSubview(itemView)
                    let index: (Int, Int) = (item.row, item.column)
                    itemView.setOriginByIndex(index) // - set origin
                    itemView.identifier = item.identifier // - set identifier
                    
                    // - Add animation
                    let startOrigin = CGPoint(x: itemsContainerView.frame.origin.x + itemsContainerView.frame.width,
                                              y: itemsContainerView.frame.origin.y + itemsContainerView.frame.height)
                    let startSize = CGSize(width: 0.0, height: 0.0)
                    itemView.frame = CGRect(origin: startOrigin, size: startSize)
                    
                    UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseIn], animations: {
                        itemView.frame = CGRect(origin: itemView.origin, size: itemView.size)
                    }, completion: { success in
                        
                        UIView.transition(with: itemView, duration: 0.5, options: .transitionFlipFromRight, animations: {
                            itemView.label.text = String(describing: item.number)
                            itemView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                        }, completion: nil)
                        
                    })
                    
                }
            }
        }
    }
    
    private func updateModel() {
        if model != nil {
            itemsContainerView.subviews.forEach { $0.removeFromSuperview() }
        }
    }
    
    // MARK: - Second Views
    
    private let verticalSeparator: UIView = {
        
        let separator = UIView()
        separator.backgroundColor = .black
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
        
    }()
    
    private var maxButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Maximum", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleMax(_:)), for: .touchUpInside)
        return button
        
    }()
    
    @objc private func handleMax(_ sender: UIButton) {
        if let matrix = model {
            itemsContainerView.subviews.forEach { $0.layer.borderWidth = 1.0; $0.layer.borderColor = UIColor.black.cgColor }
            let maxItem = matrix.getMaxItem()
            let index = (maxItem.row, maxItem.column)
            let compareItem = ItemView()
            compareItem.setOriginByIndex(index)
            if let realItemView = (itemsContainerView.subviews.filter { $0.frame.origin == compareItem.origin }).first {
                realItemView.layer.borderColor = UIColor.red.cgColor
                realItemView.layer.borderWidth = 3.0
            }
        }
    }
    
    private var minButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Minimum", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleMin(_:)), for: .touchUpInside)
        return button
        
    }()
    
    @objc private func handleMin(_ sender: UIButton) {
        if let matrix = model {
            itemsContainerView.subviews.forEach { $0.layer.borderWidth = 1.0; $0.layer.borderColor = UIColor.black.cgColor }
            let minItem = matrix.getMinItem()
            let index = (minItem.row, minItem.column)
            let compareItem = ItemView()
            compareItem.setOriginByIndex(index)
            if let realItemView = (itemsContainerView.subviews.filter { $0.frame.origin == compareItem.origin }).first {
                realItemView.layer.borderColor = UIColor.blue.cgColor
                realItemView.layer.borderWidth = 3.0
            }
        }
    }
    
    private let separator_3: UIView = {
        
        let separator = UIView()
        separator.backgroundColor = .black
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
        
    }()
    
    private var increaseButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Sort ➚", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleIncrease(_:)), for: .touchUpInside)
        return button
        
    }()
    
    // MARK: - Increase Sort
    @objc private func handleIncrease(_ sender: UIButton) {
        if let matrix = model {
            itemsContainerView.subviews.forEach { $0.layer.borderWidth = 1.0; $0.layer.borderColor = UIColor.black.cgColor }
            self.sortMatrix(matrix) { matrix.sortByIncrease() }
        }
    }
    
    private var decreaseButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Sort ➘", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleDecrease(_:)), for: .touchUpInside)
        return button
        
    }()
    
    @objc private func handleDecrease(_ sender: UIButton) {
        if let matrix = model {
            itemsContainerView.subviews.forEach { $0.layer.borderWidth = 1.0; $0.layer.borderColor = UIColor.black.cgColor }
            self.sortMatrix(matrix) { matrix.sortByDecrease() }
        }
    }
    
    private let separator_4: UIView = {
        
        let separator = UIView()
        separator.backgroundColor = .black
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
        
    }()
    
    private var evenButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Even", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleEven(_:)), for: .touchUpInside)
        return button
        
    }()
    
    @objc private func handleEven(_ sender: UIButton) {
        if let matrix = model {
            itemsContainerView.subviews.forEach { $0.layer.borderWidth = 1.0; $0.layer.borderColor = UIColor.black.cgColor }
            let evenItems = matrix.getEvenItems()
            let indexes: [(Int, Int)] = evenItems.map { ($0.row, $0.column) }
            for index in indexes {
                let compareItem = ItemView()
                compareItem.setOriginByIndex(index)
                if let realItemView = (itemsContainerView.subviews.filter { $0.frame.origin == compareItem.origin }).first {
                    realItemView.layer.borderColor = UIColor.orange.cgColor
                    realItemView.layer.borderWidth = 3.0
                }
            }
            
        }
    }
    
    private var oddButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Odd", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleOdd(_:)), for: .touchUpInside)
        return button
        
    }()
    
    @objc private func handleOdd(_ sender: UIButton) {
        if let matrix = model {
            itemsContainerView.subviews.forEach { $0.layer.borderWidth = 1.0; $0.layer.borderColor = UIColor.black.cgColor }
            let evenItems = matrix.getOddItems()
            let indexes: [(Int, Int)] = evenItems.map { ($0.row, $0.column) }
            for index in indexes {
                let compareItem = ItemView()
                compareItem.setOriginByIndex(index)
                if let realItemView = (itemsContainerView.subviews.filter { $0.frame.origin == compareItem.origin }).first {
                    realItemView.layer.borderColor = UIColor.purple.cgColor
                    realItemView.layer.borderWidth = 3.0
                }
            }
            
        }
    }
    
    private func setUpContainerViewWithOperations() {
        
        containerView.addSubview(maxButton)
        maxButton.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        maxButton.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        maxButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        maxButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1/2).isActive = true
        
        containerView.addSubview(verticalSeparator)
        verticalSeparator.leftAnchor.constraint(equalTo: maxButton.rightAnchor).isActive = true
        verticalSeparator.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        verticalSeparator.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        verticalSeparator.widthAnchor.constraint(equalToConstant: 1.0).isActive = true
        
        containerView.addSubview(minButton)
        minButton.leftAnchor.constraint(equalTo: verticalSeparator.rightAnchor).isActive = true
        minButton.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        minButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        minButton.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        
        containerView.addSubview(separator_3)
        separator_3.topAnchor.constraint(equalTo: maxButton.bottomAnchor).isActive = true
        separator_3.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        separator_3.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        separator_3.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        
        containerView.addSubview(increaseButton)
        increaseButton.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        increaseButton.topAnchor.constraint(equalTo: separator_3.bottomAnchor).isActive = true
        increaseButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        increaseButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1/2).isActive = true

        containerView.addSubview(decreaseButton)
        decreaseButton.leftAnchor.constraint(equalTo: verticalSeparator.rightAnchor).isActive = true
        decreaseButton.topAnchor.constraint(equalTo: minButton.bottomAnchor).isActive = true
        decreaseButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        decreaseButton.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        
        containerView.addSubview(separator_4)
        separator_4.topAnchor.constraint(equalTo: increaseButton.bottomAnchor).isActive = true
        separator_4.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        separator_4.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        separator_4.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        
        containerView.addSubview(evenButton)
        evenButton.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        evenButton.topAnchor.constraint(equalTo: separator_4.bottomAnchor).isActive = true
        evenButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        evenButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1/2).isActive = true
        
        containerView.addSubview(oddButton)
        oddButton.leftAnchor.constraint(equalTo: verticalSeparator.rightAnchor).isActive = true
        oddButton.topAnchor.constraint(equalTo: decreaseButton.bottomAnchor).isActive = true
        oddButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        oddButton.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        
    }
    
    private let backButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.3442970391, green: 0.4653404564, blue: 1, alpha: 1)
        button.layer.cornerRadius = 10.0
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.0
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleBack(_:)), for: .touchUpInside)
        return button
        
    }()
    
    @objc private func handleBack(_ sender: UIButton) {
        containerView.subviews.forEach { $0.removeFromSuperview() }
        backButton.removeFromSuperview()
        refillButton.removeFromSuperview()
        setUpContainerViewWithDimensions()
        setUpFillButton()
        itemsContainerView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    private let refillButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.3442970391, green: 0.4653404564, blue: 1, alpha: 1)
        button.layer.cornerRadius = 10.0
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.0
        button.setTitle("Reconfigure", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleConfigureArray(_:)), for: .touchUpInside)
        return button
        
    }()
    
    @objc private func handleReconfigureArray(_ sender: UIButton) {
        updateModel()
        self.model = Matrix.init(dimension: dimension)
        updateViewFromModel()
    }
    
    private func setUpBackAndRefillButtons() {
        
        fillButtonBackgroundView.addSubview(backButton)
        backButton.leftAnchor.constraint(equalTo: fillButtonBackgroundView.leftAnchor).isActive = true
        backButton.topAnchor.constraint(equalTo: fillButtonBackgroundView.topAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: fillButtonBackgroundView.bottomAnchor).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: (fillButtonBackgroundView.bounds.width - 10) / 2).isActive = true
        
        view.addSubview(refillButton)
        refillButton.rightAnchor.constraint(equalTo: fillButtonBackgroundView.rightAnchor).isActive = true
        refillButton.topAnchor.constraint(equalTo: fillButtonBackgroundView.topAnchor).isActive = true
        refillButton.bottomAnchor.constraint(equalTo: fillButtonBackgroundView.bottomAnchor).isActive = true
        refillButton.widthAnchor.constraint(equalToConstant: (view.bounds.width - 30) / 2).isActive = true
        
    }
    
    private func sortMatrix(_ matrix: Matrix, sorting: () -> Void) {
        sorting()
        for rowOfItems in matrix.items {
            for item in rowOfItems {
                
                for itemView in (itemsContainerView.subviews as! [ItemView]) {
                    if itemView.identifier == item.identifier {
                        let index: (Int, Int) = (item.row, item.column)
                        itemView.setOriginByIndex(index) // - set new origin
                        let newOrigin = itemView.origin
                        
                        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut], animations: {
                            itemView.frame.origin = newOrigin
                        }, completion: nil)
                        
                        
                    }
                }
                
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
}










