//
//  MovieCell.swift
//  SwiftFlicks
//
//  Created by Michael on 9/23/18.
//  Copyright © 2018 Michael Friedman. All rights reserved.
//

import UIKit

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
