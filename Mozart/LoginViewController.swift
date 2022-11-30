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
        // Do any additional setup after loading the view.
    }
    private func getAccessTokenFromWebView() {
            guard let urlRequest = APIService.shared.getAccessTokenURL() else { return }
            let webview = WKWebView()

            webview.load(urlRequest)
            webview.navigationDelegate = self
            view = webview
        }

        private func makeNetworkCall() {
            Task {
                let songs = try await APIService.shared.search()
                print(songs)
            }
        }
    

    @IBAction func onlogin(_ sender: Any) {
        let username = usernamefield.text!
        let password = passwordfield.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password){
            (user, error) in
            if user != nil {
                self.getAccessTokenFromWebView()
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
extension LoginViewController {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard let urlString = webView.url?.absoluteString else { return }
        print(urlString)
        
        var tokenString = ""
        if urlString.contains("#access_token=") {
            let range = urlString.range(of: "#access_token=")
            guard let index = range?.upperBound else { return }
            
            tokenString = String(urlString[index...])
        }
        
        if !tokenString.isEmpty {
            let range = tokenString.range(of: "&token_type=Bearer")
            guard let index = range?.lowerBound else { return }
            
            tokenString = String(tokenString[..<index])
            UserDefaults.standard.setValue(tokenString, forKey: "Authorization")
            webView.removeFromSuperview()
            makeNetworkCall()
        }
    }
}
