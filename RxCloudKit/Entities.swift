//
//  Entities.swift
//  RxCloudKit
//
//  Created by Maxim Volgin on 22/06/2017.
//  Copyright © 2017 Maxim Volgin. All rights reserved.
//

import RxSwift
import CloudKit

public protocol RxCKRecord {

    static var type: String { get }

//    var name: String { get }
//
//    var id: CKRecordID { get }
    
    init()

    init(name: String)

    init(record: CKRecord)
    
    func update(_ record: CKRecord)

//    func asCKRecord() -> CKRecord

}

private struct AssociatedKeys {
    static var record = "record"
}

public extension RxCKRecord {

//    var id: CKRecordID {
//        return CKRecordID(recordName: self.name)
//    }
//
    init() {
        let record = CKRecord(recordType: Self.type)
        self.init(record: record)
    }

    init(name: String) {
        let id = CKRecordID(recordName: name)
        let record = CKRecord(recordType: Self.type, recordID: id)
        self.init(record: record)
    }
    
//    init(record: CKRecord) {
//        self.record = record
//    }

    var record: CKRecord {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.record) as! CKRecord
        }

        set(value) {
            objc_setAssociatedObject(self, &AssociatedKeys.record, value, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

}

public protocol RxCKSubscription {


}

public extension RxCKSubscription {

}