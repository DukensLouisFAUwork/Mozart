//
//  ApiConstants.swift
//  Mozart
//
//  Created by dukens on 11/29/22.
//

import Foundation

enum ApiConstants {
    static let apiHost = "api.spotify.com"
    static let authHost = "accounts.spotify.com"
    static let clientId = "bfb98e96a5c44d608a89add161878728"
    static let clientSecret = "2f953d632c72400d848c78158d1c998d"
    static let redirectUri = "https://www.google.com/"
    static let responseType = "token"
  //  static let responseType = 'code'
    static let scopes = "user-read-private,user-read-email,playlist-read-private"

    static var authParams = [
        "response_type": responseType,
        "client_id": clientId,
        "redirect_uri": redirectUri,
        "scope": scopes,
        "show_dialog": "TRUE",
    ]
}
