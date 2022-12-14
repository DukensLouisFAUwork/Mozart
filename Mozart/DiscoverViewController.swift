//
//  DiscoverViewController.swift
//  Mozart
//
//  Created by Connor Coleman on 11/17/22.
//

import UIKit

class DiscoverViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var search = [String]()

    @IBOutlet weak var seach: UITextField!
  
    
    @IBAction func seachbutton(_ sender: Any) {
        
        
        
    }
    //func getSearch()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel!.text = "row: \(indexPath.row)"
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
