#include "ofMain.h"
#include "testApp.h"
#include "ofxiOSExtras.h"

int main(){
	//ofSetupOpenGL(1024,768, OF_FULLSCREEN);			// <-------- setup the GL context

	ofAppiOSWindow * iOSWindow = new ofAppiOSWindow();
	
    iOSWindow->enableHardwareOrientation();
    iOSWindow->enableOrientationAnimation();
    
	iOSWindow->enableDepthBuffer();
	iOSWindow->enableAntiAliasing(4);

	iOSWindow->enableRetina();
	
	ofSetupOpenGL(iOSWindow, 480, 320, OF_FULLSCREEN);
	ofRunApp(new testApp);
}
