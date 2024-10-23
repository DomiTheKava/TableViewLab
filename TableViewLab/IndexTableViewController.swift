//
//  IndexTableViewController.swift
//  TableViewLab
//
//  Created by Dominik Penkava on 10/23/24.
//

// Assignments:
//      Displaying Index

import Foundation
import SwiftUI

class IndexTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    let petArray3: [[String]] = [["Mammal", "cat", "dog", "hamster", "gerbil", "rabbit"],
                                ["Bird", "parakeet", "parrot", "canary", "finch"],
                                ["Fish", "tropical fish", "goldfish", "sea horses"],
                                ["Reptile", "turtle", "snake", "lizard"]]
    
    let petIndex = ["Mammal", "Bird", "Fish", "Reptile"]
    
    let cellID = "cellID3"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionIndexColor = .white
        tableView.sectionIndexBackgroundColor = .black
        tableView.sectionIndexTrackingBackgroundColor = .darkGray
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petArray3[section].count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        cell?.textLabel?.text = petArray3[indexPath.section][indexPath.row + 1]
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = petArray3[indexPath.section][indexPath.row + 1]
        
        let alert = UIAlertController(title: "You chose:", message: "\(selectedItem)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: { _ in })
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return petArray3.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return petArray3[section][0]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return petIndex
    }
    
}
