#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    if (string1.length == 0)
        return string2;
    if (string2.length == 0)
        return string1;
    
    int str1CurrentChar = 0;
    int str2CurrentChar = 0;
    NSMutableString *result = [NSMutableString new];
    
    while (str1CurrentChar < string1.length && str2CurrentChar < string2.length) {
        NSString* str1Char = [string1 substringWithRange:NSMakeRange(str1CurrentChar, 1)];
        NSString* str2Char = [string2 substringWithRange:NSMakeRange(str2CurrentChar, 1)];
        
        if ([str1Char compare: str2Char] != NSOrderedDescending) {
            [result appendString:str1Char];
            str1CurrentChar++;
        }
        else {
            [result appendString:str2Char];
            str2CurrentChar++;
        }
    }
    if (str1CurrentChar == string1.length){
        [result appendString:[string2 substringFromIndex:str2CurrentChar]];
    }
    else {
        [result appendString:[string1 substringFromIndex:str1CurrentChar]];
    }
    return result;
}

@end
