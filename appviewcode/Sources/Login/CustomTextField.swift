//
//  CustomTextField.swift
//  appviewcode
//
//  Created by Gabriel Leal dos Santos on 25/09/22.
//

import UIKit

class CustomTextField: UITextField {
    
    var myProperty: Bool = false {
        didSet {
            
            UIView.transition(with: self, duration: 0.25, options: [.transitionCrossDissolve], animations: {
                if(self.myProperty){
                    self.addSubview(self.checkTextField)
                    self.addConstraintsCheckField()
                }else{
                    self.checkTextField.removeFromSuperview()
                }
            }, completion: nil)
        }
    }
    
    private lazy var checkTextField: UIImageView = {
        var imageView = UIImageView();
        let image = UIImage(named: "check")
       
        imageView.image = image;
        imageView.contentMode = .scaleAspectFit
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    init(){
        super.init(frame: .zero)
    }
    
    private func addConstraintsCheckField(){
        NSLayoutConstraint.activate([
            checkTextField.widthAnchor.constraint(equalToConstant: 15),
            checkTextField.heightAnchor.constraint(equalToConstant: 15),
            checkTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            checkTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            
        ])
    }

    let padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8);

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

extension CustomTextField {
    func showCheckField(_ completionBlock: @escaping () -> Void) {
        isUserInteractionEnabled = false
        self.addSubview(self.checkTextField)
        self.addConstraintsCheckField()
        
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       options: .curveLinear,
                       animations: { [weak self] in
                            self?.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
                           
        }) {  (done) in
            UIView.animate(withDuration: 0.1,
                           delay: 0,
                           options: .curveLinear,
                           animations: { [weak self] in
                                self?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                              
            }) { [weak self] (_) in
                self?.isUserInteractionEnabled = true
                completionBlock()
            }
        }
    }
}

