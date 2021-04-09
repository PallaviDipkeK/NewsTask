//
//  NewListViewModel.swift
//  PallaviDipke_NewsTask
//
//  Created by Admin on 4/7/21.
//

import Foundation

class NewListViewModel: NSObject {
    var model : NewListModel? = nil
    func fetchnewsListData(completionHandler: @escaping (_ status:Bool, _ response: NewListModel?, _ errorTitle:String?) -> ()) {
        if NetworkChecker().isConnectedToNetwork() {
            ApiCallManager.shared.getNewListContent { (status,response,errorTitle)  in
                switch status {
                case 200:
                    if let responseData = response,!responseData.articles.isEmpty{
                        self.model = response
                    }
                    completionHandler(true, response, nil)
                default:
                    completionHandler(false, nil, errorTitle)

                }
            }
            
        }
    }
    
    func getLikes(articleID: String, completionHandler: @escaping (_ status:Bool, _ response: Int?, _ errorTitle:String?) -> ()) {
    if NetworkChecker().isConnectedToNetwork() {
        ApiCallManager.shared.getnumberOfLikes(articleID: articleID, completionHandler: { (status,response,errorTitle)  in
            switch status {
            case 200:
                completionHandler(true, 0, nil)
            default:
                completionHandler(false, nil, errorTitle)

            }
        })
        }
    
}
}
