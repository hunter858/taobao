#import <UIKit/UIKit.h>

@class JBCountdownView;

/**
 The `CountdownDelegate` protocol is adopted by a viewcontroller that ads a countdown label as a subview in order to get notified when the countdown ended.
 */
@protocol CountdownDelegate <NSObject>

@optional
/**
 Get called when the countdown ends.
 @param countdown The countdown that has ended.
 @since 0.0.1
 */
- (void)countdownFinnishIn:(JBCountdownView *)countdown;

@end


/**
 `JBCountdownLabel` is a subclass of `UILabel` that displays a countdown with a defined amount of seconds.
 */

@interface JBCountdownView : UIView

/**
 Initializes and returns a newly allocated UILabel object with a countdown configured with the specified number of seconds.
 @param frame    The fram of the UILabel.
 @param string   The format string text of the UILabel, `%@` to define where to place the countdown.
 @param seconds  The number of seconds of the countdown.
 @param delegate The delegate that will receive callbacks when the countdown ends.
 @since 0.0.1
 */
- (instancetype)initWithFrame:(CGRect)frame format:(NSString *)string time:(int)seconds delegate:(id <CountdownDelegate>)delegate;

///----------------------------------
/// @name Manage countdown
///----------------------------------

/**
 Restart the countdown setting the countdown to the initial amount of seconds.
 @since 0.0.1
 */
- (void)restartCountdown;

/**
 Cancel the countdown setting the countdown to 0.
 @since 0.0.1
 */
- (void)cancelCountdown;

/**
 Set a new amount of seconds to the current countdown and restarts it.
 @param seconds The new amount of seconds to define on the countdown.
 @since 0.0.1
 */
- (void)setTime:(int)seconds;

@end
