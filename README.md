# NIKGoogleHelper

## Installation

To install it, simply drag and drop these two classes into your project.

## Google Console Setup

1. Generate Google Configuration File using the following link:
https://developers.google.com/mobile/add?platform=ios&cntapi=signin&cntapp=Default%20Demo%20App&cntpkg=com.google.samples.quickstart.SignInExample&cnturl=https:%2F%2Fdevelopers.google.com%2Fidentity%2Fsign-in%2Fios%2Fstart%3Fconfigured%3Dtrue&cntlbl=Continue%20with%20Try%20Sign-In
2.Enable Google Sign-In (For sign-in)
   Enable Google Analytics (For Google Analytics)
   Enable Google Cloud Messaging (For FCM notifications)
3. Download generated Info.Plist File for your application.


## Project Setup
 Simply follow these steps:
 
1. Drag and drop downloaded info.plist to your project.
2. Add URL Types ->URL Schemes :-> Your Reverse Client ID
3. Add URL Types ->URL Schemes :-> Your Bundle Identifier
4. Configure Google in AppDelegate Class -> didFinishLaunchingWithOptions
        NSError* configureError;
    [[GGLContext sharedInstance] configureWithError: &configureError];
    NSAssert(!configureError, @"Error configuring Google services: %@", configureError);
5. Setup Return type-> Application open Url method (iOS 8.0 and below)
    return [[GIDSignIn sharedInstance] handleURL:url
                               sourceApplication:sourceApplication
                                      annotation:annotation];
6. Setup Return type-> Application open Url method (iOS 9.0 and above)
        return [[GIDSignIn sharedInstance] handleURL:url
          sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
          annotation:options[UIApplicationOpenURLOptionsAnnotationKey]];
          
## Use
Just Import NIKGoogleHelper in your view controller. Then make instance of helper class in view controller and setBaseViewController to 'self'. Now you are done with setup. Enjoy :)

  + Login Method -> -(void)doGoogleLogin
  + Logout Method -> -(void)doGoogleLogout()
  + Login Success Method(@required) -> -(void)googleLoginSuccessWithReponse:(NSDictionary *)dict
  + Login Failed Method(@required) -> -(void)googleLoginFailedWithError(NSError *)error
  + Login Cancelled Method(@optional) -> -(void)googleLoginCancelledByUser(NSError *)error
          
## License
NIKGoogleHelper is available under the MIT License.         
