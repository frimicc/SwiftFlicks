//
//  DetailViewController.swift
//  SwiftFlicks
//
//  Created by Michael on 9/23/18.
//  Copyright © 2018 Michael Friedman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    var detailItem: MovieModel? {
        didSet {
            configureView()
        }
    }


}

