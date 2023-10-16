//
//  LoginVc.swift
//  ThirdApp
//
//  Created by Nandan R on 28/09/23.
//

import UIKit

class LoginVc: UIViewController {

    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var uNameTf: UITextField!
    
    @IBOutlet weak var passTf: UITextField!
    
    @IBOutlet weak var loginTf: UIButton!
    
    var username = ""
    
    var isEmailValid = false
    var isPwdValid = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //to automatically bring the cursor to name
        uNameTf.becomeFirstResponder()
        loginTf.isEnabled = false
        
        uNameTf.delegate = self
        passTf.delegate = self
        
        titleL.text = "\(username) Please login"
    }
    
    @IBAction func loginBut(_ sender: Any) {
    }
    
    @IBAction func cancelBut(_ sender: Any) {
        
        uNameTf.text = ""
        passTf.text = ""
        
        uNameTf.backgroundColor = .white
        passTf.backgroundColor = .white
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LoginVc: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField{
        case uNameTf:
            passTf.becomeFirstResponder()
        case passTf:
            passTf.resignFirstResponder()
        default:
            break
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let data = textField.text ?? ""
        
        switch textField{
        case uNameTf:
            print("uname \(data)")
            isEmailValid = validateEmail(data)
            
            if isEmailValid{
                uNameTf.backgroundColor = .white
            }
            else{
                uNameTf.backgroundColor = .red
            }
        case passTf:
            print("password: \(data)")
            isPwdValid = validatePassword(data)
            
            if isPwdValid{
                passTf.backgroundColor = .white
            }
            else{
                passTf.backgroundColor = .red
            }
            
            if isPwdValid && isEmailValid{
                loginTf.isEnabled = true
            }
            
            
        default:
            break
        }
    }
    
    func validateEmail(_ email: String) -> Bool{
        if email.contains("@") && email.contains(".") && email.count > 4{
            return true
        }
        return false
    }
    
    func validatePassword(_ pwd: String) -> Bool{
        if pwd.count >= 8{
            return true
        }
        return false
    }
}
