//
//  ViewController.swift
//  GRWebServiceManagerSample
//
//  Created by Olivier Lestang [DAN-PARIS] on 14/08/2015.
//  Copyright (c) 2015 Gnatsel Reivilo. All rights reserved.
//

import UIKit
import CoreData

@IBDesignable
class FeedTableViewController: UITableViewController, NSFetchedResultsControllerDelegate,GRWebServiceManagerDelegate {

    @IBInspectable var isBookMarkController:Bool = false
    private var feedItemFetchedResultsController:NSFetchedResultsController?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.refreshControl = UIRefreshControl();
        self.refreshControl?.tintColor = UIColor.blackColor();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.refreshControl?.beginRefreshing()
        self.updateFeedItemData()
    }
    
    func updateFeedItemData(){
        let getFeedItemWebServiceManager:GRWebServiceManager? = GetFeedItemWebServiceManager.sharedInstanceWithDelegate(self)

            if(!getFeedItemWebServiceManager!.isUpdating){
                getFeedItemWebServiceManager!.perform()
            }
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedItemFetchedResultsController!.fetchedObjects!.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(FEED_ITEM_TABLE_VIEW_CELL_IDENTIFIER, forIndexPath: indexPath) as! UITableViewCell
        cell.presenter!.configureWithEntity(entity: feedItemFetchedResultsController!.objectAtIndexPath(indexPath))
        
        return cell;
    }
    

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //selectedIndexPath = indexPath;
        //self.performSegueWithIdentifier(EDIT_USER_SEGUE, sender: self)
    }
    
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        self.tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        if(controller == feedItemFetchedResultsController){
            switch type{
            case NSFetchedResultsChangeType.Insert:
                var indexPaths:[NSIndexPath] = [newIndexPath!]
                tableView!.insertRowsAtIndexPaths( indexPaths, withRowAnimation: UITableViewRowAnimation.Automatic)
                break;
            case NSFetchedResultsChangeType.Delete:
                var indexPaths:[NSIndexPath] = [indexPath!]
                tableView!.deleteRowsAtIndexPaths( indexPaths, withRowAnimation: UITableViewRowAnimation.Automatic)
                break;
            case NSFetchedResultsChangeType.Update:
                if let cell:UITableViewCell = tableView!.cellForRowAtIndexPath(indexPath!){
                    cell.presenter!.configureWithEntity(entity: feedItemFetchedResultsController!.objectAtIndexPath(indexPath!))
                }
                break;
            case NSFetchedResultsChangeType.Move:
                var indexPaths:[NSIndexPath] = [indexPath!]
                tableView!.moveRowAtIndexPath(indexPath!, toIndexPath: newIndexPath!)
                break;
            default:
                break;
            }
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView!.endUpdates()
        if(self.view.window == nil){
            tableView!.reloadData()
        }
    }

    func webServiceManager(#webServiceManager: GRWebServiceManager, didFinishWithSuccess success: Bool) {
        
    }
    
    func webServiceManager(#webServiceManager: GRWebServiceManager, didReceiveResponse response: NSHTTPURLResponse?) {
        
    }
    
    
}

