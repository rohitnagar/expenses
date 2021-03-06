//
//  Account.swift
//  Expenses
//
//  Created by Frank Mathy on 24.02.18.
//  Copyright © 2018 Frank Mathy. All rights reserved.
//

import Foundation
import CloudKit

class CKAccount {
    static let RecordTypeName = "Account"
    
    struct ColumnKey {
        static let accountName = "accountName"
    }
    
    var record : CKRecord
    
    var accountName: String {
        get {
            return record[ColumnKey.accountName] as! String
        }
        
        set(accountName) {
            record[ColumnKey.accountName] = accountName as CKRecordValue
        }
    }
    
    var creatorUserRecordID : String? {
        guard let userRecordId = record.creatorUserRecordID else {
            return nil
        }
        return userRecordId.recordName
    }
    
    var creationDate : Date? {
        return record.creationDate
    }
    
    var lastModifiedUserRecordID : String? {
        guard let userRecordId = record.lastModifiedUserRecordID else {
            return nil
        }
        return userRecordId.recordName
    }
    
    var modificationDate : Date? {
        return record.modificationDate
    }
    
    init(accountName: String) {
        record = CKRecord(recordType: CKAccount.RecordTypeName)
        self.accountName = accountName
    }
    
    init(asNew record: CKRecord) {
        self.record = record
    }
    
    init(asCopy account: CKAccount) {
        record = account.record.copy() as! CKRecord
    }
    
    func updateFromOtherAccount(other : CKAccount) {
        accountName = other.accountName
    }
}
