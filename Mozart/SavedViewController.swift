//
//  SavedViewController.swift
//  Mozart
//
//  Created by Connor Coleman on 11/17/22.
//

import UIKit
import Alamofire
import AlamofireImage


class SavedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var name: Array<String> = []
    var name2 = [String]()

 
    

    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        makeNetworkCall()
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        
        // Do any additional setup after loading the view.
    }
    
    private func makeNetworkCall() {
        Task {
            //let playlistplent = try await APIService.shared.getPlaylist()
            self.name2 = try await APIService.shared.getPlaylist()
            print(name2[1])
            self.tableView.reloadData()
            //completed()
            //print(type(of:playlistplent))
            //return (playlistplent)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        //let cell = UITableViewCell()
        //makeNetworkCall()
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistCell", for: indexPath)
        //var name = ["Test", "test2", "tEst5", "testy", "test6", "test7", "test8", "test9"]
            print(name2)
        //cell.textLabel?.text = "\(indexPath.row+1)" + name2[indexPath.row+1]
            return cell
    
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
