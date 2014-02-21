//
//  HSMapViewController.h
//  Test
//
//  Created by Hermoso Cariaga on 2/21/14.
//  Copyright (c) 2014 iGen Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@protocol HSAnnotation <MKAnnotation>
@optional
@property (nonatomic, readonly) MKPinAnnotationColor pinColor;
@property(nonatomic, strong, readonly) NSString *photoThumbnail;
@end

@interface HSPointAnnotation : MKPointAnnotation
@property(nonatomic, assign) MKPinAnnotationColor pinColor;
@property(nonatomic, strong) NSString *photoThumbnail;
@end

@interface HSMapViewController : UIViewController <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mkMapView;


- (void)showLocationOnMapWithData:(NSDictionary*)data;
@end
