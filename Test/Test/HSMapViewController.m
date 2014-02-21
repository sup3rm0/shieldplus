//
//  HSMapViewController.m
//  Test
//
//  Created by Hermoso Cariaga on 2/21/14.
//  Copyright (c) 2014 iGen Technologies. All rights reserved.
//

#import "HSMapViewController.h"
#import "HSLogger.h"



@implementation HSPointAnnotation

@end

@interface HSMapViewController ()

@end

@implementation HSMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.mkMapView setDelegate:self];
    NSDictionary *data = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"14.558713", @"Latitude",
                          @"121.038912", @"Longitude",
                          @"Login Successful", @"Title",
                          @"Feb 21, 2014 19:00:13", @"Subtitle",
                          @"NO", @"Successful",
                          @"imgMap.png", @"Thumbnail",
                          nil];
    [self showLocationOnMapWithData:data];
}

- (void)showLocationOnMapWithData:(NSDictionary*)data
{
    // Add an annotation
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = [[data objectForKey:@"Latitude"] floatValue];
    coordinate.longitude = [[data objectForKey:@"Longitude"] floatValue];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 800, 800);
    [self.mkMapView setRegion:[self.mkMapView regionThatFits:region] animated:YES];

    HSPointAnnotation *annotation = [[HSPointAnnotation alloc] init];
    annotation.coordinate = coordinate;
    annotation.title = [data objectForKey:@"Title"];
    annotation.subtitle = [data objectForKey:@"Subtitle"];
    if ([[data objectForKey:@"Successful"] boolValue])
        annotation.pinColor = MKPinAnnotationColorGreen;
    else
        annotation.pinColor = MKPinAnnotationColorRed;
    annotation.photoThumbnail = [data objectForKey:@"Thumbnail"];
    [self.mkMapView addAnnotation:annotation];
    [self.mkMapView selectAnnotation:annotation animated:YES];
    
}

#pragma mark - MKMapView Delegates
- (MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<HSAnnotation>)annotation
{
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"pin"];
    if (annotationView == nil)
    {
        annotationView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin"];
        annotationView.canShowCallout = YES;
    }
    
    annotationView.pinColor = annotation.pinColor;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:annotation.photoThumbnail]];
    [imageView setFrame:CGRectMake(0, 0, 42, 42)];
    annotationView.leftCalloutAccessoryView = imageView;
    
    return annotationView;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    HSLog(@"HSMapViewController#dealloc");
}

@end


