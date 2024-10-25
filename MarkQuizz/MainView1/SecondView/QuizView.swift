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
    
    private var textLevel = 1
    
    
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
        label.text = "level: \(question.level)\nВопрос №\(textLevel)"
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
        label.font = UIFont.systemFont(ofSize: 24, weight:.heavy)
        label.text = Text.dicription
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 4
        label.widthAnchor.constraint(equalToConstant: 300).isActive = true
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
        
        super.init(frame: .zero)
        backgroundColor = .blue
        configSubview()
        layout()
        initQuestion()
    }
    
    private func updateQuestionLabel() {
        labelWelcome.text = "level: \(question.level)\nВопрос №\(textLevel)"
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
        button.titleLabel?.numberOfLines = 2
        button.layer.cornerRadius = 20.0
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 350).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.backgroundColor = backgroundColor.withAlphaComponent(0.7)
        button.tintColor = .yellow
        button.tag = tag
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
               return button
    }

    @objc private func buttonTapped(_ sender: UIButton) {
        //delegate?.didSelectAnswer(tag: sender.tag)
        if sender.tag == self.question.rightAnswer {
            print("ПРАВИЛЬНО")
            countRight += 1
        } else {
            print("НЕПРАВИЛЬНО")
        }
        textLevel += 1
        updateQuestionLabel()
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
            buttonOne.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            buttonTwo.topAnchor.constraint(equalTo: buttonOne.bottomAnchor, constant: 20),
            buttonTwo.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            buttonThree.topAnchor.constraint(equalTo: buttonTwo.bottomAnchor, constant: 20),
            buttonThree.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            buttonFour.topAnchor.constraint(equalTo: buttonThree.bottomAnchor, constant: 20),
            buttonFour.centerXAnchor.constraint(equalTo: centerXAnchor),
            ])
        }
}
