//
//  ViewController.swift
//  QuizApp
//
//  Created by Erika Carlson on 9/3/18.
//  Copyright © 2018 Erika Carlson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    var quiz: [Question] = []
    var currentQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startQuiz()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func startQuiz() {
        buildQuiz()
        displayQuestion()
    }
    
    func displayQuestion() {
        self.questionLabel.text = quiz[currentQuestion].question
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        self.answerLabel.text = quiz[currentQuestion].answer
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        if currentQuestion < quiz.count-1 {
            currentQuestion+=1
            displayQuestion()
        } else {
            endQuiz()
        }
    }
    
    func endQuiz() {
        let alert = constructAlert(title: "Quiz Ended", message: "You've finished the quiz!", style: .alert)
        present(alert, animated: true)
    }
    
    func constructAlert(title: String, message: String, style: UIAlertControllerStyle) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        constructAndAddAction(title: "OK!", style: .default, alert: alert)
        return alert
    }
    
    func constructAndAddAction(title: String, style: UIAlertActionStyle, alert: UIAlertController) {
        let action = UIAlertAction(title: title, style: style)
        alert.addAction(action)
    }
    
    func buildQuiz() {
        
        let bank = QuestionBank()
        
        for item in bank.questions {
            let newQuestion = Question(question: item.key, answer: item.value)
            quiz.append(newQuestion)
        }
    }
}
