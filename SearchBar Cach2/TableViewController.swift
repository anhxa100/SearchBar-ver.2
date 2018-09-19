//
//  TableViewController.swift
//  SearchBar Cach2
//
//  Created by anhxa100 on 9/6/18.
//  Copyright © 2018 anhxa100. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchResultsUpdating {
    
    
    var unFilteredData:[String] = []
    var filteredData:[String] = []
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        unFilteredData = [ "1", "A" ,"a",  "Ravens", "Browns", "Steelers", "Bears", "Lions", "Packers", "Vikings",
                           "Texans", "Colts", "Jaguars", "Titans", "Falcons", "Panthers", "Saints", "Buccaneers",
                           "Bills", "Dolphins", "Patriots", "Jets", "Cowboys", "Giants", "Eagles", "Redskins",
                           "Broncos", "Chiefs", "Raiders", "Chargers", "Cardinals", "Rams", "49ers", "Seahawks"]
        
        filteredData = unFilteredData
    
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.hidesNavigationBarDuringPresentation = false
        navigationItem.hidesSearchBarWhenScrolling = false
        
        searchController.dimsBackgroundDuringPresentation = false
        
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Search Name"
        navigationItem.searchController = searchController
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
//        guard let data = filteredData else {
//            return 0
//        }
//        return data.count
        return filteredData.count

    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        
//        if let data = filteredData[indexPath.row] {
//        cell.textLabel?.text = data
//        }
            cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
    
    //MARK: search func
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredData = unFilteredData.filter { item in
                return item.lowercased().contains(searchText.lowercased())
            }
        }
        else{
            filteredData = unFilteredData
        }
        tableView.reloadData()
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // Delete the row from the data source
            if let index = unFilteredData.index(of: filteredData[indexPath.row]) {
                unFilteredData.remove(at: index)
                filteredData.remove(at: indexPath.row)
            }
            print("Deleted data")
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
/*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch (segue.identifier ?? "AddItem") {
        case "AddItem":
            print("Add an item")
        case "ShowDetail":
            guard let dataVC = segue.destination as? TableViewController else {return}
            print("A")
            
            guard let selectedCell = sender as? DetailViewController else {return}
            print("B")
            
            guard let indexPath = tableView.indexPath(for: selectedCell) else {return}
            
        default:
            fatalError("Khong co gi de chon")
        }
    }
    
    
    
    @IBAction func unwind(sender: UIStoryboardSegue) {
        if let sourceVC = sender.source as? DetailViewController {
            
        }
        
        
    }
*/
    
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
