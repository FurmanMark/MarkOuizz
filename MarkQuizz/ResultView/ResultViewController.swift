import UIKit

class ResultViewController: UIViewController, CountRightAnswers {
    let countRight: Int
    
    private lazy var resultView: ResultView = {
        let view = ResultView(delegate: self, countRight: self.countRight)
        view.translatesAutoresizingMaskIntoConstraints = false
        self.preferredContentSize = CGSize(width: 300, height: 200)
        return view
        
    }()
    init(countRight: Int) {
        self.countRight = countRight
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configSubview()
        layout()
        navigationController?.navigationBar.isHidden = true
    }
    
    private func configSubview() {
        view.addSubview(resultView)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            resultView.topAnchor.constraint(equalTo: view.topAnchor),
            resultView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            resultView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resultView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    func didUpdateCorrectAnswerCount(_ countRight: Int) {
        print("Количество правильных ответов в контроллере: \(countRight)")
        // Здесь можно обновить UI в resultView с новым значением countRight
    }
}
