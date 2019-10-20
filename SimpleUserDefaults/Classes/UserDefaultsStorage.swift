/*
 MIT License

 Copyright (c) 2019 Sagar Dagdu

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */
//
//  UserDefaultsStorage.swift
//  SimpleUserDefaults
//
//  Created by Sagar Dagdu on 10/20/19.
//  Copyright © 2019 Sagar Dagdu. All rights reserved.
//

import UIKit


/// This class is Property Wrapper and is ia helper for storing data in UserDefaults.
@propertyWrapper
public class UserDefaultsStorage<T: Codable> {
    private var key: String
    private var userDefaults: UserDefaults
    
    public init(key: String, userDefaults: UserDefaults = UserDefaults.standard) {
        self.key = key
        self.userDefaults = userDefaults
    }
    
    public var wrappedValue: T? {
        get {
            guard let data = userDefaults.object(forKey: key) as? Data else {
                return nil
            }
            
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value
        }
        
        set {
            let data = try? JSONEncoder().encode(newValue)
            userDefaults.set(data, forKey: key)
        }
    }
}

