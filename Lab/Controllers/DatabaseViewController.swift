//
//  DatabaseViewController.swift
//  Lab
//
//  Created by Macbook Pro on 07/03/2020.
//  Copyright © 2020 Macbook Pro. All rights reserved.
//

import UIKit

class DatabaseViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpNavigationItem()
        
        setUpSearchTextField()
        setUpSortButton()
        setUpStudentsCollectionView()
        
    }
    
    private func setUpNavigationItem() {
        
        navigationItem.title = "Database functionality"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(handleAddNewCell(_:)))
        
    }
    
    @objc private func handleAddNewCell(_ sender: UIBarButtonItem) {
        
        let addNewItemVC = AddNewItemViewController()
        addNewItemVC.presentingVC = self
        self.present(addNewItemVC, animated: true, completion: nil)
        
    }

    private lazy var searchTextField: UITextField = {
        
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.delegate = self
        textField.keyboardType = .default
        textField.placeholder = "Search"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 15.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        
        textField.leftViewMode = .always
        let leftView = UIView()
        textField.leftView = leftView
        leftView.frame = CGRect(x: 0.0, y: 0.0, width: 15.0, height: 30.0)
        
        textField.addTarget(self, action: #selector(handleSearchTextChange(_:)), for: UIControlEvents.editingChanged)
    
        return textField
        
    }()
    
    @objc private func handleSearchTextChange(_ sender: UITextField) {
        
        // let currentDatabase = studentsDatabase.database

        if let text = sender.text {
            
            let studentsToDisplay = studentsDatabase.databaseToDisplay.filter { $0.identifier.hasPrefix(text) }
            studentsDatabase.databaseToDisplay = studentsToDisplay
            studentsCollectionView.reloadData()
            
        } else {
            
            studentsDatabase.databaseToDisplay = studentsDatabase.database
            studentsCollectionView.reloadData()
            
        }
        
    }
    
    private func setUpSearchTextField() {
        
        view.addSubview(searchTextField)
        searchTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 73.0).isActive = true
        searchTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5.0).isActive = true
        searchTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5.0).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        
    }
    
    private var sortButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sort by", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 10.0
        button.layer.borderWidth = 1.0
        button.addTarget(self, action: #selector(handleSortButton(_:)), for: .touchUpInside)
        return button
        
    }()
    
    @objc private func handleSortButton(_ sender: UIButton) {
        self.presentSortingAlert()
    }
    
    private func presentSortingAlert() {
        
        let alert = UIAlertController(title: "Choose sorting", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "By surname", style: .default, handler: { (surnameAction) in
            let sortedByAlphabetDatabase = self.studentsDatabase.database.sorted { $0.name < $1.name }
            self.studentsDatabase.databaseToDisplay = sortedByAlphabetDatabase
            self.studentsCollectionView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "By average score", style: .default, handler: { (scoreAction) in
            let sortedByScoreDatabase = self.studentsDatabase.database.sorted { $0.averageScore > $1.averageScore }
            self.studentsDatabase.databaseToDisplay = sortedByScoreDatabase
            self.studentsCollectionView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    private func setUpSortButton() {
        
        view.addSubview(sortButton)
        sortButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5.0).isActive = true
        sortButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10.0).isActive = true
        sortButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5.0).isActive = true
        sortButton.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        
    }
    
    lazy var studentsCollectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(StudentCollectionViewCell.self, forCellWithReuseIdentifier: "StudentCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = true
        return collectionView
        
    }()
    
    private func setUpStudentsCollectionView() {
        
        view.addSubview(studentsCollectionView)
        studentsCollectionView.topAnchor.constraint(equalTo: sortButton.bottomAnchor, constant: 10.0).isActive = true
        studentsCollectionView.leftAnchor.constraint(equalTo: searchTextField.leftAnchor).isActive = true
        studentsCollectionView.rightAnchor.constraint(equalTo: searchTextField.rightAnchor).isActive = true
        studentsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5.0).isActive = true
        
    }
    
    // MARK: - Model
    
    var studentsDatabase = StudentsDatabase()
    
    // MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return studentsDatabase.databaseToDisplay.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StudentCell", for: indexPath) as! StudentCollectionViewCell
        
        let student = studentsDatabase.databaseToDisplay[indexPath.item]
        configureCell(cell, by: student)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StudentCell", for: indexPath) as! StudentCollectionViewCell
        
        let alert = UIAlertController(title: "DELETE", message: "Do you really want to delete?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { (deleteAction) in
            
            let student = self.studentsDatabase.database.remove(at: indexPath.item)
            let filteredDatabase = self.studentsDatabase.database.filter { $0.name != student.name }
            
            self.studentsDatabase.database = filteredDatabase
            self.studentsDatabase.updateDataFromDatabase()
            
            self.studentsCollectionView.reloadData()
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    private func configureCell(_ cell: StudentCollectionViewCell, by student: Student) {
        
        cell.nameLabel.text = student.name
        cell.birthLabel.text = "Дата рождения: \(student.birthData)"
        cell.imageView.image = student.photo
        cell.averageScoreLabel.text = "Средний балл: \(String(describing: student.averageScore))"
        cell.textLabel.text = student.text
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.width + 300.0)
    }
    
}

class StudentCollectionViewCell: UICollectionViewCell {
    
    public var imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .brown
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()
    
    public var averageScoreLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Средний балл: \(String(describing: 5.arc4random))"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22.0)
        return label
        
    }()
    
    public var birthLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Дата рождения: \(String(describing: 31.arc4random)).0\(String(describing: 9.arc4random)).2001"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22.0)
        return label
        
    }()
    
    public var nameLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Student: Halimjon Sattorzada"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22.0)
        return label
        
    }()
    
    public var textLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 0
        return label
        
    }()
    
    private func configureSubviews() {
        
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        imageView.addSubview(textLabel)
        textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15.0).isActive = true
        textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10.0).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        textLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10.0).isActive = true
        
        imageView.addSubview(averageScoreLabel)
        averageScoreLabel.bottomAnchor.constraint(equalTo: textLabel.topAnchor).isActive = true
        averageScoreLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10.0).isActive = true
        averageScoreLabel.heightAnchor.constraint(equalToConstant: 25.0).isActive = true
        averageScoreLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10.0).isActive = true
        
        imageView.addSubview(birthLabel)
        birthLabel.bottomAnchor.constraint(equalTo: averageScoreLabel.topAnchor, constant: -5.0).isActive = true
        birthLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10.0).isActive = true
        birthLabel.heightAnchor.constraint(equalToConstant: 25.0).isActive = true
        birthLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10.0).isActive = true
        
        imageView.addSubview(nameLabel)
        nameLabel.bottomAnchor.constraint(equalTo: birthLabel.topAnchor, constant: -5.0).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10.0).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 25.0).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10.0).isActive = true
        
    }
    
    private func configureLayers() {
        layer.cornerRadius = 10.0
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
        layer.masksToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayers()
        configureSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureLayers()
        configureSubviews()
    }
    
}

extension DatabaseViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.searchTextField.resignFirstResponder() // - Hide keyboard, if pressed 'return'
        return true
    }
    
    // - Hide keyboard, if pressed any point of the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
   
    
}























