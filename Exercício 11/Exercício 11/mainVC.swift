//
//  AnotherViewController.swift
//  Exercício 11
//
//  Created by Henrique Marques on 06/04/22.
//

import UIKit

class mainVC: UIViewController {
    
    
    
//     func Prepare( for passar: UIStoryboardSegue, sender: Any?) {
//        if passar.identifier == "ViewController" {
//            let controller = passar.identifier as? ViewController
//        }
//    }
        
    let YayLabel: UILabel = {
        let yay = UILabel()
        yay.text = "Yay, você passou dados \n com protocols e delegates"
        yay.numberOfLines = 2
        yay.textAlignment = .center
        return yay
    }()
    
    let SetDogImage: UIImageView = {
        let dogimage = UIImage(named: "doggo")
        let dog = UIImageView(image: dogimage)
        return dog
    }()
    
    func SetupConstraints() {
       
        let Constraints = [
        
            YayLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            YayLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            YayLabel.widthAnchor.constraint(equalToConstant: 50),
            YayLabel.heightAnchor.constraint(equalToConstant: 50),
            
            
//            SetDogImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            SetDogImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//            SetDogImage.widthAnchor.constraint(equalToConstant: 50),
//            SetDogImage.heightAnchor.constraint(equalToConstant: 50),
        
        ]
       
        NSLayoutConstraint.activate(Constraints)
        
    }
        

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        view.addSubview(YayLabel)
        SetupConstraints()

    }
}

extension mainVC: ViewControllerDelegate {
    func notificar(msg: String) {
        print(msg)
    }
}
