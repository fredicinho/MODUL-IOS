//
//  DataProvider.swift
//  SwiftProgrammers
//
//  Created by Frederico on 17.09.20.
//

import Foundation

class DataProvider {
    static var dataProvider: DataProvider? = nil
    var memberNames:[String] = []
    var memberPersons:[Person] = []
    private init(_ names: [String], _ persons: [Person]) {
        for name in names {
            self.memberNames.append(name)
        }
        for person in persons {
            self.memberPersons.append(person)
        }
    }
    
    class func getSharedInstance() -> DataProvider {
        DataProvider.dataProvider ?? createDataProvider()
    }
    
    class func createDataProvider() -> DataProvider {
        let names: [String] = ["Anna", "Hans", "Ueli", "Jürg", "Sara", "Laura", "Yolo", "Sara", "Laura", "Yolo"]
        let dataProvider: DataProvider = DataProvider(names, Person.createPersons(10))
        return dataProvider
    }
}
