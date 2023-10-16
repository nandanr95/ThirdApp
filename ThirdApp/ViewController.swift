//
//  ViewController.swift
//  ThirdApp
//
//  Created by Nandan R on 28/09/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var loginBOutlet: UIButton!
    
    var okToNavigate = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameTf.layer.borderWidth = 3
        nameTf.layer.cornerRadius = 8
        
        nameTf.becomeFirstResponder()
        nameTf.delegate = self
    }

    @IBAction func loginButton(_ sender: Any) {
        
        let name = nameTf.text ?? ""
        
        let isFirstCharDigit = name.first?.isNumber ?? false
        
        if !isFirstCharDigit{
            okToNavigate = true
        }
        else{
            okToNavigate = false
        }
        
        if !name.isEmpty{
            print("name entered \(name)")
        }
        
        else{
            print("name not entered")
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return okToNavigate
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginSegue"{
            let name = nameTf.text ?? ""
            
            let loginViewController = segue.destination as! LoginVc
            
            loginViewController.username = name
        }
    }
   
   
    
}
extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        nameTf.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("shouldChangeCharactersIn: \(string), \(textField.text ?? "")")
        
        
        if textField.text?.count == 4{
            loginBOutlet.isEnabled == true
        }
        if string.isEmpty{
            return true
        }
        else{
            if let _ = string.first?.asciiValue{
                return true
            }
            else{
                return false
            }
        }
        
        
    }
    
    
    
    
}

