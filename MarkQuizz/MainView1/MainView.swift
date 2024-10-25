import UIKit

protocol MainViewDelegate: AnyObject {
    func getLevel(level: Level)
}

enum Level: String {
    case junior
    case middle
    case senior
}

class MainView: UIView {
    
    private weak var delegate: MainViewDelegate?
    
    init(delegate: MainViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        backgroundColor = .blue
        configSubview()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Создание UI-компонентов
    private lazy var backGroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "296FAC")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var labelWelcome: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Добро пожаловать на СИГМА КВИЗ"
        label.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
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
        label.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        label.textColor = .white
        return label
    }()

    // Кнопки выбора уровня
    private lazy var buttonJunior: UIButton = createButton(title: "JUNIOR", tag: 1, backgroundColor: .green)
    private lazy var buttonMiddle: UIButton = createButton(title: "MIDDLE", tag: 2, backgroundColor: .yellow)
    private lazy var buttonSenior: UIButton = createButton(title: "SENIOR", tag: 3, backgroundColor: .red)

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

    // Обработчик нажатий кнопок
    @objc func buttonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            delegate?.getLevel(level: .junior)
        case 2:
            delegate?.getLevel(level: .middle)
        case 3:
            delegate?.getLevel(level: .senior)
        default:
            break
        }
    }

    private func configSubview() {
        addSubview(backGroundView)
        addSubview(labelWelcome)
        addSubview(textDescriptions)
        addSubview(buttonJunior)
        addSubview(buttonMiddle)
        addSubview(buttonSenior)
    }

    private func layout() {
        NSLayoutConstraint.activate([
            backGroundView.topAnchor.constraint(equalTo: topAnchor),
            backGroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backGroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backGroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            labelWelcome.topAnchor.constraint(equalTo: topAnchor, constant: 230),
            labelWelcome.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelWelcome.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            labelWelcome.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            textDescriptions.topAnchor.constraint(equalTo: labelWelcome.bottomAnchor, constant: 140),
            textDescriptions.centerXAnchor.constraint(equalTo: labelWelcome.centerXAnchor),
            
            buttonJunior.topAnchor.constraint(equalTo: textDescriptions.bottomAnchor, constant: 40),
            buttonJunior.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            buttonJunior.widthAnchor.constraint(equalToConstant: 120),
            buttonJunior.heightAnchor.constraint(equalToConstant: 100),
            
            buttonMiddle.topAnchor.constraint(equalTo: textDescriptions.bottomAnchor, constant: 40),
            buttonMiddle.centerXAnchor.constraint(equalTo: textDescriptions.centerXAnchor),
            buttonMiddle.widthAnchor.constraint(equalToConstant: 120),
            buttonMiddle.heightAnchor.constraint(equalToConstant: 100),
            
            buttonSenior.topAnchor.constraint(equalTo: textDescriptions.bottomAnchor, constant: 40),
            buttonSenior.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            buttonSenior.widthAnchor.constraint(equalToConstant: 120),
            buttonSenior.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

enum Text {
    static let dicription = "Выбери уровень сложности"
}
