//
//  main.m
//  pfd
//
//  Created by chikami on 2016/11/22.
//  Copyright © 2016年 ex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, const char * argv[]) {
        NSAppleScript  *scriptObject = [[NSAppleScript alloc] initWithSource:@""
                                        "try\n"
                                        "tell application \"Finder\" to set current_directory to quoted form of POSIX path of (target of window 1 as alias)\n"
                                        "end try\n"
                                        "return current_directory"
                                        ];

        NSDictionary           *errorDict;
        NSAppleEventDescriptor *returnDescriptor = NULL;
        returnDescriptor = [scriptObject executeAndReturnError:&errorDict];

        NSString *trimmedString = [returnDescriptor.stringValue stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"'"]];
        fprintf(stdout, "%s\n", [trimmedString UTF8String]);
    return 0;
}
