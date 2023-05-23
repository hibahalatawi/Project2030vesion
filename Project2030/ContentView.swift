//
//  ContentView.swift
//  Project2030
//
//  Created by Hibah Abdullah Alatawi on 02/11/1444 AH.
//

import SwiftUI
import CoreData

struct ContentView: View{
    var body: some View{
        Text("hhhh")
        Text("hhhh")
        Text("hhhh")
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
