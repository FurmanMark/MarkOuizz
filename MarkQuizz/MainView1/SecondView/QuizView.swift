//
//  QuizView.swift
//  MarkQuizz
//
//  Created by Mark Furman on 05.10.2024.
//

import UIKit

protocol QuizViewDelegate: AnyObject {
    func didSelectAnswer()
}
    
class QuizView: UIView {
    
    private weak var delegate: QuizViewDelegate?
    
    private var question: Question
    
    private var countRight = 0
    
    //Создаем свойства элементов которые будут на этом вью
    private lazy var backGroundView: UIView = {
        let view = UIView()
        let color = UIColor(hex: "296FAC")
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        }()
    
    
    private lazy var labelWelcome: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Номер вопросa"
        label.font = UIFont.systemFont(ofSize: 30, weight:.heavy)
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var textDescriptions: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Text.dicription
        label.font = UIFont.systemFont(ofSize: 24, weight:.heavy)
        label.textColor = .white
        return label
    } ()
    
    // Кнопки выбора уровня
    private lazy var buttonOne: UIButton = createButton(title: "1", tag: 1, backgroundColor: .yellow)
    private lazy var buttonTwo: UIButton = createButton(title: "2", tag: 2, backgroundColor: .yellow)
    private lazy var buttonThree: UIButton = createButton(title: "3", tag: 3, backgroundColor: .yellow)
    private lazy var buttonFour: UIButton = createButton(title: "4", tag: 4, backgroundColor: .yellow)
    
    
    init(delegate: QuizViewDelegate, question: Question) {
        self.delegate = delegate
        self.question = question
        
        // почему тут инит не работает
        super.init(frame: .zero)
        backgroundColor = .blue
        configSubview()
        layout()
        initQuestion()
    }
    
    private func initQuestion() {
        buttonOne.setTitle(self.question.answers[0], for: .normal)
        buttonTwo.setTitle(self.question.answers[1], for: .normal)
        buttonThree.setTitle(self.question.answers[2], for: .normal)
        buttonFour.setTitle(self.question.answers[3], for: .normal)
        
        textDescriptions.text = self.question.question
    }
    
    
    private func createButton(title: String, tag: Int, backgroundColor: UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.white.withAlphaComponent(0.8).cgColor
        button.backgroundColor = backgroundColor.withAlphaComponent(0.7)
        button.layer.cornerRadius = 20.0
        button.layer.masksToBounds = true
        button.tag = tag
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
               return button
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        //delegate?.didSelectAnswer(tag: sender.tag)
        if sender.tag == self.question.rightAnswer {
            print("Right")
            countRight += 1
        } else {
            print("НЕПРАВИЛЬНО")
        }
        delegate?.didSelectAnswer()
       }
    
    init(delegate: QuizViewDelegate? = nil, question: Question) {
        self.delegate = delegate
        self.question = question
        super.init(frame: .zero)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setNewQuestion(_ question: Question) {
        self.question = question
        initQuestion()
    }
    
    private func configSubview() {
        addSubview(backGroundView)
        addSubview(labelWelcome)
        addSubview(textDescriptions)
        addSubview(buttonOne)
        addSubview(buttonTwo)
        addSubview(buttonThree)
        addSubview(buttonFour)
    }
    
    //РАЗМЕЩЕНИЕ
    private func layout() {
        NSLayoutConstraint.activate([
            backGroundView.topAnchor.constraint(equalTo: topAnchor),
            backGroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backGroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backGroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            labelWelcome.topAnchor.constraint(equalTo: topAnchor, constant: 130),
            labelWelcome.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            textDescriptions.topAnchor.constraint(equalTo: labelWelcome.bottomAnchor, constant: 130),
            textDescriptions.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            buttonOne.topAnchor.constraint(equalTo: textDescriptions.bottomAnchor, constant: 100),
            buttonOne.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor, constant: 30),
            
            buttonTwo.topAnchor.constraint(equalTo: textDescriptions.bottomAnchor, constant: 100),
            buttonTwo.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: -30),
            
            buttonThree.topAnchor.constraint(equalTo: buttonOne.bottomAnchor, constant: 100),
            buttonThree.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor, constant: 30),
            
            buttonFour.topAnchor.constraint(equalTo: buttonTwo.bottomAnchor, constant: 100),
            buttonFour.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: -30)
            ])
        }
}
