//
//  ViewController.swift
//  Exercício 11
//
//  Created by Henrique Marques on 05/04/22.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func notificar(msg: String)
}

weak var delegate: ViewControllerDelegate?



// Extensão para colorir labels

extension String {
    func attributedStringWithColor(_ strings: [String], color: UIColor, characterSpacing: UInt? = nil) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        for string in strings {
            let range = (self as NSString).range(of: string)
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        }
        guard let characterSpacing = characterSpacing else {return attributedString}
        attributedString.addAttribute(NSAttributedString.Key.kern, value: characterSpacing, range: NSRange(location: 0, length: attributedString.length))
        return attributedString
    }
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    
    let SetBackgroundColor = UIColor(red: 242/256, green: 242/256, blue: 242/256, alpha: 1.0)
   
    @objc func openNextView() {
        let mainVC = mainVC()
        present(mainVC, animated: true, completion: nil)
    }
    
    private func configureTextsFields() {
        SetupEmailField.delegate = self
        SetupSenhaField.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        SetupEmailField.resignFirstResponder()
        SetupSenhaField.resignFirstResponder()
        return true
    }
    
    @objc private func EsconderTeclado() {
        self.view.endEditing(true)
    }
    
    
    let SetupImagemOndas: UIImageView = {
        let imagem = UIImage(named: "wave")
        let Ondas = UIImageView(image: imagem)
        Ondas.clipsToBounds = true
        Ondas.translatesAutoresizingMaskIntoConstraints = false
        return Ondas
    }()
    
    let SetupTextoOlá: UILabel = {
       let BoasVindas = UILabel()
        BoasVindas.text = "Olá"
        BoasVindas.font = UIFont.boldSystemFont(ofSize: 60)
        BoasVindas.textAlignment = .left
        BoasVindas.textColor = .black
        BoasVindas.translatesAutoresizingMaskIntoConstraints = false
        return BoasVindas
    }()
    
    let SetupTextoLogue: UILabel = {
        let Logue = UILabel()
        Logue.text = "Logue na sua conta"
        Logue.textAlignment = .left
        Logue.textColor = .lightGray
        Logue.translatesAutoresizingMaskIntoConstraints = false
        return Logue
    }()
    
    let SetupEmailField: UITextField = {
        let Mail = UITextField()
        Mail.placeholder = "Insira seu email..."
        Mail.autocapitalizationType = .none
        Mail.autocorrectionType = .no
        Mail.backgroundColor = .white
        Mail.layer.cornerRadius = 20
        Mail.translatesAutoresizingMaskIntoConstraints = false
        return Mail
    }()
    
    let SetupSenhaField: UITextField = {
        let Senha = UITextField()
        Senha.placeholder = "Insira seu email..."
        Senha.autocapitalizationType = .none
        Senha.autocorrectionType = .no
        Senha.backgroundColor = .white
        Senha.layer.cornerRadius = 20
        Senha.translatesAutoresizingMaskIntoConstraints = false
        return Senha
    }()
    
    let SetupLoginButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("LOGIN", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(openNextView), for: .touchUpInside)
        return button
    }()
    
    let SetupLabelConta: UILabel = {
        let String: NSAttributedString = "Não tem conta ? Crie".attributedStringWithColor(["Crie"], color: UIColor.orange)
        let CreateAcconut = UILabel()
        CreateAcconut.textColor = .lightGray
        CreateAcconut.textAlignment = .center
        CreateAcconut.attributedText = String
        CreateAcconut.translatesAutoresizingMaskIntoConstraints = false
        return CreateAcconut
    }()
    
        
    private func setupLayout() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(EsconderTeclado)))
        let Constraints = [
            
            SetupImagemOndas.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            SetupImagemOndas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            SetupImagemOndas.topAnchor.constraint(equalTo: view.topAnchor),
            SetupImagemOndas.widthAnchor.constraint(equalToConstant: 400),
            SetupImagemOndas.heightAnchor.constraint(equalToConstant: 400),
            
            SetupTextoOlá.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            SetupTextoOlá.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -45),
            SetupTextoOlá.widthAnchor.constraint(equalToConstant: 300),
            SetupTextoOlá.heightAnchor.constraint(equalToConstant: 300),
            
            SetupTextoLogue.topAnchor.constraint(equalTo: SetupTextoOlá.bottomAnchor, constant: -200),
            SetupTextoLogue.leadingAnchor.constraint(equalTo: SetupTextoOlá.leadingAnchor),
            SetupTextoLogue.widthAnchor.constraint(equalToConstant: 200),
            SetupTextoLogue.heightAnchor.constraint(equalToConstant: 200),
            
            SetupEmailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            SetupEmailField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 70),
            SetupEmailField.widthAnchor.constraint(equalToConstant: 300),
            SetupEmailField.heightAnchor.constraint(equalToConstant: 40),
    
            SetupSenhaField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            SetupSenhaField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 140),
            SetupSenhaField.widthAnchor.constraint(equalToConstant: 300),
            SetupSenhaField.heightAnchor.constraint(equalToConstant: 40),
            
            SetupLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            SetupLoginButton.centerYAnchor.constraint(equalTo: SetupSenhaField.centerYAnchor, constant: 70),
            SetupLoginButton.widthAnchor.constraint(equalToConstant: 170),
            SetupLoginButton.heightAnchor.constraint(equalToConstant: 40),
            
            SetupLabelConta.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            SetupLabelConta.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50),
            SetupLabelConta.widthAnchor.constraint(equalToConstant: 200),
            SetupLabelConta.heightAnchor.constraint(equalToConstant: 200),
        
        ]
        
        NSLayoutConstraint.activate(Constraints)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextsFields()
        view.backgroundColor = SetBackgroundColor
        view.addSubview(SetupImagemOndas)
        view.addSubview(SetupTextoOlá)
        view.addSubview(SetupTextoLogue)
        view.addSubview(SetupEmailField)
        view.addSubview(SetupSenhaField)
        view.addSubview(SetupLoginButton)
        view.addSubview(SetupLabelConta)
        delegate?.notificar(msg: "Cheguei na mainVC")
        setupLayout()
        // Exercício: Passar valores entre model, view ou ViewController usando delegates e protocols.
    

    
    }
    
}

