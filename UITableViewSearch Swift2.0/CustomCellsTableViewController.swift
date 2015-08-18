//
//  CustomCellsTableViewController.swift
//  UITableViewSearch Swift2.0
//
//  Created by Adam Gask on 18/08/2015.
//  Copyright © 2015 AJ9. All rights reserved.
//

import UIKit

class CustomCellsTableViewController:UITableViewController, UISearchResultsUpdating {
    
    let tableData = [CustomObject(name:"One"), CustomObject(name:"Two"), CustomObject(name:"Three"), CustomObject(name:"Twenty-One")]
    var filteredTableData = [CustomObject]()
    var resultSearchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.registerNib(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")

        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            self.tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
        // Reload the table
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.resultSearchController.active) {
            return self.filteredTableData.count
        }
        else {
            return self.tableData.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomTableViewCell", forIndexPath: indexPath) as! CustomTableViewCell
        if (self.resultSearchController.active) {
            
            let customObject = filteredTableData[indexPath.row] as CustomObject
            cell.customLabel?.text = customObject.name
            
            return cell
        }
        else {
            let customObject = tableData[indexPath.row] as CustomObject
            cell.customLabel?.text = customObject.name
            
            return cell
        }
    }
    
    // MARK: TableView Search Methods
    
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        filteredTableData.removeAll(keepCapacity: false)
        
        let searchPredicate = NSPredicate(format: "name CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (tableData as NSArray).filteredArrayUsingPredicate(searchPredicate)
        filteredTableData = array as! [CustomObject]
        
        self.tableView.reloadData()
    }
}
