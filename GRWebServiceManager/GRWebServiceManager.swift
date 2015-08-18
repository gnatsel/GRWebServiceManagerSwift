//
//  GRWebServiceManager.swift
//  GRWebServiceManagerSample
//
//  Created by Olivier Lestang [DAN-PARIS] on 14/08/2015.
//  Copyright (c) 2015 Gnatsel Reivilo. All rights reserved.
//

import UIKit
import Alamofire

typealias RequestMethod = Alamofire.Method;

/**
* Set of methods to be implemented by the delegate of GRWebServiceManager
*/
@objc protocol GRWebServiceManagerDelegate{
    
    /**
    * Method to implement in order to be warned when the GRWebServiceManager instance finished
    * all of its assigned tasks after a request is done
    *
    * @param webServiceManager     the GRWebServiceManager instance that finished its assigned tasks
    * @param success               indicates if the http request was successful or not
    */
    func webServiceManager(#webServiceManager:GRWebServiceManager, didFinishWithSuccess success:Bool)
    
    /**
    * Optional method to implement in order to be warned when the request is done
    * @param webServiceManager     the GRWebServiceManager instance that finished the AFHTTPRequestOperation
    * @param request               the NSURLRequest that was performed
    */
    optional func webServiceManager(#webServiceManager:GRWebServiceManager, didReceiveResponse response:NSHTTPURLResponse?);
}

/**
* dictionary containing all singleton instances of GRWebServiceManager
*/
var GRWebServiceManagerInstancesDictionary = [String: GRWebServiceManager]()

class GRWebServiceManager: NSObject {
    /**
    * The parameters that will be sent with the http request (no multipart)
    */
    var parameters:[String:AnyObject]?;
    
    /**
    * The multipart parameters that will be sent with the http request
    */
    var multipartArray:[AnyObject]?;
    
    /**
    * The webservice URL
    */
    var webServiceUrlString:String?;
    
    /**
    * The message corresponding to the last http request performed
    * @note    I usually use it to show what happened in case of error
    */
    var message:String?;
    
    /**
    * The AFHTTPRequestOperationManager used to perform http requests
    */
    //@property (strong, nonatomic) AFHTTPRequestOperationManager *requestOperationManager;
    var response:NSHTTPURLResponse?;
    
    /**
    *  The delegate of the current instance of GRWebServiceManager
    */
    weak var delegate:GRWebServiceManagerDelegate?;
    
    /**
    * The response of the last http request (usually a JSON response mapped to an NSArray or NSDictionary)
    */
    var responseObject:AnyObject?;
    
    /**
    * The error code of the last http request
    */
    var errorCode:Int?;
    
    /**
    * The http action that will be performed by each http request
    */
    var requestMethod:RequestMethod = RequestMethod.GET;
    
    /**
    * Boolean indicating if the current instance of GRWebServiceManager is already performing a request
    */
    var isUpdating:Bool = false;
    
    /**
    * Boolean indicating if the last http request was successful
    */
    var success:Bool = false;
    
    /**
    * Boolean indicating if the http request is multipart
    */
    var isMultipart:Bool = false;
    
    required override init(){
        
    }
    

    /**
    * @return  a singleton of GRWebServiceManager
    */
    class func sharedInstance() ->GRWebServiceManager{
        let classname = NSStringFromClass(self)
        if((GRWebServiceManagerInstancesDictionary[classname]) != nil) {
            return (GRWebServiceManagerInstancesDictionary[classname])!
        }
        else {
            var singletonObject = self()
            GRWebServiceManagerInstancesDictionary[classname] = singletonObject
            return singletonObject
        }
    }
    
    
    /**
    * @return  a singleton of GRWebServiceManager
    */
    static func sharedInstanceWithDelegate(delegate:GRWebServiceManagerDelegate) ->GRWebServiceManager{
        let webServiceManager:GRWebServiceManager = GRWebServiceManager.sharedInstance()
        webServiceManager.delegate = delegate
        
        return webServiceManager
    }
    
    
    /**
    * Method called when an http request was successful
    * @note    should be overriden by its children
    */
    func requestSucceededWithObject(responseObject:AnyObject?){
        isUpdating = false;
        success = true;
        self.responseObject = responseObject;
    }
    
    
    /**
    * Method called when an http request failed
    * @note    should be overriden by its subclasses
    */
    func request(#request:NSURLRequest?, failedWithError error:NSError?){
        isUpdating = false;
        success = false;
        message = "\(error?.userInfo)";
    }
    
    
    /**
    * Perform an http request with the current parameters, multipartArray, urlString and request method
    */
    func perform(){
        isUpdating = true;
        
        if(!isMultipart){
            Alamofire.request(requestMethod, webServiceUrlString! , parameters: parameters)
                .responseJSON { (request, response, JSON, error) in
                    if(self.delegate != nil){
                        self.delegate?.webServiceManager?(webServiceManager: self, didReceiveResponse: response)
                    }
                    error != nil ? self.requestSucceededWithObject(JSON) : self.request(request:request, failedWithError:error)
                    
                    
            }
        }
        
        else {
            //TODO : Handle Multipart
        }
    }
    
    
    
}
