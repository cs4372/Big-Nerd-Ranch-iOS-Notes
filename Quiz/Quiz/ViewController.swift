//
//  ViewController.swift
//  Quiz
//
//  Created by Catherine Shing on 12/23/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Set the label's initial alpha
        nextQuestionLabel.alpha = 0
        animateLabelTransitions()
        currentQuestionLabel.text = questions[currentQuestionIndex]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        quizReset()
    }
    
    func quizReset() {
        progressBar.progress = 0
        currentQuestionLabel.text = questions[currentQuestionIndex]
        currentQuestionLabel.text = "Question \(currentQuestionIndex+1)"
    }

//    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var questionNumber: UILabel!
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
    
    var questions: [String] = [
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
    var progressUnits: Float {
        get {
            return Float(1)/Float(questions.count-1)
        }
    }
    var currentQuestionIndex = 0
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex+=1
        progressBar.progress += progressUnits

        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
            progressBar.progress = 0
        }
        questionNumber.text = "Question \(currentQuestionIndex+1)"
        answerLabel.text = "???"
        let question = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        animateLabelTransitions()

    }
    @IBAction func showAnswer(_ sender: UIButton) {
        let currAnswer = answers[currentQuestionIndex]
        answerLabel.text = currAnswer
    }
    
    func animateLabelTransitions() {
        // Animate the alpha
        UIView.animate(withDuration: 0.5, animations: {
            self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1
        })
    }
}
