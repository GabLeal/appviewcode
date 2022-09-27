//
//  LoginView.swift
//  appviewcode
//
//  Created by Gabriel Leal dos Santos on 25/09/22.
//

import UIKit

protocol BackNavigationDelegate{
    
    func pop()
}

protocol LoginDelegate{
    func login()
}

protocol ValidateFormsDelegate{
    func validate()
}

class LoginView : UIView{
    
    private let backNavigationDelegate :BackNavigationDelegate
    private let loginDelegate : LoginDelegate
    private let validateFormsDelegate : ValidateFormsDelegate
    
    init(backNavigationDelegate : BackNavigationDelegate, loginDelegate : LoginDelegate, validateFormsDelegate : ValidateFormsDelegate) {
       
        
        self.backNavigationDelegate = backNavigationDelegate
        self.loginDelegate = loginDelegate
        self.validateFormsDelegate = validateFormsDelegate
        
        super.init(frame: .zero)
        self.backgroundColor = UIColor(rgb: 0xFF002CC2)

        addSubViews()
        addConstraintsViewCirle()
        addConstraintsBackButton()
        addConstraintsLabelSignIn()
        addConstraintsContainer()
        addConstraintsLabelWelcome()
        addConstraintsLabelHelloThere()
        addConstraintsTextField()
        addConstraintsTextFieldPassword()
        addConstraintsForgetPassword()
        addConstraintsSigninButton()
        addConstraintSignupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var viewCircleFirst: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.opacity = 0.15
        
        view.clipsToBounds = true
        view.layer.cornerRadius = 75
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var viewCircleSecond: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.opacity = 0.15
        
        view.clipsToBounds = true
        view.layer.cornerRadius = 75
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var arrowBack: UIImageView = {
        var imageView = UIImageView();
        let image = UIImage(named: "custom-back")
       
        imageView.image = image;
        imageView.contentMode = .scaleAspectFit
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(backButtonAction))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var viewContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.clipsToBounds = true
        container.layer.cornerRadius = 20
        
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var labelSignIn: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = UIColor.white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelWelcome: UILabel = {
        let label = UILabel()
        label.text = "Welcome Back"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = UIColor(rgb: 0xFF02116D)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelHelloThere: UILabel = {
        let label = UILabel()
        label.text = "Hello there, sign in to continue!"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor(rgb: 0xFF171A24)
        label.layer.opacity = 0.4
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var labelFielUsername: UILabel = {
        let label = UILabel()
        label.text = "Username or email"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor(rgb: 0xFF171A24)
        label.layer.opacity = 0.4
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    private lazy var textFieldUsername: CustomTextField = {
        let textField = CustomTextField()
        textField.backgroundColor = UIColor(rgb: 0xFFFBFBFC)
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 10
        

        textField.layer.shadowColor = UIColor.red.cgColor
        textField.layer.shadowOffset = CGSize(width: 30, height: 30)
        textField.layer.shadowOpacity = 0.6
        textField.layer.shadowRadius = 10
        
        textField.placeholder = "Enter your username or email"
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.addTarget(self, action: #selector(validateForm), for: .editingChanged)
      
        return textField
    }()
    
    private lazy var labelPassword: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor(rgb: 0xFF171A24)
        label.layer.opacity = 0.4
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textFieldPassword: CustomTextField = {
        let textField = CustomTextField()
        textField.backgroundColor = UIColor(rgb: 0xFFFBFBFC)
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 10
        

        textField.layer.shadowColor = UIColor.red.cgColor
        textField.layer.shadowOffset = CGSize(width: 30, height: 30)
        textField.layer.shadowOpacity = 0.6
        textField.layer.shadowRadius = 10
        
        textField.placeholder = "Enter your password"
        
        textField.isSecureTextEntry = true
        
        textField.addTarget(self, action: #selector(validateForm), for: .editingChanged)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var forgetPassword: UILabel = {
        let label = UILabel()
        label.text = "Forget Password?"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor(rgb: 0xFF002CC2)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var signInButton : UICustomButton = {
        let button = UICustomButton(title: "Sign in" , textColor: .white )
        button.backgroundColor = UIColor(rgb: 0xFF002CC2)
        button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        button.isEnabled = false
        return button
   }()
    
    private lazy var signinLabel1: UILabel = {
        var label = UILabel()
        label.text = "Don't have an account?"
        label.font = label.font.withSize(14)
        label.textColor = UIColor(rgb: 0xFF02116D)
        label.layer.opacity = 0.4
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signinLabel2: UILabel = {
        var label = UILabel()
        label.text = "Sign up"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor(rgb: 0xFF002CC2)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2.5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private func addSubViews(){
        self.addSubview(viewCircleFirst)
        self.addSubview(viewCircleSecond)
        self.addSubview(arrowBack)
        self.addSubview(labelSignIn)
        self.addSubview(viewContainer)
        viewContainer.addSubview(labelWelcome)
        viewContainer.addSubview(labelHelloThere)
        viewContainer.addSubview(labelFielUsername)
        viewContainer.addSubview(textFieldUsername)
        viewContainer.addSubview(labelPassword)
        viewContainer.addSubview(textFieldPassword)
        viewContainer.addSubview(forgetPassword)
        viewContainer.addSubview(signInButton)
        viewContainer.addSubview(stackView)

    }
    
    private func addConstraintsViewCirle(){
        NSLayoutConstraint.activate([
            viewCircleFirst.widthAnchor.constraint(equalToConstant: 150),
            viewCircleFirst.heightAnchor.constraint(equalToConstant: 150),
            viewCircleFirst.topAnchor.constraint(equalTo: self.topAnchor, constant: -55),
            viewCircleFirst.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            viewCircleSecond.widthAnchor.constraint(equalToConstant: 150),
            viewCircleSecond.heightAnchor.constraint(equalToConstant: 150),
            viewCircleSecond.topAnchor.constraint(equalTo: self.topAnchor),
            viewCircleSecond.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 75),
            
        ])
    }
    
    private func addConstraintsBackButton(){
        NSLayoutConstraint.activate([
            arrowBack.widthAnchor.constraint(equalToConstant: 30),
            
            arrowBack.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            arrowBack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
        ])
    }

    
    private func addConstraintsLabelSignIn(){
        NSLayoutConstraint.activate([
            labelSignIn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            labelSignIn.topAnchor.constraint(equalTo: arrowBack.bottomAnchor, constant: 20)
        ])
    }
    
    private func addConstraintsContainer(){
        NSLayoutConstraint.activate([
            viewContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            viewContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewContainer.topAnchor.constraint(equalTo: labelSignIn.bottomAnchor,constant: 30)
        ])
    }
    
    private func addConstraintsLabelWelcome(){
        NSLayoutConstraint.activate([
            labelWelcome.topAnchor.constraint(equalTo: viewContainer.topAnchor,constant: 20 ),
            labelWelcome.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 40),
        ])
    }
    
    private func addConstraintsLabelHelloThere(){
        NSLayoutConstraint.activate([
            labelHelloThere.topAnchor.constraint(equalTo: labelWelcome.bottomAnchor,constant: 7 ),
            labelHelloThere.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 40),
        ])
    }
    
    private func addConstraintsTextField(){
        NSLayoutConstraint.activate([
            labelFielUsername.topAnchor.constraint(equalTo: labelHelloThere.bottomAnchor,constant: 30 ),
            labelFielUsername.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 40),
            
            textFieldUsername.topAnchor.constraint(equalTo: labelFielUsername.bottomAnchor,constant: 10 ),
            textFieldUsername.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 40),
            textFieldUsername.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -40),
          
        ])
    }
    
    private func addConstraintsTextFieldPassword(){
        NSLayoutConstraint.activate([
            labelPassword.topAnchor.constraint(equalTo: textFieldUsername.bottomAnchor,constant: 20 ),
            labelPassword.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 40),
            
            textFieldPassword.topAnchor.constraint(equalTo: labelPassword.bottomAnchor,constant: 10 ),
            textFieldPassword.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 40),
            textFieldPassword.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -40),
          
        ])
    }
    
    private func addConstraintsForgetPassword(){
        NSLayoutConstraint.activate([
            forgetPassword.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor,constant: 20),
            forgetPassword.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 40),
          
        ])
    }
    
    private func addConstraintsSigninButton(){
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: forgetPassword.bottomAnchor,constant: 20),
            signInButton.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 40),
            signInButton.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -40),
          
        ])
    }
    
    private func addConstraintSignupLabel(){
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo:  self.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        stackView.addArrangedSubview(signinLabel1)
        stackView.addArrangedSubview(signinLabel2)
    }
    
    
    @objc
    func backButtonAction() {
        self.backNavigationDelegate.pop()
    }
    
    @objc
    private func signIn(sender: UICustomButton){
        sender.showAnimation {
            self.loginDelegate.login()
        }
    }
    
    @objc
    private func validateForm(){
        guard let username = textFieldUsername.text else{
            return
        }
        
        guard let password = textFieldPassword.text else{
            return
        }
        
      
        textFieldUsername.myProperty = username.count >= 7
        textFieldPassword.myProperty = password.count >= 7
        
        signInButton.isEnabled = textFieldUsername.myProperty && textFieldPassword.myProperty
        
        self.validateFormsDelegate.validate()
    }
    
}
