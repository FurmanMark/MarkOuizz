import UIKit

struct Question {
    let rightAnswer: Int
    let answers: [String]
    let question: String
    let level: LevelChoose
}

enum LevelChoose {
    case junior
    case middle
    case senior
}

final class MOK {
    
    static private let storage: [Question] = [
    Question(rightAnswer: 2, answers: ["Марс", "Земля", "Венера", "Юпитер"],
                 question: "Какая планета является третьей от Солнца?", level: .junior),
    Question(rightAnswer: 2, answers: ["3", "4", "5", "6"],
                 question: "Сколько будет 2 + 2?", level: .junior),
    Question(rightAnswer: 1, answers: ["Зеленый", "Фиолетовый", "Красный", "Оранжевый"],
                 question: "Какой цвет образуется при смешивании синего и желтого?", level: .junior),
    Question(rightAnswer: 3, answers: ["Собака", "Кошка", "Корова", "Слон"],
                 question: "Какое животное дает молоко?", level: .junior),
    Question(rightAnswer: 1, answers: ["Франция", "Италия", "Испания", "Германия"],
                 question: "В какой стране находится Париж?", level: .junior),

        // Middle level questions
    Question(rightAnswer: 4, answers: ["Десятичная", "Восьмеричная", "Шестнадцатеричная", "Двоичная"],
                     question: "Как называется система счисления, используемая компьютерами?", level: .middle),
    Question(rightAnswer: 3, answers: ["Ф. М. Достоевский", "А. С. Пушкин", "Л. Н. Толстой", "И. С. Тургенев"], question: "Кто написал 'Войну и мир'?", level: .middle),
    Question(rightAnswer: 3, answers: ["Java", "C++", "Swift", "Python"], question: "Какой язык программирования создан для разработки iOS-приложений?", level: .middle),
    Question(rightAnswer: 1, answers: ["Функция", "Класс", "Переменная", "Объект"], question: "Что является базовой единицей кода в Swift?", level: .middle),
    Question(rightAnswer: 2, answers: ["Hypertext Markup Language", "Hypertext Transfer Protocol", "Hotmail", "Hardware"], question: "Что означает аббревиатура HTTP?", level: .middle),

            // Senior level questions
    Question(rightAnswer: 2, answers: ["O(n)", "O(log n)", "O(n log n)", "O(1)"], question: "Какова временная сложность бинарного поиска?", level: .senior),
    Question(rightAnswer: 1, answers: ["MVC", "Factory", "Builder", "Adapter"], question: "Как называется паттерн проектирования, позволяющий отделить объект от его представления?", level: .senior),
    Question(rightAnswer: 4, answers: ["O(n)", "O(n^2)", "O(log n)", "O(n log n)"], question: "Какова временная сложность сортировки слиянием?", level: .senior),
    Question(rightAnswer: 3, answers: ["DRY", "KISS", "SOLID", "YAGNI"], question: "Какие принципы проектирования представляют собой аббревиатуру для пяти принципов ООП?", level: .senior),
    Question(rightAnswer: 1, answers: ["LINQ", "SQL", "NoSQL", "XML"], question: "Какой инструмент используется в .NET для обработки запросов к данным в функциональном стиле?", level: .senior)
        ]
    
    static func getQuestions(level: LevelChoose) -> [Question] {
        return storage.filter({$0.level == level})
    }
    
}


