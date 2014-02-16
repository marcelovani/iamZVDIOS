//  DIOSNode.m
//
// ***** BEGIN LICENSE BLOCK *****
// Version: MPL 1.1/GPL 2.0
//
// The contents of this file are subject to the Mozilla Public License Version
// 1.1 (the "License"); you may not use this file except in compliance with
// the License. You may obtain a copy of the License at
// http://www.mozilla.org/MPL/
//
// Software distributed under the License is distributed on an "AS IS" basis,
// WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
// for the specific language governing rights and limitations under the
// License.
//
// The Original Code is Kyle Browning, released June 27, 2010.
//
// The Initial Developer of the Original Code is
// Kyle Browning
// Portions created by the Initial Developer are Copyright (C) 2010
// the Initial Developer. All Rights Reserved.
//
// Contributor(s):
//
// Alternatively, the contents of this file may be used under the terms of
// the GNU General Public License Version 2 or later (the "GPL"), in which
// case the provisions of the GPL are applicable instead of those above. If
// you wish to allow use of your version of this file only under the terms of
// the GPL and not to allow others to use your version of this file under the
// MPL, indicate your decision by deleting the provisions above and replacing
// them with the notice and other provisions required by the GPL. If you do
// not delete the provisions above, a recipient may use your version of this
// file under either the MPL or the GPL.
//
// ***** END LICENSE BLOCK *****
#import "DIOSView.h"
#import "DIOSSession.h"
@implementation DIOSView
+ (void)viewGet:(NSDictionary *)params
        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure {
   
	int x=0;
   
	NSMutableString *path = [NSMutableString stringWithFormat:@"%@/%@/%@?", kDiosEndpoint, kDiosBaseView, [params objectForKey:@"view_name"]];
	for (NSString *key in params) {
		id value = [params objectForKey:key];
		if (![key isEqualToString:@"view_name"]) {
         
			//the code below was inserted because if there is only one argument, the "&" is not needed and the view doesn't work
			if(x++) {
            [path appendFormat:@"&"];
         }
			// end
         
			[path appendFormat:@"%@=%@", key, value];
		}
	}
      
   if ([[DIOSSession sharedSession] signRequests]) {
      [[DIOSSession sharedSession] sendSignedRequestWithPath:path
                                                      method:@"GET"
                                                      params:nil
                                                     success:success
                                                     failure:failure];
   }
   else {
      [[DIOSSession sharedSession] getPath:path
                                parameters:nil
                                   success:success
                                   failure:failure];
   }
}

+ (void)viewCustomViewGet:(NSDictionary *)params
                 viewName:(NSString*) viewName
                  success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                  failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure {
   
	int x=0;
   
	NSMutableString *path = [NSMutableString stringWithFormat:@"%@/%@/?", kDiosEndpoint, viewName];
	for (NSString *key in params) {
		id value = [params objectForKey:key];
		if (![key isEqualToString:@"view_name"]) {
         
			//the code below was inserted because if there is only one argument, the "&" is not needed and the view doesn't work
			if(x++) {
            [path appendFormat:@"&"];
         }
			// end
         
			[path appendFormat:@"%@=%@", key, value];
		}
	}
   
   if ([[DIOSSession sharedSession] signRequests]) {
      [[DIOSSession sharedSession] sendSignedRequestWithPath:path
                                                      method:@"GET"
                                                      params:nil
                                                     success:success
                                                     failure:failure];
   }
   else {
      [[DIOSSession sharedSession] getPath:path
                                parameters:nil
                                   success:success
                                   failure:failure];
   }
}

+ (void)viewCustomViewGetWalkthroughSet:(NSDictionary *)params
                               viewName:(NSString*) viewName
                        walkthroughName:(NSString*) walkthroughName
                                success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure {
   
	int x=0;
   
	NSMutableString *path = [NSMutableString stringWithFormat:@"%@/%@/%@", kDiosEndpoint, viewName, walkthroughName];
	for (NSString *key in params) {
		id value = [params objectForKey:key];
		if (![key isEqualToString:@"view_name"]) {
         
			//the code below was inserted because if there is only one argument, the "&" is not needed and the view doesn't work
			if(x++) {
            [path appendFormat:@"&"];
         }
			// end
         
			[path appendFormat:@"%@=%@", key, value];
		}
	}
   
   if ([[DIOSSession sharedSession] signRequests]) {
      [[DIOSSession sharedSession] sendSignedRequestWithPath:path
                                                      method:@"GET"
                                                      params:nil
                                                     success:success
                                                     failure:failure];
   }
   else {
      [[DIOSSession sharedSession] getPath:path
                                parameters:nil
                                   success:success
                                   failure:failure];
   }
}

@end