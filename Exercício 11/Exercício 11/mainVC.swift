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
        yay.frame = CGRect(x: -10, y: 50, width: 400, height: 200)
        return yay
    }()
    
    let SetDogImage: UIImageView = {
        let dogimage = UIImage(named: "doggo")
        let dog = UIImageView(image: dogimage)
        dog.frame = CGRect(x: 90, y: 200, width: 200, height: 200)
        return dog
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        view.addSubview(YayLabel)
        view.addSubview(SetDogImage)

    }
}

extension mainVC: ViewControllerDelegate {
    func notificar(msg: String) {
        print(msg)
    }
}
