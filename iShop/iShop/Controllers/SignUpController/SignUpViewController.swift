//
//  SignUpViewController.swift
//  iShop
//
//  Created by Deepanshu Jain on 06/06/23.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var confirmPassField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setDelegates()
    }
    
    @IBAction func tapOnCreateAccount(_ sender: Any) {
        return
    }
    
    @IBAction func tapOnLogin(_ sender: Any) {
        navigateToLogin()
    }
    
    private func setDelegates() {
        nameField.delegate = self
        emailField.delegate = self
        passField.delegate = self
        confirmPassField.delegate = self
    }
    
    private func checkSignUp(){
        let request = createRequest()
        
    }
    
    private func createRequest()->SignUpRequest{
        let request = SignUpRequest(name: nameField.text, email: emailField.text, password: passField.text, confirmPass: confirmPassField.text)
        return request
    }
    private func navigateToLogin(){
        let loginViewController = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
}

// MARK: - Text Field Delegate Methods

extension SignUpViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameField.resignFirstResponder()
        passField.resignFirstResponder()
        emailField.resignFirstResponder()
        confirmPassField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
