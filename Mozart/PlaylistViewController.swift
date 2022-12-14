//
//  PlaylistViewController.swift
//  Mozart
//
//  Created by Connor Coleman on 11/17/22.
//

import UIKit

class PlaylistViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeNetworkCall()
        // Do any additional setup after loading the view.
    }
    
    private func makeNetworkCall() {
        Task {
            //   let songs = try await APIService.shared.search()
            //  let id = try await   APIService.shared.getId()
            
            
            //    let newsongs = try await APIService.shared.createURLRequestPlaylist()
            
            let playlistplent = try await APIService.shared.getPlaylist()
            
            print(playlistplent)
            print("hello")
            //return
            //   print(id)
            //   webView.close
        }
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}


