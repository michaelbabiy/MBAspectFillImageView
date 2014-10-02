//
//  AppDelegate.m
//  MBAspectFillImageView
//
//  Created by Michael Babiy on 10/2/14.
//  Copyright (c) 2014 Michael Babiy. All rights reserved.
//

#import "AppDelegate.h"
#import "MBImageView.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@property (weak) IBOutlet MBImageView *imageView;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSImage *image = [NSImage imageNamed:@"audi-r8"];
    self.imageView.image = image;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // ...
}

@end
