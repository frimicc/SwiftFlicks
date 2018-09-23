//
//  DetailViewController.swift
//  SwiftFlicks
//
//  Created by Michael on 9/23/18.
//  Copyright © 2018 Michael Friedman. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class DetailViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = titleLabel {
                label.text = detail.title
                self.title = detail.title
            }
            if let descriptionTV = descriptionTextView {
                descriptionTV.text = detail.description
            }
            if let bgImageView = backgroundImageView {
                if let bgURL = detail.backgroundURL {
                    bgImageView.af_setImage(withURL: bgURL)
                } else {
                    bgImageView.image = Image(named: "NoPosterImage")
                }
            }
            if let card = cardView {
                card.sizeToFit()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    var detailItem: MovieModel? {
        didSet {
            configureView()
        }
    }


}

