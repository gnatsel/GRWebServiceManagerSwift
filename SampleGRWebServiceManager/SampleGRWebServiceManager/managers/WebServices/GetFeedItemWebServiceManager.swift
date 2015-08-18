//
//  GetFeedItemWebServiceManager.swift
//  SampleGRWebServiceManager
//
//  Created by Olivier Lestang [DAN-PARIS] on 18/08/2015.
//  Copyright (c) 2015 Gnatsel Reivilo. All rights reserved.
//

import UIKit

class GetFeedItemWebServiceManager: GRWebServiceManager {
    required init(){
        super.init()
        self.requestMethod = RequestMethod.GET;
        self.webServiceUrlString = "http://api.flickr.com/services/feeds/photos_public.gne?lang=en-us&format=json&nojsoncallback=1";
    }
    
    override func requestSucceededWithObject(responseObject:AnyObject?){
        
    }
    /*
    override func requestSucceededWithObject(responseObject:AnyObject?){
        
    }*/
}
