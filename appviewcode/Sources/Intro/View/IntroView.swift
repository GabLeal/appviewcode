//
//  IntroView.swift
//  viewcodestudy
//
//  Created by Gabriel Leal dos Santos on 12/08/22.
//

import Foundation
import UIKit


protocol SignWithGoogleDelegate{
    func signin()
}

class IntroView : UIView{
    
    var delegate: SignWithGoogleDelegate?
    
    private lazy var image: UIImageView = {
    
        var imageView = UIImageView();
        let image = UIImage(named: "app.png")
        imageView.image = image;
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var welcomeLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Welcome"
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Manager your expenses"
        label.font = label.font.withSize(16)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var subLabel: UILabel = {
        var label = UILabel()
        label.text = "seamlessly & intuitively"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
     private lazy var signInButton : UICustomButton = {
        let button = UICustomButton(title: "Sign in with google" , textColor:  UIColor(rgb: 0xFF011699) )
        button.backgroundColor = UIColor.white
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var createAccountButton : UICustomButton = {
        let button = UICustomButton(title: "Create an account" , textColor: UIColor.white)
      
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var signinLabel1: UILabel = {
        var label = UILabel()
        label.text = "Already have an account?"
        label.font = label.font.withSize(14)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var signinLabel2: UILabel = {
        var label = UILabel()
        label.text = "Sign In"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.white
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
    
    init(){
        super.init(frame: .zero)
        backgroundColor = UIColor(rgb: 0xFF002CC2)
        addSubViews()
        constraintSayHelloButton()
        constraintImage()
        constraintWelcomeLabel()
        constraintTitleLabel()
        constraintSubabel()
        constraintSigninLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func addSubViews(){
        addSubview(image)
        addSubview(welcomeLabel)
        addSubview(titleLabel)
        addSubview(subLabel)
        addSubview(signInButton)
        addSubview(createAccountButton)
        addSubview(stackView)
    }

    
    private func constraintImage(){
       let constraint = [
        image.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
        image.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
        image.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
        image.heightAnchor.constraint(equalToConstant: 300),
        image.widthAnchor.constraint(equalToConstant: 300),
       ]
        
        constraint.forEach { component in
            component.isActive = true
        }
    }
    
    private func constraintWelcomeLabel(){
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    private func constraintTitleLabel(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    private func constraintSubabel(){
        NSLayoutConstraint.activate([
            subLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    private func constraintSayHelloButton(){
       let constraint = [
        signInButton.topAnchor.constraint(equalTo: subLabel.bottomAnchor ,constant: 40),
        signInButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
        signInButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
        
        createAccountButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor ,constant: 10),
        createAccountButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
        createAccountButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
           
       ]
        
        constraint.forEach { component in
            component.isActive = true
        }
    }
    
    private func configStackview(){
        
    }
    
    private func constraintSigninLabel(){
        NSLayoutConstraint.activate([
            //stackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            //stackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.topAnchor.constraint(equalTo:  createAccountButton.bottomAnchor,constant: 30)
        ])
        
        stackView.addArrangedSubview(signinLabel1)
        stackView.addArrangedSubview(signinLabel2)
    }
    
    @objc
    func buttonAction(sender: UICustomButton) {
        sender.showAnimation {
            self.delegate?.signin()
        }
       
    }
}


extension UIColor {

    convenience init(rgb: UInt) {
        self.init(rgb: rgb, alpha: 1.0)
    }

    convenience init(rgb: UInt, alpha: CGFloat) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}
