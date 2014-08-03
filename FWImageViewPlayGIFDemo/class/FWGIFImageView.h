//
//  FWGIFImageView.h
//  FWImageViewPlayGIFDemo
//
//  Created by CyonLeu on 14-8-3.
//  Copyright (c) 2014年 CyonLeuInc. All rights reserved.
//

/**
 *  @brief Use UIImageView play GIF
 *      CADisplayLink and NSRunloop
 */


#import <UIKit/UIKit.h>


/** if animationRepeatCount = n (n>0)
 *  RepeatCount animation finished can receive this notification: kReapeatCountAnimationFinishedNotification
 */
extern  NSString *const kReapeatCountAnimationFinishedNotification;

@interface FWGIFImageView : UIImageView

/**
 *  @brief default runLoopMode is NSDefaultRunLoopMode 
 */
@property (nonatomic, copy) NSString *runLoopMode;

- (id)initWithGIFPath:(NSString *)gifPath;
- (void)setGIFPath:(NSString *)gifPath;


@end
