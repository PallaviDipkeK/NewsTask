//
//  ApiCallManager.swift
//  PallaviDipke_NewsTask
//
//  Created by Admin on 4/7/21.
//

import Foundation

class ApiCallManager {
    
    static let shared = ApiCallManager()
    
    func getNewListContent(completionHandler: @escaping (_ status:Int, _ response: NewListModel?, _ errorTitle:String?) -> ()) {
        guard let link = URL(string: Constant.APIString.newsListApi) else {return}
        URLSession.shared.dataTask(with: link) { (data, response, error) in
            if let statusCode = (response as? HTTPURLResponse)?.statusCode,
                let httpStatusCode = HTTPStatusCodes(rawValue: statusCode) {
                switch httpStatusCode {
                case HTTPStatusCodes.success:
                    if let d = data, let obj = try? JSONDecoder().decode(NewListModel.self, from: d) {
                        if !obj.articles.isEmpty {
                            completionHandler(HTTPStatusCodes.success.rawValue,obj, nil)
                        }
                    }
                case HTTPStatusCodes.tooManyRequests:
                    completionHandler(HTTPStatusCodes.tooManyRequests.rawValue, nil, "Too many requests")
                case HTTPStatusCodes.notFound:
                    completionHandler(HTTPStatusCodes.notFound.rawValue, nil, "Not Found")
                case HTTPStatusCodes.unAvailable:
                    completionHandler(HTTPStatusCodes.unAvailable.rawValue, nil, "Un Available")
                }
            }
        }.resume()
    }
   
    
    func getnumberOfLikes(articleID: String,completionHandler: @escaping (_ status:Int, _ response: Int?, _ errorTitle:String?) -> ()) {
        guard let link = URL(string: Constant.APIString.likesApi.appending(articleID)) else {return}
        URLSession.shared.dataTask(with: link) { (data, response, error) in
            if let statusCode = (response as? HTTPURLResponse)?.statusCode,
                let httpStatusCode = HTTPStatusCodes(rawValue: statusCode) {
                switch httpStatusCode {
                case HTTPStatusCodes.success:
                    if let d = data, let obj = try? JSONDecoder().decode(Comments.self, from: d) {
                        print(obj.comments)
                            completionHandler(HTTPStatusCodes.success.rawValue,0, nil)
                    }
                case .notFound:
                    completionHandler(HTTPStatusCodes.success.rawValue,0, nil)
                case .tooManyRequests:
                    completionHandler(HTTPStatusCodes.success.rawValue,0, nil)

                case .unAvailable:
                    completionHandler(HTTPStatusCodes.success.rawValue,0, nil)

        }
            }
            }.resume()
    }
}
