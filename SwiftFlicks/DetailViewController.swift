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

    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = titleLabel {
                label.text = detail.title
            }
            if let label = detailDescriptionLabel {
                label.text = detail.description
            }
            if let bgImageView = backgroundImageView {
                if let bgURL = detail.backgroundURL {
                    bgImageView.af_setImage(withURL: bgURL)
                } else {
                    bgImageView.image = Image(named: "NoPosterImage")
                }
            }
            if let card = cardView {
                detailDescriptionLabel.sizeToFit()
                card.sizeToFit()
                scroller.sizeToFit()
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

