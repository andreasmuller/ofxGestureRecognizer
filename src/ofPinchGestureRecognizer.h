/*
 *  ofPinchGestureRecognizer.h
 *
 *  Created by Ryan Raffa on 5/13/12
 *  Updated 12/1/12
 *
 *  Based on example code by http://www.daanvanhasselt.com
 *
 */

#import <Foundation/Foundation.h>  
#include "ofMain.h"

// -------------------------------------------------
class ofPinchGestureRecognizerArgs : public ofMouseEventArgs {
public:
    float scale;
    float scaleDelta;
};

// -------------------------------------------------
@interface ofPinchGestureRecognizer : NSObject {  
    UIPinchGestureRecognizer *pinchGestureRecognizer;  

@public
    CGFloat                scale;
    CGFloat                prevScale;
    BOOL                   pinching;
	
	ofEvent<ofPinchGestureRecognizerArgs>	   pinchZoomEvent;

}

@property(assign,nonatomic) BOOL cancelsTouchesInView;

-(id)initWithView:(UIView*)view;  
-(void)handlePinch:(UIPinchGestureRecognizer *) gr;  

@end

