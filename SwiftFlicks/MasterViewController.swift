//
//  MasterViewController.swift
//  SwiftFlicks
//
//  Created by Michael on 9/23/18.
//  Copyright © 2018 Michael Friedman. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    var detailViewController: DetailViewController? = nil
    var objects = [MovieModel]()


    override func viewDidLoad() {
        super.viewDidLoad()
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        movieSearchBar.delegate = self
        
        NetworkManager.shared.moviesNowPlaying(completion: { (movies) in
            self.objects = movies
            self.tableView.reloadData()
        })
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieCell

        let object = objects[indexPath.row]
        cell.model = object
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
}

extension MasterViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NetworkManager.shared.moviesSearched(matching: searchText, completion: { (movies) in
            self.objects = movies
            self.tableView.reloadData()
        })
    }
}
