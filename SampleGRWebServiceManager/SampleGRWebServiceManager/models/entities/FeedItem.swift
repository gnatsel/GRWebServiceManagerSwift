//
//  FeedItem.swift
//  
//
//  Created by Olivier Lestang [DAN-PARIS] on 18/08/2015.
//
//

import Foundation
import CoreData

class FeedItem: NSManagedObject {

    @NSManaged var author: String?
    @NSManaged var authorId: String?
    @NSManaged var dateTaken: NSNumber?
    @NSManaged var detailedDescription: String?
    @NSManaged var isBookmarked: NSNumber?
    @NSManaged var isRead: NSNumber?
    @NSManaged var link: String?
    @NSManaged var media: String?
    @NSManaged var published: NSNumber?
    @NSManaged var tags: String?
    @NSManaged var title: String?

}
