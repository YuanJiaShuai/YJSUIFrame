//
//  NSDate+YJSDate.h
//  UICategory
//
//  Created by yjs on 2021/12/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//如果有新的格式，请在这里添加
typedef NS_ENUM(NSInteger, YJSTimeStyle) {
    YJSTimeStyleComplete = 1,//2017-07-21 10:59:03
    YJSTimeStyleYearMonthDay,//2017-07-21
    YJSTimeStyleYearMonthDayLine,//2017/07/21
    YJSTimeStyleYearMonthDayDot,//2017.07.21
    YJSTimeStyleYearMonth,//2017-07
    YJSTimeStyleChYearMonth,//2017年07月
    YJSTimeStyleYearMonthLine,//2017/07
    YJSTimeStyleMonthDay,//07-21
    YJSTimeStyleMonthLineDay,// 07/21
    YJSTimeStyleYearMonthDayChinese, //2017年7月21日
    YJSTimeStyleYearMonthDayHourMiniteDot,//2017.07.21 09:08
    YJSTimeStyleCNMonthDay,//7月21日
    YJSTimeStyleHourMiniteDot,//12:12:12
    YJSTimeStyleHourMinite,//12:12
    YJSTimeStyleCNMonthDayHourMinite,//12-21 12:12
};

@interface NSDate (YJSDate)

+ (void)initializeStatics;
+ (NSCalendar *)sharedCalendar;

/**
 获取时间的详细
 */
- (NSUInteger)second;
- (NSUInteger)minute;
- (NSUInteger)hour;
- (NSUInteger)day;
- (NSUInteger)weekday;
- (NSUInteger)weekNumber;
- (NSUInteger)month;
- (NSUInteger)year;

/// 时间戳字符串转日期
/// @param timeStampstring 时间戳字符串，如@"14012455112"
+ (NSDate*)dateByTimeStampString:(NSString*)timeStampstring;

/// 时间戳串转日期
/// @param timeStamp 时间戳字符串，如14012455112
+ (NSDate*)dateByTimeStamp:(NSTimeInterval)timeStamp;

/// 日期转时间戳字符串
/// @param date date
+ (NSString*)timeStampStringByDate:(NSDate*)date;

/// 日期转时间戳
/// @param date date
+ (NSTimeInterval)timeStampByDate:(NSDate*)date;

/// 时间戳字符串转年月日字符串
/// @param style YJSTimeStyle
/// @param timeStampString @"14012455112"
+ (NSString*)timeStyle:(YJSTimeStyle)style timeStampString:(NSString*)timeStampString;

/// 时间戳转年月日字符串
/// @param style YJSTimeStyle
/// @param timeStamp 14012455112
+ (NSString*)timeStyle:(YJSTimeStyle)style timeStamp:(NSTimeInterval)timeStamp;

/// 年月日字符串转时间戳字符串
/// @param time 2017-07-21
/// @param style YJSTimeStyle
+ (NSString*)timeStampStringByTime:(NSString *)time style:(YJSTimeStyle)style;

/// 年月日字符串转时间戳
/// @param time 2017-07-21
/// @param style YJSTimeStyle
+ (NSTimeInterval)timeStampByTime:(NSString *)time style:(YJSTimeStyle)style;

/// 年月日转日期
/// @param time 2017-07-21
/// @param style YJSTimeStyle
+ (NSDate*)dateByTime:(NSString*)time style:(YJSTimeStyle)style;

/// 日期转年月日
/// @param date NSDate
/// @param style YJSTimeStyle
+ (NSString*)timeByDate:(NSDate*)date style:(YJSTimeStyle)style;

@end

NS_ASSUME_NONNULL_END
