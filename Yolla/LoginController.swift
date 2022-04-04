//
//  LoginController.swift
//  Yolla
//
//  Created by Eda Altuntaş on 31.03.2022.
//

import UIKit
import FirebaseAuth

class LoginController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func loginButton(_ sender: Any) {
        login()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
        setTextFieldPadding()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
    }
        
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        if Auth.auth().currentUser != nil {
            performSegue(withIdentifier: "loginToMain", sender: nil)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if emailField.isFirstResponder, passwordField.text!.isEmpty {
            passwordField.becomeFirstResponder()
        } else {
            if textField == passwordField {
                login()
            }
            textField.resignFirstResponder()
        }
        return true
    }
    
    @objc func login(){
        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { result, error in
            guard error == nil else {
                self.displayError(error)
                return
            }
            self.performSegue(withIdentifier: "loginToMain", sender: nil)
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
