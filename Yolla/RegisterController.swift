//
//  RegisterController.swift
//  Yolla
//
//  Created by Eda Altuntaş on 31.03.2022.
//

import UIKit
import FirebaseAuth

class RegisterController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func registerButton(_ sender: Any) {
        register()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
        setTextFieldPadding()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if emailField.isFirstResponder, passwordField.text!.isEmpty {
            passwordField.becomeFirstResponder()
        } else {
            if textField == passwordField {
                register()
            }
            textField.resignFirstResponder()
        }
        return true
    }

    @objc func register(){
        Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { response, error in
            guard error == nil else { return self.displayError(error) }
            self.performSegue(withIdentifier: "registerToMain", sender: nil)
        }
    }
    
    func setTextFieldPadding() {
        emailField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: emailField.frame.height))
        emailField.leftViewMode = .always
        emailField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: emailField.frame.height))
        emailField.rightViewMode = .always
        passwordField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: passwordField.frame.height))
        passwordField.leftViewMode = .always
        passwordField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: passwordField.frame.height))
        passwordField.rightViewMode = .always
    }
}
