//
//  SpotifyloginViewController.swift
//  Mozart
//
//  Created by dukens on 12/6/22.
//

import UIKit
import Parse
import WebKit


class SpotifyloginViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
       // getAccessTokenFromWebView
        getAccessTokenFromWebView()
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
                let newsongs = try await APIService.shared.createURLRequestPlaylist()
               // let id = try await   APIService.shared.getId()
              //  print(songs)
              //  print("hello")
                //return
               // print(id)
             //   webView.close
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
extension SpotifyloginViewController: WKNavigationDelegate{
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
            print(tokenString)
            UserDefaults.standard.setValue(tokenString, forKey: "Authorization")
            webView.removeFromSuperview()
            self.performSegue(withIdentifier: "continue", sender: nil)
        //  moveToVc()
            //makeNetworkCall()
        }
    }
  /*  func moveToVc(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier:
                                                                "SpotifyloginViewController") as! SpotifyloginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }*/
}
