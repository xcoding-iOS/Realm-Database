//
//  ViewController.swift
//  Realm-Database
//
//  Created by Giuseppe Sapienza on 03/04/2019.
//  Copyright © 2019 Giuseppe Sapienza. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("🤖 Realm:", Realm.Configuration.defaultConfiguration.fileURL ?? "")
        
        //self.createUser(name: "Giuseppe", surname: "Sapienza", age: 25)
        //_ = self.getUser()
        
        //self.editUser(name: "Luca", surname: "Sapienza", age: 26)
        //self.getUser()
        
        /*
        let preferences = Preferences.init()
        preferences.darkMode = true
        
        self.addPreferences(preferences)
        */
        
        //self.setDarkMode(false)
        
        /*
        self.addNote(title: "Nota 1", text: "Text 1", date: Date.init())
        self.addNote(title: "Nota 2", text: "Text 2", date: Date.init())
        self.addNote(title: "Nota 3", text: "Text 3", date: Date.init())
        */
        
        //self.searchNote(byTitle: "Vieni in Sicilia")
        //self.searchNote(byTitle: "AAAAA AAAAA")
        
        //self.searchNote(titleContains: "iOS", textContains: "iPhone")
        
    }
    
    func searchNote(byTitle: String) {
        print("🤖 Realm Search Note by Title")
        let realm = try! Realm.init()
        
        let results = realm.objects(Note.self).filter(" title == '\(byTitle)' ")
        
        for note in results {
            print(note.title!, note.text!)
        }
    }
    
    func searchNote(titleContains: String, textContains: String) {
        print("🤖 Realm Search Note by Title and Text")
        let realm = try! Realm.init()
        
        let results = realm.objects(Note.self).filter(" title CONTAINS '\(titleContains)' AND text CONTAINS '\(textContains)' ")
        
        for note in results {
            print(note.title!, note.text!)
        }
    }
    
    func addNote(title: String, text: String, date: Date) {
        let note = Note.init()
        note.title = title
        note.text = text
        note.date = date
        
        guard let user = self.getUser() else { return }
        
        let realm = try! Realm.init()
        
        try! realm.write({
            print("🤖 Realm add note \(title) \(text) \(date)")
            user.note.append(note)
        })
        
    }
    
    func setDarkMode(_ value: Bool) {
        guard let user = self.getUser() else { return }
        
        let realm = try! Realm.init()
        
        try! realm.write({
            user.preferences?.darkMode = value
        })
    }
    
    func addPreferences(_ new: Preferences) {
        guard let user = self.getUser() else { return }
        
        let realm = try! Realm.init()
        
        try! realm.write {
            print("🤖 Realm add Preferences")
            user.preferences = new
        }
        
    }
    
    func createUser(name: String, surname: String, age: Int) {
        let realm = try! Realm.init()
        
        let user = User.init()
        user.name = name
        user.surname = surname
        user.age = age
        
        try! realm.write {
            print("🤖 Realm add User \(name) \(surname) \(age)")
            realm.add(user)
        }
    }
    
    func getUser() -> User? {
        let realm = try! Realm.init()
        let results = realm.objects(User.self)
        
        /*
         for user in results {
         print(🤖 user.name ?? "", user.surname ?? "")
         }
         */
        
        guard !results.isEmpty else { return nil }
        
        print("🤖 \(results[0].name ?? "") \(results[0].surname ?? "") \(results[0].age)")
        
        return results[0]
        
    }
    
    
    func editUser(name: String, surname: String, age: Int) {
        guard let user = self.getUser() else {
            return
        }
        
        let realm = try! Realm.init()
        
        try! realm.write {
            print("🤖 Realm edit User to \(name) \(surname)")
            user.name = name
            user.surname = surname
            user.age = age
        }
        
    }
    

}

