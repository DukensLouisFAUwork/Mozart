//
//  APIService.swift
//  Mozart
//
//  Created by dukens on 11/29/22.
//

import Foundation
import UIKit
import AlamofireImage
import Alamofire



class APIService {

    static let shared = APIService()
    var playlistsS = [[String:Any]]()

    func getAccessTokenURL() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = ApiConstants.authHost
        components.path = "/authorize"

        components.queryItems = ApiConstants.authParams.map({URLQueryItem(name: $0, value: $1)})

        guard let url = components.url else { return nil }
        print(components.queryItems)

        return URLRequest(url: url)
    }

    func createURLRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = ApiConstants.apiHost
        components.path = "/v1/search"

        components.queryItems = [
            URLQueryItem(name: "type", value: "track"),
            URLQueryItem(name: "query", value: "Drake")
        ]

        guard let url = components.url else { return nil }

        var urlRequest = URLRequest(url: url)

        let token: String = UserDefaults.standard.value(forKey: "Authorization") as! String

        urlRequest.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        urlRequest.httpMethod = "GET"
        print(urlRequest)
        return urlRequest
    }
    func createURLRequestId() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = ApiConstants.apiHost
        components.path = "/v1/me"



        guard let url = components.url else { return nil }

        var urlRequest = URLRequest(url: url)

        let token: String = UserDefaults.standard.value(forKey: "Authorization") as! String

        urlRequest.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        urlRequest.httpMethod = "GET"
        print(urlRequest)
        return urlRequest
    }
    func search() async throws -> [String] {
        guard let urlRequest = createURLRequest() else { throw NetworkError.invalidURL }

        let (data, _) = try await URLSession.shared.data(for: urlRequest)

        let decoder = JSONDecoder()
        let results = try decoder.decode(Response.self, from: data)

        let items = results.tracks.items

        let songs = items.map({$0.name})
        return songs
    }
    func getId() async throws -> String {
        guard let urlRequest = createURLRequestId() else { throw NetworkError.invalidURL }

        let (data, _) = try await URLSession.shared.data(for: urlRequest)

        let decoder = JSONDecoder()
        let results = try decoder.decode(Resp.self, from: data)

        //print("Print data")
        //print(results)
        
        
        let items = results.id

     //   let songs = items
         return items
    }
    func createURLRequestPlaylist() async -> URLRequest? {
        guard let idNow = try? await getId() else { return nil}
        
        
        //print(idNow)
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = ApiConstants.apiHost
        components.path = "/v1/users/"+idNow+"/playlists"



        guard let url = components.url else { return nil }

        var urlRequest = URLRequest(url: url)

        let token: String = UserDefaults.standard.value(forKey: "Authorization") as! String

        urlRequest.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        urlRequest.httpMethod = "GET"
        print(urlRequest)
        print(token)
        return urlRequest
    }
    func createURLRequestSeach(newString: String) -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = ApiConstants.apiHost
        components.path = "/v1/search"

        components.queryItems = [
            URLQueryItem(name: "type", value: "track"),
            URLQueryItem(name: "query", value: newString)
        ]

        guard let url = components.url else { return nil }

        var urlRequest = URLRequest(url: url)

        let token: String = UserDefaults.standard.value(forKey: "Authorization") as! String

        urlRequest.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        urlRequest.httpMethod = "GET"
        print(urlRequest)
        return urlRequest
    }
    func search(newString: String) async throws -> [String] {
        guard let urlRequest = createURLRequestSeach(newString: newString) else { throw NetworkError.invalidURL }

        let (data, _) = try await URLSession.shared.data(for: urlRequest)

        let decoder = JSONDecoder()
        let results = try decoder.decode(Response.self, from: data)

        let items = results.tracks.items

        let songs = items.map({$0.name})
        return songs
    }  /*  func getPlaylist() async throws -> [String] {
        guard let urlRequest = await createURLRequestPlaylist() else { throw NetworkError.invalidURL }

        print(urlRequest)
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        print(data)
        print("__________")
       // playlists = data
        let decoder = JSONDecoder()
        let results = try decoder.decode(Playlists.self, from: data)
        let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        
       // print(dataDictionary["items"])
        playlistsS = dataDictionary["items"] as! [[String:Any]]
    //    let play = playlistsS["name"] as! String
        let item = results.items
        
        print(item)
       // let items = results as! NSDictionary
     //   let items = results.items as! [[String:AnyObject]]
     //   print(items)
      //  print(items)

        let songs = item.map({$0.name})
        
        print("hello")
        print("Return")
        print(songs)
        return songs
    }*/

}
/*struct Playlists: Codable {
    let items: [Items]
   // let name: String
}
struct Items: Codable {
    let id: String
    let images: [GetImage]
    let name: String
    let tracks: TracksUrl
}



struct TracksUrl : Codable {
    let href: String
}*/




struct Resp: Codable {
    let id: String
}
struct Response: Codable {
    let tracks: Track
   // let id: String
}

struct Track: Codable {
    let items: [Item]
}

struct Item: Codable {
    let name: String
}
