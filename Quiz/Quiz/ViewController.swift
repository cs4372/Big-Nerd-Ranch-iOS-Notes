//
//  ViewController.swift
//  Quiz
//
//  Created by Catherine Shing on 12/23/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressBar.progress = 0
        questionNumber.text = "Question \(currentQuestionIndex+1)"
    }

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var questionNumber: UILabel!
    
    let questions: [String] = [
           "What is 7+7?",
           "What is the capital of Vermont?",
           "What is cognac made from?",
           "What is the name of the longest river in South America?",
           "Where is the Great Barrier Reef located?",
           "What does Na stand for on the periodic table?"
    ]
    let answers: [String] = [
           "14",
           "Montpelier",
           "Grapes",
           "Amazon River",
           "Australia",
           "Sodium"
    ]
    var currentQuestionIndex = 0
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        let progressUnits = Float(1)/Float(questions.count)
        currentQuestionIndex+=1
        questionNumber.text = "Question \(currentQuestionIndex+1)"
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = -1
        } else{
            let currQuestion = questions[currentQuestionIndex]
            questionLabel.text = currQuestion
        }
        if progressBar.progress < 1 {
            progressBar.progress += progressUnits
        } else {
            progressBar.progress = 0
        }

    }
    @IBAction func showAnswer(_ sender: UIButton) {
        let currAnswer = answers[currentQuestionIndex]
        answerLabel.text = currAnswer
    }
}

