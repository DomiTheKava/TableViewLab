//
//  ViewController.swift
//  TableViewLab
//
//  Created by Dominik Penkava on 10/22/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
// assignments:
//    TableViewVisualApp
//    TableViewAPP
//    Modify the TableviewApp to display an Alert of the selected row.
// TODO: Displaying Table View Controller Assignment - need new tab

    
    let petArray = ["cat", "dog", "parakeet", "parrot", "canary", "finch", "tropical fish", "goldfish","sea horses" , "hamster", "gerbil", "rabbit", "turtle", "snake", "lizard", "hermit crab"]
    
    let cellID = "cellID"
    
    @IBOutlet weak var petTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        petTable.dataSource = self
//        petTable.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
//        if cell == nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
//        }
        
        cell?.textLabel?.text = petArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = petArray[indexPath.row]
        let alert = UIAlertController(title: "you clicked:", message: "\(selectedItem)!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: { action in
            alert.dismiss(animated: true)
        })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
}

