import UIKit

extension UIColor {
    // Создание цвета из шестнадцатеричной строки
    convenience init?(hex: String) {
        // Удаляем пробелы и символы новой строки
        var cleanedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        // Убираем префикс "#" если он есть
        if cleanedHex.hasPrefix("#") {
            cleanedHex.removeFirst()
        }
        
        // HEX-код должен быть длиной 6 символов (например, "296FAC")
        guard cleanedHex.count == 6 else { return nil }
        
        // Разделяем HEX на RGB компоненты
        var rgbValue: UInt64 = 0
        Scanner(string: cleanedHex).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        // Инициализируем UIColor с RGB компонентами
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
}


