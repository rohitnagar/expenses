//
//  SystemConfig.swift
//  Expenses
//
//  Created by Frank Mathy on 06.04.18.
//  Copyright © 2018 Frank Mathy. All rights reserved.
//

import Foundation

class SystemConfig {
    
    static let sharedInstance = SystemConfig()

    let userDefaults = UserDefaults.standard
    
    let KeyCurrencyCode = "CurrencyCode"
    let KeyCurrencySymbol = "CurrencySymbol"

    let KeyLastCategory = "LastCategory"
    let KeyLastProject = "LastProject"
    let KeyLastAccount = "LastAccount"

    var appCurrencyCode: String {
        get {
            var currencyCode = userDefaults.string(forKey: KeyCurrencyCode)
            if currencyCode == nil {
                let locale = NSLocale.current
                currencyCode = locale.currencyCode
                userDefaults.setValue(currencyCode, forKey: KeyCurrencyCode)
            }
            return currencyCode!
        }
    }
    
    var appCurrencySymbol: String {
        get {
            var currencySymbol = userDefaults.string(forKey: KeyCurrencySymbol)
            if currencySymbol == nil {
                let locale = NSLocale.current
                currencySymbol = locale.currencySymbol
                userDefaults.setValue(currencySymbol, forKey: KeyCurrencySymbol)
            }
            return currencySymbol!
        }
    }
    
    var lastCategory: String? {
        get {
            return userDefaults.string(forKey: KeyLastCategory)
        }
        
        set(category) {
            userDefaults.set(category, forKey: KeyLastCategory)
        }
    }
    
    var lastProject: String? {
        get {
            return userDefaults.string(forKey: KeyLastProject)
        }
        
        set(category) {
            userDefaults.set(category, forKey: KeyLastProject)
        }
    }
    
    var lastAccount: String? {
        get {
            return userDefaults.string(forKey: KeyLastAccount)
        }
        
        set(category) {
            userDefaults.set(category, forKey: KeyLastAccount)
        }
    }
}
