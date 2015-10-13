//
//  DataManager.swift
//  Topcoder-FunSeries-SurveyApp
//
//  Created by Rodrigo Carballo on 10/11/15.
//  Copyright © 2015 topcoder. All rights reserved.
//

import Foundation

let TopAppURL = "http://www.mocky.io/v2/560920cc9665b96e1e69bb46"

class DataManager {
    
    class func getDataFromMockySiteWithSuccess(success: ((mockydata: NSData!) -> Void)) {
        //1
        loadDataFromURL(NSURL(string: TopAppURL)!, completion:{(data, error) -> Void in
            //2
            if let urlData = data {
                //            print(data)
                //3
                success(mockydata: urlData)
            }
        })
    }
    
    
    class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        let session = NSURLSession.sharedSession()
        
        // Use NSURLSession to get data from an NSURL
        let loadDataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if let responseError = error {
                completion(data: nil, error: responseError)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                print(httpResponse.statusCode)
                if httpResponse.statusCode != 200 {
                    let statusError = NSError(domain:"com.rodrigocarballo", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(data: nil, error: statusError)
                } else {
                    
                    completion(data: data, error: nil)
                }
            }
        })
        
        loadDataTask.resume()
    }
}
