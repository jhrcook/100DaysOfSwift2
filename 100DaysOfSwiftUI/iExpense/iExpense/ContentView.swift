//
//  ContentView.swift
//  iExpense
//
//  Created by Joshua on 6/29/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI


struct ExpenseItem: Identifiable, Codable {
    let id: UUID = UUID()
    let name: String
    let type: String
    let amount: Int
}


class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encodedData = try? encoder.encode(items) {
                UserDefaults.standard.set(encodedData, forKey: "items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "items") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decodedData
                return
            }
        }
        self.items = []
    }
}


struct ItemView: View {
    var name: String
    var type: String
    var amount: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5.0) {
                Text("\(name)")
                    .font(.headline)
                Text("\(type)")
                    .font(.body)
            }
            Spacer()
            Text("$\(amount)")
                .foregroundColor(Color.red)
        }
    }
}


struct ContentView: View {
    
    @ObservedObject var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    ItemView(name: item.name, type: item.type, amount: item.amount)
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpenses")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingAddExpense = true
                }) {
                    Image(systemName: "plus")
                })
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: self.expenses)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let contentView = ContentView()
        contentView.expenses.items = [
            ExpenseItem(name: "Test item", type: "Personal", amount: 25)
        ]
        return contentView
    }
}
