//
//  Expense.swift
//  Expenses
//
//  Created by Frank Mathy on 26.11.17.
//  Copyright © 2017 Frank Mathy. All rights reserved.
//

import Foundation
import Firebase
import os.log

class Expense {
    var key: String
    var date: Date
    var category: NamedItem
    var account: Account
    var project: Project
    var amount: Float
    var comment: String
    
    //MARK: Types
    struct PropertyKey {
        static let key = "key"
        static let date = "date"
        static let category = "category"
        static let account = "account"
        static let project = "project"
        static let amount = "amount"
        static let comment = "comment"
    }
    
    init(date: Date, category: NamedItem, account: Account, project: Project, amount: Float, comment: String) {
        self.key = ""
        self.date = date
        self.amount = amount
        self.category = category
        self.account = account
        self.project = project
        self.comment = comment
    }
    
    init(snapshot: DataSnapshot) {
        self.key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        self.date = Date(timeIntervalSince1970: snapshotValue[PropertyKey.date] as! Double)
        self.category = NamedItem(name: snapshotValue[PropertyKey.category] as! String)!
        self.account = Account(name: snapshotValue[PropertyKey.account] as! String)!
        self.project = Project(name: snapshotValue[PropertyKey.project] as! String)!
        self.amount = snapshotValue[PropertyKey.amount] as! Float
        self.comment = snapshotValue[PropertyKey.comment] as! String
    }
    
    convenience init(byExpense expense: Expense) {
        self.init(date: expense.date, category: expense.category, account: expense.account, project: expense.project, amount: expense.amount, comment: "")
    }
    
    func toAnyObject() -> Any {
    return [
            PropertyKey.date: date.timeIntervalSince1970,
            PropertyKey.amount: amount,
            PropertyKey.category: category.name,
            PropertyKey.account: account.name,
            PropertyKey.project: project.name,
            PropertyKey.comment: comment
        ]
    }

    
}
