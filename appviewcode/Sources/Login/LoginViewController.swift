//
//  LoginViewController.swift
//  appviewcode
//
//  Created by Gabriel Leal dos Santos on 25/09/22.
//

import UIKit

final class LoginViewController: UIViewController{
    
    private var loginView: LoginView? = nil
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
        
        buildView()
    }
    
    private func buildView(){
        view = LoginView(backNavigationDelegate: self,loginDelegate: self,validateFormsDelegate: self)
        loginView = view as? LoginView
        
    }
   
}

extension LoginViewController: BackNavigationDelegate{
    func pop() {
        self.navigationController?.popViewController(animated: true)
    }
}
    
extension LoginViewController: LoginDelegate{
    func login() {
        print("Deve realizar o login...")
    }
}
        
extension LoginViewController: ValidateFormsDelegate{
    func validate() {
        print("Deve realizar uma validação...")
    }
}
