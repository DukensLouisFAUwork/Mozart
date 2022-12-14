//
//  DiscoverViewController.swift
//  Mozart
//
//  Created by Connor Coleman on 11/17/22.
//

import UIKit

class DiscoverViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var search = [String]()

    @IBOutlet weak var testseach: UITextField!
    
    @IBOutlet var seachview: UITableView!
    
    @IBAction func seachbutton(_ sender: Any) {
        
        Task {
            
            var nextString = testseach.text!

            self.search = try await APIService.shared.search(newString: nextString)
            
            
            
            seachview.reloadData()
        }
        
        
    }
    private func getSearch(){
        Task{
            search = try await APIService.shared.search()
            
            
            
            
            seachview.dataSource = self
            seachview.delegate = self
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getSearch()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //var cell = UITableViewCell()
        //cell.textLabel!.text = "row: \(indexPath.row)"
        var cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchCell
        
         cell.seachtext.text = self.search[indexPath.row] as? String
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
