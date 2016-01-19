//
//  ErrorConst.h
//  tradeshiftHome
//
//  Created by taq on 6/10/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#ifndef tradeshiftHome_ErrorConst_h
#define tradeshiftHome_ErrorConst_h

#define ERR_MAKE(code_, desc_)      [NSError errorWithDomain:@"clientErrDomain" code:(code_) userInfo:@{NSLocalizedDescriptionKey:(desc_ ? desc_ : @"")}]

typedef NS_ENUM(NSInteger, eCommonErrorCode) {
    eCommonError                = 10000,
    eBussinessError             = 10001,
    eBadDataError               = 10002,
    eInvalidInputError          = 10003,
};

#endif
