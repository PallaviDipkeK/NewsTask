//
//  Constants.swift
//  PallaviDipke_NewsTask
//
//  Created by Admin on 4/7/21.
//

import UIKit

struct Constant {
    struct APIString {
        static let apiKey = "f2ecb7e0ed684526839f53340b7f266a"
        static let newsListApi = "https://newsapi.org/v2/everything?q=Apple&from=2021-04-07&sortBy=popularity&apiKey=\(apiKey)"
        
        static var likesApi = "https://cn-news-info-api.herokuapp.com/likes/"
        static var commentApi = "https://cn-news-info-api.herokuapp.com/comments/"

    }
}
//https://cn-news-info-api.herokuapp.com/likes/<ARTICLEID>
//https://cn-news-info-api.herokuapp.com/comments/<ARTICLEID>
struct StoryboardConstant {
    static let main = "Main"
    static let launch = "LaunchScreen"
}

struct StoryBoard {
    static let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
}

struct SegueIdentifier {
    static let NewsListViewController = "NewsListViewController"
    static let NewsDetailsViewController = "NewsDetailsViewController"
    
}

enum InternetAvailability: String {
    case title = "Internet"
    case message = "Internet not Avaiable"
}
