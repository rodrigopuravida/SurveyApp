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
        
        // Do any additional setup after loading the view, typically from a nib.
//        if let path = NSBundle.mainBundle().pathForResource("data", ofType: "plist"){
//            if let arrayOfDictionaries = NSArray(contentsOfFile: path){
//                for dict in arrayOfDictionaries {
//                    tableData.append(dict.objectForKey("title") as! String)
//                }
//            }
//        }
//        print(tableData);
//        SurveyTable.reloadData()
        
        
        
        //here is the network call
        DataManager.getDataFromMockySiteWithSuccess { (mockydata) -> Void in
            let json = JSON(data: mockydata)
//            //        print(json)
//            if let appName = json["title"][0].string {
//                print("NSURLSession: \(appName)")
//            }
//            // More soon...
//            //1
            if let appArray = json.array {
                //2
                var apps = [AppModel]()
                
                //3
                for appDict in appArray {
                    let appTitle: String? = appDict["title"].string
//
//                    let app = AppModel(title: appTitle)
//                    apps.append(app)
                    self.tableData.append(appTitle!)
                    
                    
                }
                
                //4
                print("I am here")
                //print(self.tableData)
                
            }
            self.SurveyTable.reloadData()
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
            
           
                
            var cell:UITableViewCell = SurveyTable.dequeueReusableCellWithIdentifier("cell")as UITableViewCell!
//
//            cell.textLabel!.text = tableData[indexPath.row] as? String
            
            cell.textLabel!.text = "Test"
            
            
            
            return cell
           
            
    }
    
    
    
}


