//
//  LoginViewController.swift
//  Exercício 14
//
//  Created by Henrique Marques on 10/04/22.
//

import UIKit

class LoginViewController: UIViewController {

    let WelcomeLabel: UILabel = {
        let mailLabel = UILabel()
        mailLabel.text = "Email"
        return mailLabel
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(WelcomeLabel)
    }


}
