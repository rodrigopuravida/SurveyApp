//
//  AppModel.swift
//  Topcoder-FunSeries-SurveyApp
//
//  Created by Rodrigo Carballo on 10/11/15.
//  Copyright © 2015 topcoder. All rights reserved.
//

import Foundation

class AppModel: NSObject {
    let title: String
    
    override var description: String {
        return "Title: \(title)\n"
    }
    
    init(title: String?) {
        self.title = title ?? ""
    }
}
