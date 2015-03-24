/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "JpCoeInappsettingskitModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "TiApp.h"

@implementation JpCoeInappsettingskitModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"844c4c67-1f3b-4cc7-a5dc-1e23e7c3a431";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"jp.coe.inappsettingskit";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(id)example:(id)args
{
	// example method
	return @"hello world";
}

-(id)exampleProp
{
	// example property getter
	return @"hello world";
}

-(void)setExampleProp:(id)value
{
	// example property setter
}

//リーダーボードを立ち上げる
//-(IBAction)showBord
- (void) showSettings:(id)args
{
    
    //ENSURE_UI_THREAD(showBoard);
    ENSURE_UI_THREAD(showSettings,args);
//    ENSURE_SINGLE_ARG(args,NSDictionary);
    appSettingsViewController
    = [[IASKAppSettingsViewController alloc] init];
    
    appSettingsViewController.delegate = self;
    appSettingsViewController.showDoneButton = YES;
    UINavigationController *aNavController = [[UINavigationController alloc] initWithRootViewController:appSettingsViewController];


    [[TiApp app] showModalController: aNavController animated: YES];
    
    //    leaderboardController = [[GKLeaderboardViewController alloc] init];
    //    if (leaderboardController != nil)
    //    {
    //        leaderboardController.leaderboardDelegate = self;
    //         [[TiApp app] showModalController: leaderboardController animated: YES];
    //        //[self presentModalViewController: leaderboardController animated: YES];
    //    }
}

- (void) showView:(id)args
{
    
    //ENSURE_UI_THREAD(showBoard);
    ENSURE_UI_THREAD(showSettings,args);
    //    ENSURE_SINGLE_ARG(args,NSDictionary);
    appSettingsViewController
    = [[IASKAppSettingsViewController alloc] init];
    
    appSettingsViewController.delegate = self;
    appSettingsViewController.showDoneButton = YES;
    UINavigationController *aNavController = [[UINavigationController alloc] initWithRootViewController:appSettingsViewController];
    
    
    [[TiApp app] showModalController: aNavController animated: YES];
    
    //    leaderboardController = [[GKLeaderboardViewController alloc] init];
    //    if (leaderboardController != nil)
    //    {
    //        leaderboardController.leaderboardDelegate = self;
    //         [[TiApp app] showModalController: leaderboardController animated: YES];
    //        //[self presentModalViewController: leaderboardController animated: YES];
    //    }
}

- (void)settingsViewControllerDidEnd:(IASKAppSettingsViewController*)sender
{
    NSLog(@"done");
    [appSettingsViewController dismissModalViewControllerAnimated:YES];
    
    // your code here to reconfigure the app for changed settings (if needed)
}


@end
