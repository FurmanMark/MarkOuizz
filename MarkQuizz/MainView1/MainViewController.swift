import UIKit

class MainViewController: UIViewController, MainViewDelegate {

    // Ленивая инициализация MainView с передачей делегата
    private lazy var mainView: MainView = {
        let view = MainView(delegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configSubview()
        layout()
    }

    // Метод делегата для обработки выбранного уровня
    func getLevel(level: Level) {
        let quizLevel = convertToLevelChoose(level: level)
        navigationController?.pushViewController(QuizViewController(level: quizLevel), animated: true)
    }

    // Конфигурация subview
    private func configSubview() {
        view.addSubview(mainView)
    }

    // Установка layout для mainView
    private func layout() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }

    // Метод конвертации Level в LevelChoose
    private func convertToLevelChoose(level: Level) -> LevelChoose {
        switch level {
        case .junior:
            return .junior
        case .middle:
            return .middle
        case .senior:
            return .senior
        }
    }
}


