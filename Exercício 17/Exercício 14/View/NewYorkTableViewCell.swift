//
//  NewYorkTableViewCell.swift
//  Exercício 14
//
//  Created by Henrique Marques on 09/04/22.
//

import UIKit

class NewYorkTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var by: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageNews.layer.cornerRadius = 20
        imageNews.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func prepare(with news: NewsData) {
        title.text = news.title
        by.text = news.byline
        
        guard let url = URL(string: news.image) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.imageNews.image = UIImage(data: data)
            }
            
        }.resume()
    }
}
