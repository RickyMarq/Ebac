
import UIKit
import Firebase

// TODO: protocol delegate

protocol SignUpControllerDelegate: AnyObject {
    func didSignUpComplete()
}

class SignUpController: UIViewController {
      
    // TODO: delegate var
    
    weak var delegate: SignUpControllerDelegate?
    
    lazy var emailTextField: UITextField = {
        let email = UITextField()
        email.placeholder = "Email"
        email.backgroundColor = UIColor(white: 0, alpha: 0.03)
        email.borderStyle = .roundedRect
        email.keyboardType = .emailAddress
        email.autocapitalizationType = .none
        email.font = .systemFont(ofSize: 14)
        email.addTarget(self, action: #selector(handleTextInputChanger), for: .editingChanged)
        
        return email
    }()
    
    @objc
    func handleTextInputChanger() {
        let isEmailValid = emailTextField.text?.isEmpty != true &&
            passwordTextField.text?.isEmpty != true
        
        if isEmailValid {
            signUpButton.isEnabled = true
            signUpButton.backgroundColor = UIColor.rgb(red: 17, green: 154, blue: 237)
        } else {
            signUpButton.isEnabled = false
            signUpButton.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244)
        }
    }
    
    lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        password.backgroundColor = UIColor(white: 0, alpha: 0.03)
        password.borderStyle = .roundedRect
        password.font = .systemFont(ofSize: 14)
        password.addTarget(self, action: #selector(handleTextInputChanger), for: .editingChanged)
        
        return password
    }()
    
    lazy var signUpButton: UIButton = {
        let signUp = UIButton(type: .system)
        signUp.setTitle("SignUp", for: .normal)
        signUp.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244)
        signUp.layer.cornerRadius = 5
        signUp.titleLabel?.font = .systemFont(ofSize: 14)
        signUp.setTitleColor(.white, for: .normal)
        signUp.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
        signUp.isEnabled = false
        return signUp
    }()
    
    @objc func handleSignup() {
        guard let email = emailTextField.text, !email.isEmpty else { return }
        guard let password = passwordTextField.text, !password.isEmpty else { return }

        // TODO: Auth create user
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error: Error?) in
            
            if let err = error {
                print("Erro", err)
                print("Email", email)
                
                self.dispatchAlert("Erro", message: "\(err) com o email \(email)")
                return
            }
            
            print("Sucesso userID", user?.user.uid ?? "")
            self.delegate?.didSignUpComplete()
            self.dismiss(animated: true, completion: nil)
            
        })
        

    }
    
    lazy var alreadyHaveAccountButton: UIButton = {
        let button =  UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let attributedTitle = NSMutableAttributedString(string: "Já tem uma conta  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        attributedTitle.append(NSAttributedString(string: "Sign In.", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 17, green: 154, blue: 237)]))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
      
        button.addTarget(self, action: #selector(handleAlreadyHaveAccount), for: .touchUpInside)
       
        return button
    }()
    
    @objc func handleAlreadyHaveAccount() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(alreadyHaveAccountButton)
        
        NSLayoutConstraint.activate([
            alreadyHaveAccountButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            alreadyHaveAccountButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            alreadyHaveAccountButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            alreadyHaveAccountButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.backgroundColor = .white
        
        setupInputField()
        
    }
    
    fileprivate func setupInputField() {
        let stackView = UIStackView(arrangedSubviews: [
            emailTextField, passwordTextField, signUpButton
        ])

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
    
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            stackView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

