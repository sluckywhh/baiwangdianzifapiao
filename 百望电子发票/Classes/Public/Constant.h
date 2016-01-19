//
//  Constant.h
//  tradeshiftHome
//
//  Created by taq on 5/15/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#ifndef tradeshiftHome_Const_h
#define tradeshiftHome_Const_h

#define kLastVisitorTime        @"kLastVisitorTime"
#define kMaxTagCount            20
#define kMaxTagLentgh           8


// define if use mock server for test
// PLEASE comment out the define below before release
#define MockAPI


// real config below

// const urls
#define MOCK_URL                @"http://localhost:1234/"
#define URL_TRADESHIFT_API      @"http://172.16.30.157:8889/tradeshift-proxy/"
#define CN_MOIBLE_SANDBOX       @"https://api-cn-mobile-sandbox.tradeshift.com/tradeshift/"
#define PRODUCTION_API          @"https://api.tradeshift.com/tradeshift/"
#define SANDBOX_API             @"https://api-mobile-sandbox.tradeshift.com/tradeshift/"

#define SANDBOX_SSOURL          @"https://api-cn-mobile-sandbox.tradeshift.com/tradeshift/auth/login?response_type=code&client_id=Tradeshift.MobileAccess&redirect_uri=https://localhost/dummy&scope=all"
#define PRODUCTION_SSOURL       @"https://api.tradeshift.com/tradeshift/auth/login?response_type=code&client_id=Tradeshift.MobileAccess&redirect_uri=https://localhost/dummy&scope=all"

//#define CN_MOIBLE_SANDBOX      @"http://172.16.30.157:8889/tradeshift-proxy/"


#if DEBUG
    #define BASE_URL CN_MOIBLE_SANDBOX
    #define SSO_URL SANDBOX_SSOURL
#elif UITEST
    #define BASE_URL MOCK_URL
    #define SSO_URL SANDBOX_SSOURL
#else
    #define BASE_URL CN_MOIBLE_SANDBOX
    #define SSO_URL SANDBOX_SSOURL
#endif

#endif
