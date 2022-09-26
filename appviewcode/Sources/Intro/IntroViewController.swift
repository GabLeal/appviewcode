//
//  ViewController.swift
//  appviewcode
//
//  Created by Gabriel Leal dos Santos on 25/09/22.
//

import UIKit

class IntroViewController: UIViewController {
    
    private var customView: IntroView? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
    }

    private func buildView(){
        view = IntroView()
        customView = view as? IntroView
        
        customView?.delegate = self
        
    }

}

extension IntroViewController: SignWithGoogleDelegate {
    func signin() {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
}
