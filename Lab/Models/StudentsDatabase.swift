//
//  StudentsDatabase.swift
//  Lab
//
//  Created by Macbook Pro on 10/03/2020.
//  Copyright © 2020 Macbook Pro. All rights reserved.
//

import UIKit

class StudentsDatabase {
    
    var databaseToDisplay = [Student]()
    
    public func updateDataFromDatabase() {
        
        databaseToDisplay = database
        
    }
    
    init() {
        updateDataFromDatabase()
    }
    
    var database: [Student] = [

        Student(photo: #imageLiteral(resourceName: "UsmonMuradov"), birthData: "24.02.2001", averageScore: 3,
                name: "Усмон Мурадов", text: "Пахнет хуже,\nЗато входит туже...", identifier: "Usmon Muradov"),
        
        Student(photo: #imageLiteral(resourceName: "VladLi"), birthData: "24.02.2001", averageScore: 3,
                name: "Влад Ли", text: "В чем разница между картиной и Иисусом,\nКартине нужен всего один гвоздь.", identifier: "Vlad Li"),
        
        Student(photo: #imageLiteral(resourceName: "KudratIsmailov"), birthData: "24.02.2001", averageScore: 5,
                name: "Кудратбек Исмаилов", text: "Путин над нами, водка в кармане,\nЗемля под ногами, вперед россияне!", identifier: "Kudratbek Ismailov"),
        
        Student(photo: #imageLiteral(resourceName: "AishaSalimgerey"), birthData: "24.02.2001", averageScore: 3,
                name: "Айша Салимгерей", text: "Если твой доход меньше 300к, листай дальше.", identifier: "Aisha Salimgerey"),
        
        Student(photo: #imageLiteral(resourceName: "ArtemErmakov"), birthData: "24.02.2001", averageScore: 3,
                name: "Артем Ермаков", text: "Я сижу на лекции, у меня эрекция,\nЛектор улыбается, парта поднимается.", identifier: "Artem Ermakov"),
        
        Student(photo: #imageLiteral(resourceName: "EgorMelnikov"), birthData: "24.02.2001", averageScore: 5,
                name: "Егор Мельников", text: "Я живу как карта ляжет, \nТы живешь как мамка скажет.", identifier: "Egor Melnikov"),
        
        Student(photo: #imageLiteral(resourceName: "SergeyGurdumov"), birthData: "24.02.2001", averageScore: 4,
                name: "Сергей Гурдюмов", text: "Если ты без усиков, \nТо я без трусиков.", identifier: "Sergey Gurdumov"),
        
        Student(photo: #imageLiteral(resourceName: "DimaSamarkin"), birthData: "24.02.2001", averageScore: 3,
                name: "Дима Самаркин", text: "Делу время, потехе час,\nПиво, водочка и квас...", identifier: "Dima Samarkin"),
        
        Student(photo: #imageLiteral(resourceName: "HalimSatorzada"), birthData: "24.02.2001", averageScore: 3,
                name: "Халимджон Сатторзода", text: "Девушки как обои,\nЯ их клею, чтобы отодрать.", identifier: "Halimjon Sattorzada"),
        
        Student(photo: #imageLiteral(resourceName: "MirjalolYahshiboev"), birthData: "24.02.2001", averageScore: 3,
                name: "Мирджалол Яхшибоев", text: "Если мужчина просит руки женщины,\nЗначит своя устала.", identifier: "Mirjalol Yahshiboev"),
        
        Student(photo: #imageLiteral(resourceName: "KostyaSaenko"), birthData: "24.02.2001", averageScore: 2,
                name: "Костя Саенко", text: "На педалях пяточки, еду на девяточке.", identifier: "Kostya Saenko"),
        
        Student(photo: #imageLiteral(resourceName: "SalimMahmaduloev"), birthData: "24.02.2001", averageScore: 4,
                name: "Салим Махмадуллоев", text: "Лучший репетитор по английскому для вашего ребёнка.", identifier: "Salim Mahmadulloev"),
        
        Student(photo: #imageLiteral(resourceName: "ElenaSumenkova"), birthData: "24.02.2001", averageScore: 4,
                name: "Лена Суменкова", text: "Ссылка на фулл в описании.", identifier: "Lena Sumenkova"),
        
        Student(photo: #imageLiteral(resourceName: "VadimEremin"), birthData: "24.02.2001", averageScore: 4,
                name: "Вадим Еремин", text: "Только когда комар садится тебе на яйца, понимаешь,\nЧто можно решить вопрос без применения силы.", identifier: "Vadim Eremin")
    
    ]
    
}

struct Student {
    
    var photo: UIImage
    var birthData: String
    var averageScore: Int
    
    var name: String
    var text: String
    var identifier: String
    
}


























