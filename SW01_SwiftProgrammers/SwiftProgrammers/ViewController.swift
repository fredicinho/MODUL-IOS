//
//  ViewController.swift
//  SwiftProgrammers
//
//  Created by Frederico on 17.09.20.
//

import UIKit

class ViewController: UIViewController {
    
    var usePersonData: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        let screenSize: CGRect = UIScreen.main.bounds
        let startLabel = UILabel(frame: CGRect(x: 0, y: 20, width: self.view.frame.size.width, height: 50))
        startLabel.textAlignment = .center
        startLabel.text = "SwiftProgrammers"
        self.view.addSubview(startLabel)
        
        let dataProvider = DataProvider.getSharedInstance()
        if self.usePersonData {
            let nameStep = Int((screenSize.height - 20) / (CGFloat(dataProvider.memberPersons.count) + 1))
            var positionCounter = nameStep + 20
            for person in dataProvider.memberPersons {
                addPersonLabel(person: person, position: positionCounter)
                positionCounter += nameStep
            }
        } else {
            let nameStep = Int(screenSize.height / CGFloat(dataProvider.memberNames.count))
            var positionCounter = nameStep - 30
            var oddEvenFlag = true
            var colourFlag = 0
            for name in dataProvider.memberNames {
                addNameLabel(name: name, position: positionCounter, oddEven: oddEvenFlag, colourFlag: colourFlag)
                positionCounter += nameStep
                oddEvenFlag = oddEvenFlag ? false : true
                colourFlag += 1
                colourFlag = colourFlag % 3
            }
        }

    }
    
    func addPersonLabel(person: Person, position: Int) {
        var labels: [UILabel] = []
        let labelFirstname = UILabel(frame: CGRect(x: 40, y: position, width: 100, height: 30))
        labelFirstname.text = person.firstName
        labels.append(labelFirstname)
        let labelLastname = UILabel(frame: CGRect(x: 100, y: position, width: 100, height: 30))
        labelLastname.text = person.lastName
        labels.append(labelLastname)
        let labelPlz = UILabel(frame: CGRect(x: 140, y: position, width: 100, height: 30))
        labelPlz.text = String(person.plz)
        labels.append(labelPlz)
        for label in labels {
            self.view.addSubview(label)
        }
    }
    
    
    func triggerPersonData(personTrigger: Bool) {
        self.usePersonData = personTrigger
    }
    
    
    func addNameLabel(name: String, position: Int, oddEven: Bool, colourFlag: Int) {
        var label: UILabel
        if oddEven {
            label = UILabel(frame: CGRect(x: 10, y: position, width: 100, height: 30))
            label.text = name
        } else {
            label = UILabel(frame: CGRect(x: Int(self.view.frame.size.width - 60), y: position, width: 100, height: 30))
            label.text = name
        }
        switch colourFlag {
        case 0:
            label.textColor = UIColor.red
        case 1:
            label.textColor = UIColor.orange
        default:
            label.textColor = UIColor.green
        }
        self.view.addSubview(label)
    }
}

