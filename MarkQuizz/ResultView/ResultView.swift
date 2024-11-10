import UIKit

class ResultView: UIView {
    
    var delegate: CountRightAnswers?
    var correctAnswerCount: Int = 0
    
    private var dimmedView: UIView!
    private var resultsView: UIView!
    
    private var backButton: UIButton!
    
       
    init(delegate: CountRightAnswers? = nil, countRight: Int) {
        self.delegate = delegate
        self.correctAnswerCount = countRight
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
       
    private func setupView() {
        // Создаем затемняющий слой
        dimmedView = UIView(frame: bounds)
        dimmedView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dimmedView)
        
        // Создаем вью с результатами
        resultsView = UIView()
        resultsView.backgroundColor = .white
        resultsView.layer.cornerRadius = 12
        resultsView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(resultsView)
        
        // Настраиваем констрейнты для затемняющего слоя и вью с результатами
        NSLayoutConstraint.activate([
            dimmedView.topAnchor.constraint(equalTo: topAnchor),
            dimmedView.bottomAnchor.constraint(equalTo: bottomAnchor),
            dimmedView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dimmedView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            resultsView.centerXAnchor.constraint(equalTo: centerXAnchor),
            resultsView.centerYAnchor.constraint(equalTo: centerYAnchor),
            resultsView.widthAnchor.constraint(equalToConstant: 300),
            resultsView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        // Добавляем контент для отображения результатов
        let label = UILabel()
        label.text = "Ваш результат: \(correctAnswerCount) из 5"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        resultsView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: resultsView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: resultsView.centerYAnchor)
        ])
        
        // Начальные значения прозрачности
        dimmedView.alpha = 1
        resultsView.alpha = 1
    }

    func showResultsView() {
        // Анимация появления
        UIView.animate(withDuration: 0.3) {
            self.dimmedView.alpha = 1
            self.resultsView.alpha = 1
        }
    }

    func hideResultsView() {
        // Анимация исчезновения
        UIView.animate(withDuration: 0.3, animations: {
            self.dimmedView.alpha = 0
            self.resultsView.alpha = 0
        }) { _ in
            // Удаление из иерархии
            self.removeFromSuperview()
        }
    }
    
    func didUpdateCorrectAnswerCount(_ countRight: Int) {
        self.correctAnswerCount = countRight
        print("Количество правильных ответов: \(correctAnswerCount)")
    }
}
