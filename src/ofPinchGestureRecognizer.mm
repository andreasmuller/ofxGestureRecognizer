/*
 *  ofPinchGestureRecognizer.m
 *
 *  Created by Ryan Raffa on 5/13/12.
 *  Based on example code by http://www.daanvanhasselt.com
 *
 */

#import "ofPinchGestureRecognizer.h"

@implementation ofPinchGestureRecognizer

@synthesize cancelsTouchesInView;

-(id)initWithView:(UIView*)view{  
    if((self = [super init])){
		prevScale = -1.0f;
		scale = -1.0f;
        pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];  
        [view addGestureRecognizer:pinchGestureRecognizer];  
    }  
    return self;  
}  

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

-(void)handlePinch:(UIPinchGestureRecognizer *) gr{
	
	ofPinchGestureRecognizerArgs args;
	
    if([gr state] == UIGestureRecognizerStateBegan){
        scale = [gr scale];
		prevScale = scale;
        pinching = true;
        //NSLog(@"Start Pinch!");
		
		args.type = ofMouseEventArgs::Pressed;
		args.scale = scale;
		args.scaleDelta = 0.0f;
    }
    if([gr state] == UIGestureRecognizerStateChanged){
		prevScale = scale;
        scale = [gr scale];
		float scaleDelta = scale - prevScale;
		
		args.type = ofMouseEventArgs::Dragged;
		args.scale = scale;
		args.scaleDelta = scaleDelta;
    }
    if([gr state] == UIGestureRecognizerStateEnded){
        pinching = false;
        //NSLog(@"End Pinch!");
	
		args.scale = scale;
		args.scaleDelta = 0.0f;
		args.type = ofMouseEventArgs::Released;
    }
	
	ofNotifyEvent(pinchZoomEvent, args);
}

-(void)dealloc{  
    [pinchGestureRecognizer release];  
    [super dealloc];  
}  

@end