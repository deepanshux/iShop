//
//  LoginViewController.swift
//  iShop
//
//  Created by Deepanshu Jain on 05/06/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setDelegates()
    }
   
    @IBAction func TapOnLoginButton(_ sender: Any) {
        updateUI(isLoading: true)
        checkLogin()
        return
    }
    
    @IBAction func TapOnSignUpButton(_ sender: Any) {
        navigateToSignUp()
    }
    
    private func checkLogin() {
        let request = LoginRequest(username: usernameField.text, password: passwordField.text)
        loginViewModel.loginUser(request: request, completion: { login in
            self.updateUI(isLoading: false)
            if (login == true) {
                self.navigateToHome()
            }
            else {
                self.showAlert()
            }
        })
    }
    
    private func setDelegates() {
        usernameField.delegate = self
        passwordField.delegate = self
    }
    
    private func updateUI(isLoading : Bool){
        loginButton.isEnabled = !isLoading
        isLoading ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
    
    private func navigateToHome(){
        let tabBarViewController = storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
        self.navigationController?.pushViewController(tabBarViewController, animated: true)
    }
    
    private func navigateToSignUp(){
        let signUpViewController = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    private func showAlert(){
        AlertManager.showAlert(title: "Incorrect", message: "Username or passoword is incorrect", buttonTitle: "Try Again")
    }
    
}

// MARK: - Text Field Delegate Methods

extension LoginViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameField.resignFirstResponder()
        passwordField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        usernameField.layer.borderWidth = 0
        passwordField.layer.borderWidth = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
