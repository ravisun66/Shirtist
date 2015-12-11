//
//  ViewController.swift
//  Shirtist
//
//  Created by Ravi Shankar Jha on 06/12/15.
//  Copyright © 2015 Ravi Shankar Jha. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {

    @IBOutlet weak var ProductsTableView: UITableView!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var filteredTableData = [String: [String]]()
    var resultSearchController = UISearchController()
    var productIdentifier = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        ProductsTableView.dataSource = self
        ProductsTableView.delegate = self
        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            self.ProductsTableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
        // Reload the table
        self.ProductsTableView.reloadData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        if (self.resultSearchController.active) {
            
            return self.filteredTableData.count
        }
        else {
            return appDelegate.products.count
        }
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let tableCell: HomePageTableCell = ProductsTableView.dequeueReusableCellWithIdentifier("productCell", forIndexPath: indexPath) as! HomePageTableCell
        
        
        if (self.resultSearchController.active) {
        
            
            tableCell.productName.text = Array(filteredTableData.keys)[indexPath.row]
            
            tableCell.mainImage.image = UIImage(named:Array(filteredTableData.values)[indexPath.row][0])
            return tableCell
        
        }
        else {
        
        tableCell.productName.text = Array(appDelegate.products.keys)[indexPath.row]
        
        tableCell.mainImage.image = UIImage(named:Array(appDelegate.products.values)[indexPath.row][0])
        return tableCell
        }
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        print("Hello")
//        productIdentifier = indexPath.row
//        performSegueWithIdentifier("ProductViewDetail", sender: self)
//        print(productIdentifier)
//        
//    }
//    
    
   
    
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        filteredTableData.removeAll(keepCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        
        let data: NSDictionary = appDelegate.products
        let keys: NSArray = data.allKeys
        let filteredKeys: [String] = keys.filteredArrayUsingPredicate(searchPredicate) as! [String]
        filteredTableData = data.dictionaryWithValuesForKeys(filteredKeys) as! [String: [String]]
        
        
        //let dictionary = (appDelegate.products as NSDictionary).filter(<#T##includeElement: ((key: AnyObject, value: AnyObject)) throws -> Bool##((key: AnyObject, value: AnyObject)) throws -> Bool#>)
        
        //let dictionary = (appDelegate.products as NSDictionary).filteredDictionaryUsingPredicate(searchPredicate)
       // filteredTableData = dictionary as! [String]
        
        self.ProductsTableView.reloadData()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if (segue.identifier == "ProductViewDetail") {
        productIdentifier = (ProductsTableView.indexPathForSelectedRow?.row)!
            let svc = segue.destinationViewController as! ProductDetailViewController;
            svc.productNameText = Array(appDelegate.products.keys)[productIdentifier]
            svc.productImages = appDelegate.products[Array(appDelegate.products.keys)[productIdentifier]]!
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

