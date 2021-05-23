#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    if (ratingArray.count < 3)
        return 0;
    unsigned long count = ratingArray.count;
    int counter = 0;
    for (unsigned long i = 0; i< count; i++) {
        for (unsigned long j = i+1; j < count; j++) {
            for (unsigned long k = j+1; k< count; k++) {
                if ((ratingArray[i].intValue < ratingArray[j].intValue && ratingArray[j].intValue < ratingArray[k].intValue) || (ratingArray[i].intValue > ratingArray[j].intValue && ratingArray[j].intValue > ratingArray[k].intValue))
                    counter++;
            }
        }
    }
    return counter;
}

@end
