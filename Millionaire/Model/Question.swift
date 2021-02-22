//
//  Question.swift
//  Millionaire
//
//  Created by Константин Кузнецов on 18.02.2021.
//

import UIKit

struct Question {
    let question: String
    let answers: [String]
    let correctAnswer: Int
    
    static var getQuestions: [Question] {
        var questions = [Question]()
        questions.append(Question(question: "Откуда сотрудники офисов наливают в чашки воду?",
                                 answers: ["из принтера","из сканера","из степлера","из кулера"],
                                 correctAnswer: 3))
        questions.append(Question(question: "Что построил Джек в стихотворении, переведенным с английского Маршаком?",
                                 answers: ["маршрут","график","дом","коммунизм"],
                                 correctAnswer: 2))
        questions.append(Question(question: "Что может возникнуть на шахматной доске?",
                                 answers: ["вечный шах","вечный мат","вечный зов","вечный двигатель"],
                                 correctAnswer: 0))
        questions.append(Question(question: "Какие мужчины, согласно этикету, не обязаны идти слева от дамы?",
                                 answers: ["высокие","пожилые","иногородние","военнослужащие"],
                                 correctAnswer: 3))
        questions.append(Question(question: "Что такое каршеринг?",
                                 answers: ["секонд-хенд","напольный светильник","брачный танец вороны","аренда автомобиля"],
                                 correctAnswer: 3))
        questions.append(Question(question: "Какую песню распевает при народе белочка в “Сказке о царе Салтане”?",
                                 answers: ["“Во поле береза стояла”","“Во кузнице”","“Во саду ли, в огороде”","“Вот кто-то с горочки спустился”"],
                                 correctAnswer: 2))
        questions.append(Question(question: "Кто “помогал” делать записи в судовом журнале плота “Кон-Тики” Тура Хейердала?",
                                 answers: ["чайки","каракатицы","дельфины","крысы"],
                                 correctAnswer: 1))
        questions.append(Question(question: "Какой возможности лишен крупье казино?",
                                 answers: ["пригладить рукой волосы","снять пылинку с жилета","поправить галстук","достать платок из кармана"],
                                 correctAnswer: 3))
        questions.append(Question(question: "В каком кинофильме нет сцены на экзамене?",
                                 answers: ["“Доживем до понедельника”","“Операция “Ы”…”","“Старик Хоттабыч”","“Большая перемена”"],
                                 correctAnswer: 0))
        questions.append(Question(question: "Что отсутствует в конструкции всех дворцов Запретного города китайских императоров?",
                                 answers: ["двери","лестницы","окна","печные трубы"],
                                 correctAnswer: 3))
        return questions
    }
    
}
