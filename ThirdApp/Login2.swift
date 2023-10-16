//
//  Login2.swift
//  ThirdApp
//
//  Created by Nandan R on 28/09/23.
//

import UIKit

class Login2: UIViewController {

    @IBOutlet weak var emailTf: UITextField!
    
    @IBOutlet weak var nameTf: UITextField!
    
    @IBOutlet weak var mobileTf: UITextField!
    
    @IBOutlet weak var passTf: UITextField!
    
    @IBOutlet weak var cPassTf: UITextField!
    
    @IBOutlet weak var addressTf: UITextView!
    
    @IBOutlet weak var registerB: UIButton!
    
    
    var isEmailValid = false
    var isPwdValid = false
    var isMobileValid = false
    var isCpwdValid = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTf.becomeFirstResponder()
//        registerB.isEnabled = false
    
        nameTf.delegate = self
        emailTf.delegate = self
        mobileTf.delegate = self
        passTf.delegate = self
        cPassTf.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerBut(_ sender: Any) {
        if isEmailValid && isPwdValid && isCpwdValid && isMobileValid{
//            let vc = storyboard?.instantiateViewController(identifier: "regsuccess") as! RegSucess
//            
//            present(vc, animated: true)
            
            showAlert(msg: "Make sure the following details:\n Email: \(emailTf.text!)\n Name: \(nameTf.text!) \n Mobile: \((mobileTf.text)!) \n Address: \(addressTf.text ?? "Not Entered")")
        }
        
        
        
        else{
            print("invalid entries")
            showAlert(title: "Error", msg: "Enter valid details" )
        }
        
    }
    
    
    @IBAction func CancelBut(_ sender: Any) {
        
        emailTf.text = ""
        nameTf.text = ""
        passTf.text = ""
        mobileTf.text = ""
        cPassTf.text = ""
        addressTf.text = ""
        
        
        emailTf.backgroundColor = .white
        nameTf.backgroundColor = .white
        passTf.backgroundColor = .white
        cPassTf.backgroundColor = .white
        mobileTf.backgroundColor = .white
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

extension Login2: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField{
        case emailTf:
            nameTf.becomeFirstResponder()
        case nameTf:
            mobileTf.becomeFirstResponder()
        case mobileTf:
            passTf.becomeFirstResponder()
        case passTf:
            cPassTf.becomeFirstResponder()
        case cPassTf:
            addressTf.becomeFirstResponder()
        case addressTf:
            addressTf.resignFirstResponder()
        default:
            break
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let data = textField.text ?? ""
        
        switch textField{
        case emailTf:
            print("email: \(data)")
            isEmailValid = emailValidate(data)
            
            emailTf.backgroundColor = isEmailValid ? .white : .red
        case nameTf:
            print("name: \(data)")
        case mobileTf:
            print("mobile: \(data)")
            isMobileValid = mobileValidate(data)
            mobileTf.backgroundColor = isMobileValid ? .white : .red
        case passTf:
            print("password: \(data)")
            
            isPwdValid = passValidate(data)
            passTf.backgroundColor = isPwdValid ? .white : .red
        case cPassTf:
            print("email: \(data)")
            isCpwdValid = cPassValidate(data)
            cPassTf.backgroundColor = isCpwdValid ? .white : .red
            
//            registerB.isEnabled =
//            isEmailValid && isPwdValid && isCpwdValid && isMobileValid ?
//            true : false
        default:
            break
        }
    }
    
    func emailValidate(_ email: String) -> Bool{
        if email.contains("@") && email.contains(".") && email.count>4{
            return true
        }
        else{
            return false
        }
    }
    
    func passValidate(_ pwd: String) -> Bool{
        return pwd.count >= 8 ? true : false
    }
    
    func cPassValidate(_ cPwd: String) -> Bool{
        return cPwd == passTf.text
    }
    
    func mobileValidate(_ mobile: String) -> Bool{
        return mobile.count == 10 ? true : false
    }
}
