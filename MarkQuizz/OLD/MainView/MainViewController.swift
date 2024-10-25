import UIKit

//

// хз для чего
protocol MainControllerProtocol: AnyObject {
    func startQuiz(config: MainView.Configuration)
}

class MainViewController: UIViewController {

    //СВОЙСТВА
    
    
    //Вход в приложение?
    private lazy var mainView: MainView = {
        let view = MainView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //ВивДидЛоад - первоначальная настройка интерфейса
    override func viewDidLoad() {
        super.viewDidLoad()
        configSubview()
        layout()
    }
    
    
    // Добавляем
    private func configSubview() {
        view.addSubview(mainView)
    }
    
    // настраиваем лейауты
    private func layout() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
    // метод перехода на экран
    func goTo() {
        let controller = PlayerGameViewController()
        navigationController?.pushViewController(controller, animated: true)
        
    }
}
    // расширение для главного экрана чтобы сделать переход на другой экран
extension MainViewController: MainControllerProtocol {
    func startQuiz(config: MainView.Configuration) {
        print("Start quiz with level \(config.level)")
        goTo()
    }
    
}

