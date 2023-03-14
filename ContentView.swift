//
//  ContentView.swift
//  Chapter5
//
//  Created by Timur on 13.03.2023.
//

import SwiftUI

struct ContentView: View {
    @State var message = ""
    @State var sliderValue = 0.0
    
    enum Response{
        case success
    }
    
    var body: some View {
        VStack {
            Button("Click Me"){
                let startTime = NSDate()
                Thread.sleep(forTimeInterval: 10)
                callFunction()
                let endTime = NSDate()
                message = "Completed in \(endTime.timeIntervalSince(startTime as Date)) seconds"
            }
            Spacer()
            Slider(value: $sliderValue)
            Text("Message = \(message)")
        }
    }
    
    func doSomething() async throws -> Response{
        return Response.success
    }
    
    func callFunction(){
        Task(priority: .high){
            do{
                _ = try await doSomething()
            }catch{
                //
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
