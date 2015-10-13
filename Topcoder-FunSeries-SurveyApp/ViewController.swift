//
//  ViewController.swift
//  Topcoder-FunSeries-SurveyApp
//
//  Created by Harshit on 24/09/15.
//  Copyright (c) 2015 topcoder. All rights reserved.
//

import UIKit



class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    var dataArray:NSMutableArray!
    var plistPath:String!
    var tableData=[String]()
    
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
                print (tableData.count)
                return tableData.count
    }
    
    func tableView(SurveyTable: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            
            
            let cell:UITableViewCell = SurveyTable.dequeueReusableCellWithIdentifier("cell")as UITableViewCell!
            cell.textLabel!.text = tableData[indexPath.row]
            
            
            return cell
           
            
    }
    
    
    
}


