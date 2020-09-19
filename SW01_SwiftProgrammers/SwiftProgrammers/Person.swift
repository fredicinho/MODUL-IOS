//
//  Person.swift
//  SwiftProgrammers
//
//  Created by Frederico on 18.09.20.
//

import Foundation


class Person {
    var firstName : String
    var lastName : String
    var plz : Int
    
    init(firstName: String, lastName: String, plz: Int) {
        self.lastName = lastName
        self.firstName = firstName
        self.plz = plz
    }
    
    class func createPersons(_ count: Int) -> [Person] {
        var persons: [Person] = []
        var counter = 1111
        while persons.count < count {
            persons.append(Person(firstName: "Hans", lastName: "Ueli", plz: counter))
            counter += 100
        }
        return persons
    }
    
}
