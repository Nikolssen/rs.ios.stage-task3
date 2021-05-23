#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber == 0 || monthNumber > 12)
        return nil;
    
    NSDateFormatter* formatter = [NSDateFormatter new];
    NSString* name = [[formatter monthSymbols] objectAtIndex:(monthNumber - 1)];
    return name;
        
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSString* format = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    NSDateFormatter* formatter = [NSDateFormatter new];
    formatter.dateFormat = format;
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDate* theDate = [formatter dateFromString:date];
    return [calendar component:NSCalendarUnitDay fromDate: theDate];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSCalendar* calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    
    NSLocale* locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru"];
    NSDateFormatter* formatter = [NSDateFormatter new];
    formatter.locale = locale;
    formatter.calendar = calendar;
    formatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:10800];
    formatter.dateFormat = @"E";
    return [formatter stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar* calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    calendar.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru"];
    calendar.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:10800];
    
    NSDateComponents* currentDateComponents = [calendar components:NSCalendarUnitYear|NSCalendarUnitWeekOfYear fromDate:[NSDate now]];
    NSDateComponents* dateComponents = [calendar components:NSCalendarUnitYear|NSCalendarUnitWeekOfYear fromDate: date];
    if (currentDateComponents.year == dateComponents.year) {
        return currentDateComponents.weekOfYear == dateComponents.weekOfYear;
    }
    return NO;
}

@end
