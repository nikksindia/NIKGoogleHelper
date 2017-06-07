//
//  NIKGoogleHelper.m
//  NIKGoogleHelper
//
//  Created by Nikhil Sharma on 2/27/17.
//  Copyright © 2017 Nikhil Sharma. All rights reserved.
//

#import "NIKGoogleHelper.h"


@implementation NIKGoogleHelper
static NIKGoogleHelper* sharedGHelper = nil;

+(NIKGoogleHelper*)sharedGHelper
{
    @synchronized([NIKGoogleHelper class])
    {
        if (!sharedGHelper)
            sharedGHelper = [[self alloc] init];
        
        return sharedGHelper;
    }
    return nil;
}
-(id)init
{
    self.signIn = [GIDSignIn sharedInstance];
    self.signIn.shouldFetchBasicProfile = true;
    self.signIn.delegate = self;
    self.signIn.uiDelegate = self;
    return self;
}
-(void)doGoogleLogin
{
    [self.signIn signIn];
}
-(void)doGoogleLogout
{
    [self.signIn signOut];
}



//pressed the sign-in button
- (void)signInWillDispatch:(GIDSignIn *)signIn error:(NSError *)error
{
    // NSLog(@"%@",error.description);
}
// Present a view that prompts the user to sign in with Google
- (void)signIn:(GIDSignIn *)signIn presentViewController:(UIViewController *)viewController
{
    //present view controller
     [self.baseViewController presentViewController:viewController animated:YES completion:nil];
}

// Dismiss the "Sign in with Google" view
- (void)signIn:(GIDSignIn *)signIn dismissViewController:(UIViewController *)viewController
{
    //dismiss view controller
    [self.baseViewController dismissViewControllerAnimated:YES completion:nil];
}
- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error
{
    // Perform any operations on signed in user here.
    if (error == nil)
    {
        NSString *strImageURL = (user.profile.hasImage) ? [[user.profile imageURLWithDimension:300] absoluteString] : @"";
        NSDictionary *dictResult = [[NSDictionary alloc] initWithObjectsAndKeys:user.userID,@"user_id",user.profile.name,@"name",user.profile.email,@"email",user.profile.familyName,@"family_name",user.profile.givenName,@"given_name",strImageURL,@"image_url",nil];
        NSLog(@"\n ////////////////////////////////////////////\nGoogle User Log-In Success \n %@\n ////////////////////////////////////////////",dictResult.description);
        if([self.delegate respondsToSelector:@selector(googleLoginSuccessWithReponse:)])
        {
            [self.delegate googleLoginSuccessWithReponse:dictResult.mutableCopy];
        }
    }
    else
    {
        NSLog(@"//////////////////////////////////////////////// \n Google Login Failed With Error %@ \n ////////////////////////////////////////", error.localizedDescription);
        if([self.delegate respondsToSelector:@selector(googleLoginFailedWithError:)])
        {
            [self.delegate googleLoginFailedWithError:error];
        }
    }
}

- (void)signIn:(GIDSignIn *)signIn didDisconnectWithUser:(GIDGoogleUser *)user withError:(NSError *)error
{
    // Perform any operations when the user disconnects from app here.
}


@end
