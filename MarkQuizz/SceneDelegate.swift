import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // Это главное окно приложения, которое управляет иерархией представлений. Все вьюшки будут добавляться в это окно.
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // 1.0 Проверяем, что сцена является UIWindowScene (то есть, что это сцена для отображения UI), и сохраняем её в sceneWindow.
        guard let sceneWindow = (scene as? UIWindowScene) else { return }
        
        // 1.2 Создаем главный контроллер (MainViewController), который будет первым экраном нашего приложения.
        let mainViewController = MainViewController()
        
        // Оборачиваем главный контроллер в UINavigationController, чтобы управлять переходами между экранами.
        let navigationController = UINavigationController(rootViewController: mainViewController)
        
        // 1.3 Создаем окно приложения и привязываем его к сцене (windowScene). Это окно будет контейнером для всех экранов.
        let window = UIWindow(windowScene: sceneWindow)
        
        // 1.4 Назначаем rootViewController для окна — это будет наш navigationController, управляющий главным экраном.
        window.rootViewController = navigationController
        
        // 1.5 Сохраняем окно в переменной класса, чтобы оно оставалось доступным, и делаем его видимым.
        self.window = window
        window.makeKeyAndVisible()
    }
}
