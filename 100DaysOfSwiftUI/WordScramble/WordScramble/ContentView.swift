//
//  ContentView.swift
//  WordScramble
//
//  Created by Joshua on 4/24/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var score: Int {
        var s = 0
        for w in usedWords {
            s += w.count * w.count
        }
        return s
    }
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your word here", text: $newWord, onCommit: addNewWord)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
                
                Text("Score: \(self.score)")
                .padding()
                    .font(.headline)
                    .foregroundColor(Color.red)
            }
            .navigationBarTitle(rootWord)
            .navigationBarItems(leading: Button(action: startGame, label: {
                Text("Restart")
            }))
            .onAppear(perform: startGame)
            .alert(isPresented: $showingError) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("I'm an idiot.")))
            }
        }
    }
    
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't just make them up, you know!")
            return
        }
        
        guard isLongEnough(word: answer) else {
            wordError(title: "Word too short", message: "Each answer must be at least three characters long.")
            return
        }
        
        guard isNotTheOriginalWord(word: answer) else {
            wordError(title: "You cannot use the original word", message: "Really? C'mon...")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "That isn't a real word.")
            return
        }
        
        
        usedWords.insert(answer, at: 0)
        newWord = ""
    }
    
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                usedWords = [String]()
                newWord = ""
                return
            }
        }
        fatalError("Could not load 'start.txt' from bundle.")
    }
    
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord.lowercased()
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    
    func isLongEnough(word: String) -> Bool {
        return word.count > 2
    }
    
    
    func isNotTheOriginalWord(word: String) -> Bool {
        return word != rootWord
    }
    
    
    
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
