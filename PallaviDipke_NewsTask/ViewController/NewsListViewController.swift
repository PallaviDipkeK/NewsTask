//
//  NewsListViewController.swift
//  PallaviDipke_NewsTask
//
//  Created by Admin on 4/7/21.
//

import UIKit
import SDWebImage
class NewsListViewController: UIViewController {
    var viewModel : NewListViewModel? = NewListViewModel()
    @IBOutlet weak var newsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       getAllNew()
    }
    
    func getAllNew(){
        viewModel?.fetchnewsListData(completionHandler: { (status, data, error) in
            if status{
                DispatchQueue.main.async {
                    self.newsTableView.reloadData()
                }
            }else{
                debugPrint("error\(error)")
            }
        })
    }

}

extension NewsListViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let numberOfRows = viewModel?.model?.articles.count{
        if section == 0{
            return 1
        }
            return numberOfRows > 1 ? numberOfRows - 1 : numberOfRows
        }
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 140 : UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let artcile = "www.engadget.com-apple-ipad-macbook-assembly-delayed-global-chip-shortage-115005064.html"
        viewModel?.getLikes(articleID: artcile, completionHandler: { (status, int, error) in
            print(status)
        })
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopNewsTableViewCell") as? TopNewsTableViewCell else{ return UITableViewCell() }
            if let news = viewModel?.model?.articles[0]{
                cell.topnewsTitleLabel.text = news.title
                cell.topnewsThumbnailImg.setWebImage(news.urlToImage)
            }
            return cell
        }
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListTableViewCell") as? NewsListTableViewCell{
                if let news = viewModel?.model?.articles[indexPath.row + 1]{
                    cell.newsTitleLabel.text = news.title
                    cell.newsDescrLabel.text = news.content
                    cell.newsDateLabel.text = news.publishedAt
                    cell.newsAuthorLabel.text = news.source.name
                    cell.newsThumbnailImg.setWebImage(news.urlToImage)
                }
                return cell
            }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = self.storyboard?.instantiateViewController(identifier: "NewsDetailsViewController") as? NewsDetailsViewController, let news = indexPath.section == 0 ? viewModel?.model?.articles[indexPath.row] : viewModel?.model?.articles[indexPath.row + 1]  else { return }
        detailVC.newsDetails = news
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}


