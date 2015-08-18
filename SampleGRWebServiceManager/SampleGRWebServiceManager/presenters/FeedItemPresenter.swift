//
//  FeedItemPresenter.swift
//  SampleGRWebServiceManager
//
//  Created by Olivier Lestang [DAN-PARIS] on 18/08/2015.
//  Copyright (c) 2015 Gnatsel Reivilo. All rights reserved.
//

import UIKit


enum FeedItemPresenterStyle:Int{
    case Default = 0
    case Detail = 1
}

@IBDesignable
class FeedItemPresenter: GRPresenter {
    @IBInspectable var presenterStyle:Int = 0
    @IBOutlet weak var mediaImageView:UIImageView?;
    @IBOutlet weak var titleFeedLabel:UILabel?;
    @IBOutlet weak var publicationInfoLabel:UILabel?;
    @IBOutlet weak var detailedDescriptionWebView:UIWebView?;
    @IBOutlet weak var linkWebView:UIWebView?;
    @IBOutlet weak var bookmarkBarButtonItem:UIBarButtonItem?;

    override func configureWithEntity(#entity: AnyObject) {
        super.configureWithEntity(entity:entity);
        if(entity.isKindOfClass(FeedItem)){
            configureWithFeedItem(feedItem: entity as! FeedItem)
        }
    }
    func configureWithFeedItem(#feedItem:FeedItem){
    }

    func configureBookmarkBarButtonItemWithFeedItem(#feedItem:FeedItem){
        
    }
    
    
    
    
    
    
   /* -(void)configureWithObject:(id)anObject{
    [super configureWithObject:anObject];
    [self configureWithFeedItem:anObject];
    }
    
    -(void)configureWithFeedItem:(FeedItem *)feedItem{
    [self configureMediaWithFeedItem:feedItem];
    [self configureTitleFeedLabelWithFeedItem:feedItem];
    [self configurePublicationInfoLabelWithFeedItem:feedItem];
    [self configureLinkWebViewWithFeedItem:feedItem];
    [self configureDetailedDescriptionWebViewWithFeedItem:feedItem];
    [self configureBookmarkBarButtonItemWithFeedItem:feedItem];
    
    }
    
    -(void)configureMediaWithFeedItem:(FeedItem *)feedItem{
    if(_mediaImageView){
    [_mediaImageView sd_setImageWithURL:[NSURL URLWithString:feedItem.media]];
    }
    }
    -(void)configureTitleFeedLabelWithFeedItem:(FeedItem *)feedItem{
    if(_titleFeedLabel){
    _titleFeedLabel.text = feedItem.title;
    if(_presenterStyle == FeedItemPresenterStyleDefault)
    _titleFeedLabel.textColor = [feedItem.isRead boolValue]?[UIColor lightGrayColor] : [UIColor blackColor];
    }
    }
    
    -(void)configurePublicationInfoLabelWithFeedItem:(FeedItem *)feedItem{
    if(_publicationInfoLabel){
    //published at %@ by %@, taken at %@
    _publicationInfoLabel.text = [NSString stringWithFormat:@"published at %@\nby %@\ntaken at %@",
    [self dateStringFromDateNumber:feedItem.published],
    feedItem.author,
    [self dateStringFromDateNumber:feedItem.dateTaken]];
    if(_presenterStyle == FeedItemPresenterStyleDefault)
    _publicationInfoLabel.textColor = [feedItem.isRead boolValue]?[UIColor lightGrayColor] : [UIColor blackColor];
    
    }
    }
    -(void)configureDetailedDescriptionWebViewWithFeedItem:(FeedItem *)feedItem{
    if(_detailedDescriptionWebView){
    
    NSMutableString *htmlString = [NSMutableString stringWithFormat:@"<html><head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1 maximum-scale=1\"><style>body{margin:0;padding:0;}</style></head><body>"];
    [htmlString appendString:feedItem.detailedDescription];
    [htmlString appendString:@"</body></html>"];
    [_detailedDescriptionWebView loadHTMLString:htmlString baseURL:nil];
    }
    }
    -(void)configureLinkWebViewWithFeedItem:(FeedItem *)feedItem{
    if(_linkWebView){
    [_linkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:feedItem.link]]];
    }
    
    }
    
    
    -(void)configureBookmarkBarButtonItemWithFeedItem:(FeedItem *)feedItem{
    if(_bookmarkBarButtonItem){
    _bookmarkBarButtonItem.tintColor = [feedItem.isBookmarked boolValue]?  [UIColor colorWithHex:@"0E7AFE"]: [UIColor lightGrayColor];
    }
    
    }
    
    
    -(NSString *)dateStringFromDateNumber:(NSNumber *)dateNumber{
    NSTimeInterval dateTimeInterval = [dateNumber doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:dateTimeInterval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"hh:mm:ss, MMMM dd YYYY";
    return [dateFormatter stringFromDate:date];
    }
*/
}