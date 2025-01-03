import UIKit



class QuizViewController: UIViewController, QuizViewDelegate {
    func didSelectAnswer() {
        self.questions.removeFirst()
        if let first = self.questions.first {
            quizView.setNewQuestion(first)
        } else {
            print("QUIZ NO")
            navigationController?.pushViewController(ResultViewController(countRight: quizView.countRight), animated: true)
        }
    }
//MARK: Enums & Struct
    
//MARK: Properties public & private (And computed properties)
    private let level: LevelChoose
    private var questions: [Question]
    private lazy var quizView: QuizView = {
        let view = QuizView(delegate: self, question: self.questions[0])
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//MARK: Initializers
    init(level: LevelChoose) {
        self.level = level
        self.questions = MOK.getQuestions(level: self.level)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configSubview()
        layout()
        navigationController?.navigationBar.tintColor = .white
    }
//MARK: Delegates & Protocol

//MARK: Helper Methods

//MARK: Private Methods

    private func configSubview() {
        view.addSubview(quizView)
    }

    private func layout() {
        NSLayoutConstraint.activate([
            quizView.topAnchor.constraint(equalTo: view.topAnchor),
            quizView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            quizView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            quizView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    

}


