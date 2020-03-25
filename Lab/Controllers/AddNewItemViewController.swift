//
//  AddNewItemViewController.swift
//  Lab
//
//  Created by Macbook Pro on 10/03/2020.
//  Copyright © 2020 Macbook Pro. All rights reserved.
//

import UIKit

class AddNewItemViewController: UIViewController {
    
    public var presentingVC: DatabaseViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpDismissButton()
        
        view.addSubview(inputsContainerView)
        view.addSubview(addButton)
        view.addSubview(studentImageView)
        
        setupInputsContainerView()
        setUpAddButton()
        setupProfileImageView()
        
    }
    
    private var dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("✖️", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25.0)
        button.addTarget(self, action: #selector(handleDismiss(_:)), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleDismiss(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setUpDismissButton() {
        
        view.addSubview(dismissButton)
        dismissButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30.0).isActive = true
        dismissButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15.0).isActive = true
        dismissButton.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        dismissButton.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        
    }
    
    public var studentImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "UserDefaultImage")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(configureImagePickerController(_:))))
        imageView.isUserInteractionEnabled = true
        return imageView
        
    }()
    
    // - Central View Container
    private var inputsContainerView: UIView = {
        
        let inputView = UIView()
        inputView.backgroundColor = .white
        inputView.layer.cornerRadius = 5.0
        
        inputView.layer.masksToBounds = true
        inputView.translatesAutoresizingMaskIntoConstraints = false
        return inputView
        
    }()
    
    // MARK: - User's Login/Register Button
    private lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = #colorLiteral(red: 0.3071019039, green: 0.4063035514, blue: 0.5333320114, alpha: 1)
        button.setTitle("Add student", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleAdd), for: .touchUpInside)
        
        return button
        
    }()
    
    @objc private func handleAdd() {
        let student = Student(photo: studentImageView.image!, birthData: birthTextField.text ?? "24.02.2001", averageScore: Int(averageScoreTextField.text!) ?? 2, name: nameTextField.text ?? "Dima", text: "Hello, Tinder", identifier: nameTextField.text ?? "Dima")
        presentingVC.studentsDatabase.database.insert(student, at: 0)
        presentingVC.studentsDatabase.updateDataFromDatabase()
        dismiss(animated: true) {
            self.presentingVC.studentsCollectionView.reloadData()
        }
    }
    
    // MARK: - User's Name TextField
    private lazy var nameTextField: UITextField = {
        
        let textField = UITextField()
        textField.delegate = self
        textField.keyboardType = .default
        textField.placeholder = "Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
        
    }()
    
    // - Central View Container's Name Separator
    private var nameSeparatorView: UIView = {
        
        let separator = UIView()
        separator.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
        
    }()
    
    // MARK: - User's Email TextField
    private lazy var birthTextField: UITextField = {
        
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = "Date of birth"
        textField.keyboardType = UIKeyboardType.numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
        
    }()
    
    // - Central View Container's Email Separator
    private var birthSeparatorView: UIView = {
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    // MARK: - User's Password TextField
    private lazy var averageScoreTextField: UITextField = {
        
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = "Average score"
        textField.keyboardType = UIKeyboardType.numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
        
    }()
    
    private func setupProfileImageView() {
        
        studentImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        studentImageView.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -12.0).isActive = true
        studentImageView.widthAnchor.constraint(equalToConstant: 150.0).isActive = true
        studentImageView.heightAnchor.constraint(equalToConstant: 150.0).isActive = true
        
    }
    
    private func setupInputsContainerView() {
        
        /// - InputsContainerView's Constraints
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24.0).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: 150.0).isActive = true
        
        /// - InputsContainerView's Subviews
        inputsContainerView.addSubview(nameTextField)
        inputsContainerView.addSubview(nameSeparatorView)
        inputsContainerView.addSubview(birthTextField)
        inputsContainerView.addSubview(birthSeparatorView)
        inputsContainerView.addSubview(averageScoreTextField)
        
        /// - NameTextField's Constraints
        nameTextField.leadingAnchor.constraint(equalTo: inputsContainerView.leadingAnchor, constant: 12.0).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: inputsContainerView.trailingAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        /// - NameSeparatorView's Constraints
        nameSeparatorView.leadingAnchor.constraint(equalTo: inputsContainerView.leadingAnchor).isActive = true
        nameSeparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameSeparatorView.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        
        /// - EmailTextField's Constraints
        birthTextField.leadingAnchor.constraint(equalTo: inputsContainerView.leadingAnchor, constant: 12.0).isActive = true
        birthTextField.trailingAnchor.constraint(equalTo: inputsContainerView.trailingAnchor).isActive = true
        birthTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        birthTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        /// - EmailSeparatorView's Constraints
        birthSeparatorView.leadingAnchor.constraint(equalTo: inputsContainerView.leadingAnchor).isActive = true
        birthSeparatorView.topAnchor.constraint(equalTo: birthTextField.bottomAnchor).isActive = true
        birthSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        birthSeparatorView.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        
        /// - PasswordTextField's Constraints
        averageScoreTextField.leadingAnchor.constraint(equalTo: inputsContainerView.leadingAnchor, constant: 12.0).isActive = true
        averageScoreTextField.trailingAnchor.constraint(equalTo: inputsContainerView.trailingAnchor).isActive = true
        averageScoreTextField.topAnchor.constraint(equalTo: birthTextField.bottomAnchor).isActive = true
        averageScoreTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
    }
    
    private func setUpAddButton() {
        addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12.0).isActive = true
        addButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
    }
    
    
    

}





extension AddNewItemViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.nameTextField.resignFirstResponder() // - Hide keyboard, if pressed 'return'
        self.birthTextField.resignFirstResponder()
        self.averageScoreTextField.resignFirstResponder()
        return true
    }
    
    // - Hide keyboard, if pressed any point of the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // - ViewController's screen is up
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let offset: CGFloat = self.view.bounds.width / 6
        configureScreenBy(offset: offset)
    }
    
    // - ViewController's screen return
    func textFieldDidEndEditing(_ textField: UITextField) {
        configureScreenBy(offset: 0.0)
    }
    
    // - Offset ViewController's screen up (here: if keyboard is open)
    private func configureScreenBy(offset: CGFloat) {
        let mainHeight = self.view.bounds.size.height
        let mainWidth = self.view.bounds.size.width
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveLinear, animations: {
            self.view.center = CGPoint(x: mainWidth / 2, y: mainHeight / 2 - offset)
        })
    }
    
    
}

extension AddNewItemViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = ((info[UIImagePickerControllerEditedImage] ?? info[UIImagePickerControllerOriginalImage]) as? UIImage) {
            if let imageData = UIImageJPEGRepresentation(image, 1.0) {
                self.studentImageView.image = UIImage(data: imageData) // - Set user's image
            }
        }
        picker.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func configureImagePickerController(_ recognizer: UITapGestureRecognizer) {
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.delegate = self
        imagePickerVC.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePickerVC.allowsEditing = true
        present(imagePickerVC, animated: true, completion: nil)
    }
    
}









