//
//  LoginViewController.swift
//  Mozart
//
//  Created by Connor Coleman on 11/17/22.
//

import UIKit
import Parse
import WebKit

class LoginViewController: UIViewController, WKNavigationDelegate {
    
    
    @IBOutlet weak var usernamefield: UITextField!
    
    @IBOutlet weak var passwordfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.getAccessTokenFromWebView()
        // Do any additional setup after loading the view.
    }

    override func  viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginsegue", sender: nil)
        }
    }

    
    @IBAction func onlogin(_ sender: Any) {
        let username = usernamefield.text!
        let password = passwordfield.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password){
            (user, error) in
            if user != nil {
                UserDefaults.standard.set(true, forKey: "userLoggedIn")
                self.performSegue(withIdentifier: "loginsegue", sender: nil)}
            else{
                    print("Error: \(error?.localizedDescription)")
                
            }
        }
    }
    
    @IBAction func onsignup(_ sender: Any) {
        var user = PFUser()
        user.username = usernamefield.text
        user.password = passwordfield.text
        
        user.signUpInBackground(){(sucess,error) in
            if sucess {
                self.performSegue(withIdentifier: "loginsegue", sender: nil)
            } else{
                print("Error: \(error?.localizedDescription)")
            }
            
        }
        
        
        
        
        
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

