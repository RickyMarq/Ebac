//
//  SecondViewController.swift
//  Exercício 12
//
//  Created by Henrique Marques on 08/04/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    lazy var SetLabelYay: UILabel = {
        let label = UILabel()
        label.text = "Yay, você passou dados entre View \n com Protocols e Extensions"
        label.numberOfLines = 2
        label.textAlignment = NSTextAlignment.center
        label.textColor = .black
        label.frame = CGRect(x: 50, y: 0, width: 300, height: 300)
        return label
    }()
    
    lazy var SetDogImage: UIImageView = {
        let dogimage = UIImage(named: "doggo")
        let dog = UIImageView(image: dogimage)
        dog.frame = CGRect(x: 90, y: 200, width: 200, height: 200)
        return dog
    }()

    var delegate:DataDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        view.addSubview(SetLabelYay)
        view.addSubview(SetDogImage)
        delegate?.notify(msg: "Cheguei na segunda viewController")
    }
}
