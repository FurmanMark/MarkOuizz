import UIKit

class PlayerGameViewController: UIViewController {

    // Лейбл для отображения текущего вопроса
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = "Вопрос..."
        return label
    }()
    
    // Массив кнопок для отображения вариантов ответов
    private var answerButtons: [UIButton] = []

    // Лейбл для отображения номера текущего вопроса
    private lazy var questionNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Вопрос 1 из 5"
        return label
    }()
    
    // Логика квиза
    private let quizLogic = QuizLogic()
    
       // Массив вопросов и ответов (должен быть переопределен в подклассах)
       var questions: [(question: String, answers: [String])] = []
       private var currentQuestionIndex: Int = 0
       
    
    // Настройка интерфейса при загрузке
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        loadNextQuestion()
    }
    
    // Настройка элементов UI
    private func setupView() {
        view.addSubview(questionNumberLabel)
        view.addSubview(questionLabel)

        // Добавляем кнопки для ответов
        for i in 0..<4 {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Ответ \(i + 1)", for: .normal)
            button.tag = i
            button.backgroundColor = .systemBlue
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 8
            button.addTarget(self, action: #selector(answerTapped(_:)), for: .touchUpInside)
            answerButtons.append(button)
            view.addSubview(button)
        }
        
        layout()
    }
    
    // Устанавливаем лейауты
    private func layout() {
        NSLayoutConstraint.activate([
            questionNumberLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            questionNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            questionLabel.topAnchor.constraint(equalTo: questionNumberLabel.bottomAnchor, constant: 20),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            answerButtons[0].topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 30),
            answerButtons[0].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            answerButtons[0].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            answerButtons[0].heightAnchor.constraint(equalToConstant: 50),
            
            answerButtons[1].topAnchor.constraint(equalTo: answerButtons[0].bottomAnchor, constant: 10),
            answerButtons[1].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            answerButtons[1].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            answerButtons[1].heightAnchor.constraint(equalToConstant: 50),
            
            answerButtons[2].topAnchor.constraint(equalTo: answerButtons[1].bottomAnchor, constant: 10),
            answerButtons[2].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            answerButtons[2].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            answerButtons[2].heightAnchor.constraint(equalToConstant: 50),
            
            answerButtons[3].topAnchor.constraint(equalTo: answerButtons[2].bottomAnchor, constant: 10),
            answerButtons[3].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            answerButtons[3].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            answerButtons[3].heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    // Метод для обработки нажатия на кнопки ответа
    @objc private func answerTapped(_ sender: UIButton) {
        let isCorrect = quizLogic.checkAnswer(sender.tag)
        print(isCorrect ? "Правильный ответ!" : "Неправильный ответ!")
        
        // Переход к следующему вопросу
        if quizLogic.nextQuestion() {
            loadNextQuestion()
        } else {
            print("Квиз завершен!")
            navigationController?.popViewController(animated: true)
        }
    }
    
    // Метод для загрузки следующего вопроса
    private func loadNextQuestion() {
        let (question, answers) = quizLogic.getCurrentQuestion()
        questionLabel.text = question
        questionNumberLabel.text = "Вопрос \(quizLogic.getCurrentQuestionIndex() + 1) из 5"
        
        for (index, answer) in answers.enumerated() {
            answerButtons[index].setTitle(answer, for: .normal)
        }
    }
}
