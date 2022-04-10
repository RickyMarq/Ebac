//
//  ViewController.swift
//  Exercício 12
//
//  Created by Henrique Marques on 08/04/22.
//

import UIKit

protocol DataDelegate {
    func notify(msg: String)
}

class FirstViewController: UIViewController, DataDelegate {
    func notify(msg: String) {
        print(msg)
    }
    
    let SetLabel: UILabel = {
        let label = UILabel()
        label.text = "Olá, eu sou a primeira \n ViewController"
        label.textAlignment = NSTextAlignment.center
        label.numberOfLines = 2
        label.frame = CGRect(x: 100, y: 150, width: 200, height: 200)
        return label
    }()
    
    let SetButton: UIButton = {
        let button = UIButton()
        button.setTitle("SecondViewController", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemMint
        button.frame = CGRect(x: 100, y: 300, width: 200, height: 50)
        button.addTarget(self, action: #selector(ButtonPressed), for: .touchUpInside)
        return button
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        view.addSubview(SetLabel)
        view.addSubview(SetButton)
    }
    
    @objc func ButtonPressed() {
        
        let vc = SecondViewController()
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
    
}

