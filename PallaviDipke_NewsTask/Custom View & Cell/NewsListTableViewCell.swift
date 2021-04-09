//
//  NewsListTableViewCell.swift
//  PallaviDipke_NewsTask
//
//  Created by Admin on 4/7/21.
//

import UIKit

class NewsListTableViewCell: UITableViewCell {
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDescrLabel: UILabel!
    @IBOutlet weak var newsDateLabel: UILabel!
    @IBOutlet weak var newsAuthorLabel: UILabel!
    @IBOutlet weak var newsThumbnailImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setnewDataData(data:Article){
        newsTitleLabel.text = data.title
        newsDescrLabel.text = data.description
        newsDateLabel.text = data.publishedAt
        newsAuthorLabel.text = data.author
        let data = try? Data(contentsOf: URL(string: data.urlToImage)!)
        newsThumbnailImg.image = UIImage(data: data!)
    }
    
}

