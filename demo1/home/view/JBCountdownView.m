#import "JBCountdownView.h"

@interface JBCountdownView()

@property (nonatomic, weak) id<CountdownDelegate> delegate;
@property (nonatomic, strong) NSString *stringFormat;
@property (nonatomic, strong) NSDate *expirationDate;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) int numSeconds;

@property (nonatomic, strong) UILabel *dayNum1;
@property (nonatomic, strong) UILabel *dayNum2;

@property (nonatomic, strong) UILabel *hourNum1;
@property (nonatomic, strong) UILabel *hourNum2;

@property (nonatomic, strong) UILabel *secondNum1;
@property (nonatomic, strong) UILabel *secondNum2;

@property (nonatomic, strong) NSString *countdownString;
@end

@implementation JBCountdownView

-(void)removeFromSuperview{
    [self.timer invalidate];
    [super removeFromSuperview];
}

- (instancetype)initWithFrame:(CGRect)frame format:(NSString *)string time:(int)seconds delegate:(id <CountdownDelegate>)delegate
{
    NSAssert(seconds > 0, @"You must provide a positive amount of time.");
    
    self = [super initWithFrame:frame];
    if (self)
    {
        self.numSeconds     = seconds;
        self.stringFormat   = string ?: @"%@";
        self.delegate       = delegate;
        
        [self defaultLabel];
        [self restartCountdown];
        [self updateLabel];
    }
    return self;
}

#pragma mark-分6个部分
-(void)setMulitLabel:(NSString *)text
{
    if (text.length>=9) {
        self.dayNum1.text=@"99";
    }
    else
    {
        self.dayNum1.text=[text substringWithRange:NSMakeRange(text.length-8, 2)];
    }
    
    self.hourNum1.text=[text substringWithRange:NSMakeRange(text.length-5, 2)];
    self.secondNum1.text=[text substringWithRange:NSMakeRange(text.length-2, 2)];
}

#pragma mark - Public methods

- (void)setTime:(int)seconds
{
    self.numSeconds = seconds;
    self.expirationDate = [NSDate dateWithTimeIntervalSinceNow:self.numSeconds];
}

- (void)restartCountdown
{
    [self.timer invalidate];
    
    self.expirationDate = [NSDate dateWithTimeIntervalSinceNow:self.numSeconds];
    self.countdownString  = [NSString stringWithFormat:self.stringFormat, [self currentTimeString]];
    [self setMulitLabel:[self currentTimeString]];
    
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateLabel) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    //2016/8/31 添加了一个方法，解决滚动scrollView timer 不倒计时
}

- (void)cancelCountdown
{
    [self.timer invalidate];
    self.expirationDate = [NSDate date];
    self.countdownString = [NSString stringWithFormat:self.stringFormat, [self currentTimeString]];
    [self setMulitLabel:[self currentTimeString]];
}

#pragma mark - Private methods

- (void)defaultLabel
{
    self.dayNum1=[[UILabel alloc]initWithFrame:CGRectMake(5, 10, 16, 17)];
    self.dayNum1.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    self.dayNum1.textAlignment   = NSTextAlignmentCenter;
    self.dayNum1.font            = [UIFont boldSystemFontOfSize:10];
    self.dayNum1.textColor       = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    self.dayNum1.shadowColor     = [UIColor clearColor];
    self.dayNum1.layer.cornerRadius=3;
    self.dayNum1.layer.masksToBounds=YES;
    [self addSubview:self.dayNum1];
    
    UILabel *colon1=[[UILabel alloc]initWithFrame:CGRectMake(21, 10, 5, 17)];
    colon1.text=@":";
    colon1.backgroundColor=[UIColor whiteColor];
    colon1.textColor=[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    [self addSubview:colon1];
    
    self.hourNum1=[[UILabel alloc]initWithFrame:CGRectMake(26, 10, 16, 17)];
    self.hourNum1.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    self.hourNum1.textAlignment   = NSTextAlignmentCenter;
    self.hourNum1.font            = [UIFont boldSystemFontOfSize:10];
    self.hourNum1.textColor       = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    self.hourNum1.shadowColor     = [UIColor clearColor];
    self.hourNum1.layer.cornerRadius=3;
    self.hourNum1.layer.masksToBounds=YES;
    [self addSubview:self.hourNum1];
    
    UILabel *colon2=[[UILabel alloc]initWithFrame:CGRectMake(42, 10, 5, 17)];
    colon2.text=@":";
    colon2.backgroundColor=[UIColor whiteColor];
    colon2.textColor=[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    [self addSubview:colon2];
    
    self.secondNum1=[[UILabel alloc]initWithFrame:CGRectMake(47, 10, 16, 17)];
    self.secondNum1.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    self.secondNum1.textAlignment   = NSTextAlignmentCenter;
    self.secondNum1.font            = [UIFont boldSystemFontOfSize:10];
    self.secondNum1.textColor       = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    self.secondNum1.shadowColor     = [UIColor clearColor];
    self.secondNum1.layer.cornerRadius=3;
    self.secondNum1.layer.masksToBounds=YES;
    [self addSubview:self.secondNum1];
    
    self.frame=CGRectMake(self.frame.origin.x, self.frame.origin.y,self.secondNum1.frame.origin.x+self.secondNum1.frame.size.width, self.secondNum1.frame.size.height+self.secondNum1.frame.origin.y);
}

- (void)updateLabel
{
    NSString *currentTime = [self currentTimeString];
    self.countdownString= [NSString stringWithFormat:self.stringFormat, currentTime];
    [self setMulitLabel:[self currentTimeString]];
    
    if ([[NSDate date] timeIntervalSinceDate:self.expirationDate] >= 0)
    {
        [self cancelCountdown];
        if ([self.delegate respondsToSelector:@selector(countdownFinnishIn:)]) {
            [self.delegate countdownFinnishIn:self];
        }
    }
}

- (NSString *)currentTimeString
{
    NSDateComponents *countdown = [[NSCalendar currentCalendar] components:(NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit)
                                                                  fromDate:[NSDate date]
                                                                    toDate:self.expirationDate
                                                                   options:0];
    NSString *timeRemaining;
    
        timeRemaining = [NSString stringWithFormat:@"%02ld:%02ld:%02ld",[countdown hour],[countdown minute], [countdown second]];
    return timeRemaining;
}

@end
