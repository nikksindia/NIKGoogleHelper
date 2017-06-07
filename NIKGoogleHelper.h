//
//  NIKGoogleHelper.h
//  NIKGoogleHelper
//
//  Created by Nikhil Sharma on 2/27/17.
//  Copyright © 2017 Nikhil Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Google/SignIn.h>

@protocol GoogleHelperDelegate<NSObject>
@required
// list of required methods
-(void)googleLoginSuccessWithReponse:(NSDictionary *)dictResponse;
-(void)googleLoginFailedWithError:(NSError *)error;
@optional
// list of optional methods
-(void)googleLoginCancelledByUser;
@end

@interface NIKGoogleHelper : NSObject<GIDSignInDelegate,GIDSignInUIDelegate>
+(NIKGoogleHelper*)sharedGHelper;
@property(nonatomic,assign) id<GoogleHelperDelegate> delegate;
@property(nonatomic,strong)GIDSignIn *signIn;
@property(nonatomic,strong)UIViewController *baseViewController;
-(void)doGoogleLogin;
-(void)doGoogleLogout;

@end
