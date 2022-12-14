//
//  SavedViewController.swift
//  Mozart
//
//  Created by Connor Coleman on 11/17/22.
//

import UIKit
import AlamofireImage

class SavedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    
   
    @IBOutlet weak var tabelview: UITableView!
    var play = [String]()
    var urlString = [String]()
    
    func getPlaylist() async throws -> [String] {
        guard let urlRequest = await  APIService().createURLRequestPlaylist() else { throw NetworkError.invalidURL }

        print(urlRequest)
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        print(data)
        print("__________")
       // playlists = data
        let decoder = JSONDecoder()
        let results = try decoder.decode(Playlists.self, from: data)
        let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        
       // print(dataDictionary["items"])
       // let playlistsS = dataDictionary["items"] as! NSDictionary
        //print(playlists["name"])
    //    let play = playlistsS["name"] as! String
        let item = results.items
        
        print(item)
       // let items = results as! NSDictionary
     //   let items = results.items as! [[String:AnyObject]]
     //   print(items)
      //  print(items)
        let blue = results.items

        let songs = item.map({$0.name})
        let id = item.map({$0.id})
        let picUrl = item.map({$0.images})
        
       // let url =
       
        print("last")
        print(picUrl[1])
        //let picknow = picUrl as [String]
        self.play = songs
        //self.urlString = picUrl.toString()
       // print(urlString)
        //let img = picUrl as! [String]
       // print(img)
        //for(int counter = 0; count < pickUrl.size; count )
        
        
        print(urlString)
        self.tabelview.reloadData()
        print(id)
        print("hello")
        print("Return")
        print(songs)
        return songs
    }

   // let play = [String]

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
            
            //let playlistplent = try await APIService.shared.getPlaylist()
        //    play = try await getPlayli
            let playlistplent = try await getPlaylist()
            print(playlistplent)
            print("hello1")
            //self.tabelview.reloadData()            //return
         //   print(id)
         //   webView.close
            tabelview.dataSource = self
            tabelview.delegate = self
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return play.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)  -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistcell") as! PlaylistTableViewCell
        print("1")
        print(play)
       // guard case self.play = try await getPlaylist() else {return cell.textLabel!.text = " Hello"}
       // cell.textLabel!.text = self.play[indexPath.row] as? String
        
        cell.playtitle.text = self.play[indexPath.row] as? String
        // cell.textLabel!.text = "row: \(indexPath.row)"
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
struct Playlists: Codable {
    let items: [Items]
   // let name: String
}
struct Items: Codable {
    let id: String
    let images: [GetImage]
    let name: String
    let tracks: TracksUrl
}
struct GetImage: Codable {
    let url: String
}
struct TracksUrl : Codable {
    let href: String
}

