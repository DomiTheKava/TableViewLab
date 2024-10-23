//
//  GroupedTableViewController.swift
//  TableViewLab
//
//  Created by Dominik Penkava on 10/22/24.
//

// assignments:
//      GroupedTableViewApp

import Foundation
import SwiftUI

class GroupedTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView2: UITableView!
    
    let petArray2: [[String]] = [["Mammal", "cat", "dog", "hamster", "gerbil", "rabbit"],
                                ["Bird", "parakeet", "parrot", "canary", "finch"],
                                ["Fish", "tropical fish", "goldfish", "sea horses"],
                                ["Reptile", "turtle", "snake", "lizard"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView2.delegate = self
        tableView2.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = petArray2[indexPath.section][indexPath.row + 1]
        let alert = UIAlertController(title: "You selected:", message: "\(selectedItem)", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok:", style: .default, handler: { _ in
            alert.dismiss(animated: true)
        })
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return petArray2[section][0]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return petArray2.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petArray2[section].count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView2.dequeueReusableCell(withIdentifier: "cellID2") ?? UITableViewCell(style: .default, reuseIdentifier: "cellID2")

        cell.textLabel?.text = petArray2[indexPath.section][indexPath.row + 1]
    
        return cell
    }
    
}
