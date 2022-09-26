//
//  CustomButton.swift
//  appviewcode
//
//  Created by Gabriel Leal dos Santos on 25/09/22.
//

import UIKit

class UICustomButton : UIButton{
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    init(title: String, textColor: UIColor){
        super.init(frame: .zero)
        self.setTitle(title , for: .normal)
        self.setTitleColor(textColor, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        self.clipsToBounds = true
        self.layer.cornerRadius = 12
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2
        
        
        //desativamos essa propriedade para usar as contraits de forma programavel
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override var isEnabled: Bool {
        didSet {
            UIView.transition(with: self, duration: 0.25, options: [.transitionCrossDissolve], animations: { [self] in
                self.alpha = isEnabled ? 1.0 : 0.5
            }, completion: nil)
          
        }
    }
    
}

extension UICustomButton {
    func showAnimation(_ completionBlock: @escaping () -> Void) {
      isUserInteractionEnabled = false
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

