//
//  MovieCell.swift
//  SwiftFlicks
//
//  Created by Michael on 9/23/18.
//  Copyright © 2018 Michael Friedman. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MovieCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var model: MovieModel? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        if let movie = model {
            titleLabel.text = movie.title
            if let moviePoster = movie.posterURL {
                posterImageView.af_setImage(withURL: moviePoster) // downloads in background
            } else {
                posterImageView.image = Image(named: "NoPosterImage")
            }
            posterImageView.sizeToFit()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
