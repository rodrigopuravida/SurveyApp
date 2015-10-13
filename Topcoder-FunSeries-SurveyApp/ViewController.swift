//
//  ViewController.swift
//  Topcoder-FunSeries-SurveyApp
//
//  Created by Harshit on 24/09/15.
//  Copyright (c) 2015 topcoder. All rights reserved.
//

import UIKit



class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate, UISearchDisplayDelegate, UISearchBarDelegate {
    
    
    var dataArray:NSMutableArray!
    var plistPath:String!
    var tableData=[String]()
    var filteredList = [String]()
    
    @IBOutlet var Label: UILabel!
    @IBOutlet var SurveyTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        SurveyTable.delegate=self;
        SurveyTable.dataSource=self;
        
        
        //here is the network call
        DataManager.getDataFromMockySiteWithSuccess { (mockydata) -> Void in
            let json = JSON(data: mockydata)
            if let appArray = json.array {
                
                var apps = [AppModel]()
        
                for appDict in appArray {
                    let appTitle: String? = appDict["title"].string

                    self.tableData.append(appTitle!)
                    
                }
                
            }
            dispatch_async(dispatch_get_main_queue()) {
            self.SurveyTable.reloadData()
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(SurveyTable: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(SurveyTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
        if SurveyTable == self.searchDisplayController!.searchResultsTableView {
            return self.filteredList.count
        } else {
            return tableData.count
        }
        
    }
    
    func tableView(SurveyTable: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            
            
            let cell:UITableViewCell = SurveyTable.dequeueReusableCellWithIdentifier("cell")as UITableViewCell!
            
            var titleName : String!
            if SurveyTable == self.searchDisplayController!.searchResultsTableView {
                titleName = self.filteredList[indexPath.row]
            } else {
                titleName = tableData[indexPath.row]
            }
            
            
            
            cell.textLabel!.text = titleName
            
            
            return cell
           
    }
    
    func filterTableViewForEnterText(searchText: String)
    {
        self.filteredList = self.tableData.filter({( strTitle : String) -> Bool in
            let stringForSearch = strTitle.rangeOfString(searchText)
            return (stringForSearch != nil)
        })
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String?) -> Bool {
        self.filterTableViewForEnterText(searchString!)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController,
        shouldReloadTableForSearchScope searchOption: Int) -> Bool {
            self.filterTableViewForEnterText(self.searchDisplayController!.searchBar.text!)
            return true
    }

    
    
    
}


