//
//  NewsDetailsViewController.swift
//  PallaviDipke_NewsTask
//
//  Created by Admin on 4/8/21.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    @IBOutlet weak var newsTableView: UITableView!
    var newsDetails: Article? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backItem?.backBarButtonItem?.tintColor = .white
    }
    
}

extension NewsDetailsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsDetailsTableViewCell") as? NewsDetailsTableViewCell else {
            return UITableViewCell()
        }
        cell.detailsOfNewsTitle.text = newsDetails?.title
        cell.detailsOfdetails.text = newsDetails?.description
        cell.detailsOfNewsDate.text = newsDetails?.publishedAt
        cell.detailsOfNewsSource.text = newsDetails?.source.name
        cell.detailsOfNewsimageView.setWebImage(newsDetails!.urlToImage)
        return cell
    }

   
}
