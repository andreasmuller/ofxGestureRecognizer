/*
 *  ofTapGestureRecognizer.h
 *
 *  Created by Ryan Raffa on 5/13/12
 *
 *  Based on example code by http://www.daanvanhasselt.com
 *
 */

#import <Foundation/Foundation.h>
#include "ofMain.h"

@interface ofTapGestureRecognizer : NSObject {
    UITapGestureRecognizer *tapGestureRecognizer;
	
@public
	ofEvent<ofMouseEventArgs> tapEvent;
}  

-(id)initWithView:(UIView*)view;  
-(void)handleTap:(UITapGestureRecognizer *) gr;  

@end