/*
 *  ofTapGestureRecognizer.cpp
 *
 *  Created by Ryan Raffa on 5/13/12.
 *  Based on example code by http://www.daanvanhasselt.com
 *
 */

#import "ofTapGestureRecognizer.h"  

@implementation ofTapGestureRecognizer  

-(id)initWithView:(UIView*)view{  
    if((self = [super init])){  
        tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];  
        [view addGestureRecognizer:tapGestureRecognizer];  
    }  
    return self;  
}  

-(void)handleTap:(UITapGestureRecognizer *) gr{  
    if([gr state] == UIGestureRecognizerStateRecognized){  
        //NSLog(@"tap!");
		
		//CGPoint currentLocation = [gr translationInView: gr.view ];
		CGPoint currentLocation = [gr locationInView: gr.view ];
		//CGPoint tapPoint = [sender locationInView:self.view];
		
		ofMouseEventArgs args;
		args.x = currentLocation.x;
		args.y = currentLocation.y;
		
		ofNotifyEvent(tapEvent, args);
    }  
}  

-(void)dealloc{  
    [tapGestureRecognizer release];  
    [super dealloc];  
}  

@end