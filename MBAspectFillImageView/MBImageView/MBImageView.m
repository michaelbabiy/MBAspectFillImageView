//
//  MBImageView.m
//  ImageView
//
//  Created by Michael Babiy on 9/30/14.
//  Copyright (c) 2014 Michael Babiy. All rights reserved.
//

#import "MBImageView.h"

@implementation MBImageView

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [super setImageScaling:NSImageScaleAxesIndependently];
    }
    return self;
}

- (void)setImage:(NSImage *)image {
    
    NSImage *resizedImage = [NSImage imageWithSize:self.bounds.size flipped:NO drawingHandler: ^BOOL(NSRect dstRect) {
                                            NSSize imageSize = [image size];
                                            NSSize imageViewSize = self.bounds.size;
                                            NSSize newImageSize = imageSize;
                                            
                                            CGFloat imageAspectRatio = imageSize.height / imageSize.width;
                                            CGFloat imageViewAspectRatio = imageViewSize.height / imageViewSize.width;
                                            
                                            if (imageAspectRatio < imageViewAspectRatio) {
                                                newImageSize.width = imageSize.height / imageViewAspectRatio;
                                            } else {
                                                newImageSize.height = imageSize.width * imageViewAspectRatio;
                                            }
                                            
                                            NSRect srcRect = NSMakeRect(imageSize.width / 2.0 - newImageSize.width / 2.0,
                                                                        imageSize.height / 2.0 - newImageSize.height / 2.0,
                                                                        newImageSize.width,
                                                                        newImageSize.height);
                                            
                                            [[NSGraphicsContext currentContext] setImageInterpolation:NSImageInterpolationHigh];
                                            [image drawInRect:dstRect fromRect:srcRect operation:NSCompositeCopy fraction:1.0 respectFlipped:YES hints:nil];
                                            
                                            return YES;
                                        }];
    
    [resizedImage setCacheMode:NSImageCacheNever];
    [super setImage:resizedImage];
}

@end
