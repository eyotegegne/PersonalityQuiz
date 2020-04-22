//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Tegegne, Eyobed  on 2/15/18.
//  Copyright © 2018 Eyobed Tutorial. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var responses: [Answer]!

    @IBOutlet weak var resultDescriptionLabel: UILabel!
    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func calculatePersonalityResult() {
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        let responseTypes = responses.map {$0.type}
        
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
      
//        let frequentAsnwersSorted = frequencyOfAnswers.sorted(by: {(pair1, pair2) -> Bool in return pair1.value > pair2.value})
//        let mostCommonAnswer = frequentAsnwersSorted.first!.key
        
        let mostCommonAnswer = frequencyOfAnswers.sorted {$0.1 > $1.1}.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDescriptionLabel.text = mostCommonAnswer.definition
        resultAnswerLabel.textColor = UIColor.darkGray
        
    }
}
