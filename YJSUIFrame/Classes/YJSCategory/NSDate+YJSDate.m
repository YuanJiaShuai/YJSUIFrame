//
//  NSDate+YJSDate.m
//  UICategory
//
//  Created by yjs on 2021/12/23.
//

#import "NSDate+YJSDate.h"

@implementation NSDate (YJSDate)

static NSCalendar *_calendar = nil;

+ (void)initializeStatics {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            if (_calendar == nil) {
#if __has_feature(objc_arc)
                _calendar = [NSCalendar currentCalendar];
#else
                _calendar = [[NSCalendar currentCalendar] retain];
#endif
            }
        }
    });
}

+ (NSCalendar *)sharedCalendar{
    [self initializeStatics];
    return _calendar;
}

//秒
- (NSUInteger)second{
    NSCalendar *calendar = [[self class] sharedCalendar];
    NSDateComponents *weekdayComponents = [calendar components:(NSCalendarUnitSecond) fromDate:self];
    return [weekdayComponents second];
}


//分钟
- (NSUInteger)minute{
    NSCalendar *calendar = [[self class] sharedCalendar];
    NSDateComponents *weekdayComponents = [calendar components:(NSCalendarUnitMinute) fromDate:self];
    return [weekdayComponents minute];
}

//小时
- (NSUInteger)hour{
    NSCalendar *calendar = [[self class] sharedCalendar];
    NSDateComponents *weekdayComponents = [calendar components:(NSCalendarUnitHour) fromDate:self];
    return [weekdayComponents hour];
}

//天
- (NSUInteger)day{
    NSCalendar *calendar = [[self class] sharedCalendar];
    NSDateComponents *weekdayComponents = [calendar components:(NSCalendarUnitDay) fromDate:self];
    return [weekdayComponents day];
}

//星期
- (NSUInteger)weekday{
    NSDateComponents *weekdayComponents = [[[self class] sharedCalendar] components:(NSCalendarUnitWeekday) fromDate:self];
    return [weekdayComponents weekday];
}

//本年第多少周
- (NSUInteger)weekNumber{
    NSCalendar *calendar = [[self class] sharedCalendar];
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitWeekOfYear) fromDate:self];
    return [dateComponents weekOfYear];
}

//月
- (NSUInteger)month{
    NSCalendar *calendar = [[self class] sharedCalendar];
    NSDateComponents *monthComponents = [calendar components:(NSCalendarUnitMonth) fromDate:self];
    return [monthComponents month];
}

//年
- (NSUInteger)year{
    NSCalendar *calendar = [[self class] sharedCalendar];
    NSDateComponents *weekdayComponents = [calendar components:(NSCalendarUnitYear) fromDate:self];
    return [weekdayComponents year];
}

/**
 *时间戳字符串转日期
 @param timeStampstring 时间戳字符串，如@"14012455112"
 @return NSDate
 */
+(NSDate*)dateByTimeStampString:(NSString*)timeStampstring{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStampstring.floatValue];
    return date;
}

/**
 *时间戳串转日期
 @param timeStamp 时间戳字符串，如14012455112
 @return NSDate
 */
+(NSDate*)dateByTimeStamp:(NSTimeInterval)timeStamp{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    return date;
}

/**
 *日期转时间戳字符串
 
 @param date NSDate
 @return 时间戳字符串，如@"14012455112"
 */
+(NSString*)timeStampStringByDate:(NSDate*)date{
    NSInteger timeStamp = [date timeIntervalSince1970];
    NSString* timeStampString = [NSString stringWithFormat:@"%ld",(long)timeStamp];
    return timeStampString;
}

/**
 日期转时间戳
 
 @param date NSDate
 @return 14012455112
 */
+(NSTimeInterval)timeStampByDate:(NSDate*)date{
    NSTimeInterval timeStamp = [date timeIntervalSince1970];
    return timeStamp;
}

/**
 时间戳字符串转年月日字符串
 
 @param style YJSTimeStyle
 @param timeStampString @"14012455112"
 @return 2017-07-21 10:59:03
 */
+(NSString*)timeStyle:(YJSTimeStyle)style timeStampString:(NSString*)timeStampString{
    NSString* time = [self timeStyle:style timeStamp:timeStampString.floatValue];
    return time;
}

/**
 时间戳转年月日字符串
 
 @param style YJSTimeStyle
 @param timeStamp 14012455112
 @return 2017-07-21
 */
+(NSString*)timeStyle:(YJSTimeStyle)style timeStamp:(NSTimeInterval)timeStamp{
    NSDateFormatter* formatter = [self formatterWithStyle:style];
    NSDate* date = [self dateByTimeStamp:timeStamp];
    NSString* time = [formatter stringFromDate:date];
    return time;
}

/**
 年月日字符串转时间戳字符串
 
 @param time YJSTimeStyle
 @param style 2017-07-21
 @return @"14012455112"
 */
+(NSString*)timeStampStringByTime:(NSString *)time style:(YJSTimeStyle)style{
    NSDate* date = [self dateByTime:time style:style];
    NSString* timeStampString = [self timeStampStringByDate:date];
    return timeStampString;
}

/**
 年月日字符串转时间戳
 
 @param time 2017-07-21
 @param style YJSTimeStyle
 @return 14012455112
 */
+(NSTimeInterval)timeStampByTime:(NSString *)time style:(YJSTimeStyle)style{
    NSString* timeStampString = [self timeStampStringByTime:time style:style];
    NSTimeInterval timeStamp = timeStampString.floatValue;
    return timeStamp;
}

/**
 年月日转日期
 
 @param time 2017-07-21
 @param style YJSTimeStyle
 @return NSDate
 */
+(NSDate*)dateByTime:(NSString*)time style:(YJSTimeStyle)style{
    NSDateFormatter* formatter = [self formatterWithStyle:style];
    NSDate* date = [formatter dateFromString:time];
    return date;
}

/**
 日期转年月日
 
 @param date NSDate
 @param style YJSTimeStyle
 @return 2017-07-21
 */
+(NSString*)timeByDate:(NSDate*)date style:(YJSTimeStyle)style{
    NSDateFormatter* formatter = [self formatterWithStyle:style];
    NSString* time = [formatter stringFromDate:date];
    return time;
}

#pragma mark - private helper
+(NSDateFormatter*)formatterWithStyle:(YJSTimeStyle)style{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    NSString* timeStyleString = nil;
    switch (style) {
        case YJSTimeStyleComplete:
            timeStyleString = @"yyyy-MM-dd HH:mm:ss";
            break;
        case YJSTimeStyleYearMonthDay:
            timeStyleString = @"yyyy-MM-dd";
            break;
        case YJSTimeStyleYearMonthDayLine:
            timeStyleString = @"yyyy/MM/dd";
            break;
            
        case YJSTimeStyleYearMonthDayDot:
            timeStyleString = @"yyyy.MM.dd";
            break;
        case YJSTimeStyleYearMonth:
            timeStyleString = @"yyyy-MM";
            break;
        case YJSTimeStyleChYearMonth:
            timeStyleString = @"yyyy年MM月";
            break;
            
        case YJSTimeStyleYearMonthLine:
            timeStyleString = @"yyyy/MM";
            break;
        case YJSTimeStyleMonthDay:
            timeStyleString = @"MM-dd";
            break;
        case YJSTimeStyleMonthLineDay:
            timeStyleString = @"MM/dd";
            break;
        case YJSTimeStyleYearMonthDayChinese:
            timeStyleString = @"yyyy年MM月dd日";
            break;
        case YJSTimeStyleYearMonthDayHourMiniteDot:
            timeStyleString = @"yyyy.MM.dd HH:mm";
            break;
        case YJSTimeStyleCNMonthDay:
            timeStyleString = @"MM月dd日";
            break;
        case YJSTimeStyleHourMiniteDot:
            timeStyleString = @"HH:mm:ss";
            break;
        case YJSTimeStyleHourMinite:
            timeStyleString = @"HH:mm";
            break;
        case YJSTimeStyleCNMonthDayHourMinite:
            timeStyleString = @"MM-dd HH:mm";
            break;
        case YJSTimeStyleHourMiniteNotPoint:
            timeStyleString = @"HHmm";
            break;
        default:
            break;
    }
    [formatter setDateFormat:timeStyleString];
    
    //设置时区,这个对于时间的处理有时很重要
    //例如你在国内发布信息,用户在国外的另一个时区,你想让用户看到正确的发布时间就得注意时区设置,时间的换算.
    //例如你发布的时间为2010-01-26 17:40:50,那么在英国爱尔兰那边用户看到的时间应该是多少呢?
    //他们与我们有7个小时的时差,所以他们那还没到这个时间呢...那就是把未来的事做了
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    return formatter;
}

@end
