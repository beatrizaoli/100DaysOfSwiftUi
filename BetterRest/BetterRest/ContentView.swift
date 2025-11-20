//
//  ContentView.swift
//  BetterRest
//
//  Created by Beatriz Amorim Oliveira on 14/11/25.
//
//insira dados por meio de um seletor de datas e dois indicadores de ritmo, que, combinados, nos informarão a que horas ele deseja acordar, quantas horas de sono costuma preferir e quanto café consome.
import CoreML
import SwiftUI

struct ContentView: View {
    @State private var acordar = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1

    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("When do you want to wakeUp")
                    .font(.headline)
                DatePicker("Insira uma hora", selection: $acordar, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Text("Desired Amount Of Sleep")
                    .font(.headline)
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                
                Text("Amount Of Coffee")
                    .font(.headline)
                Stepper("\(coffeeAmount.formatted()) cups", value: $coffeeAmount, in: 1...20)
            }
            .navigationTitle("Better Rest")
            .toolbar {
                Button("Calculate", action: calculateBedTime)
            }
            .alert(alertTitle, isPresented: $showingAlert){
                Button("Ok"){}
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func calculateBedTime(){
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
           
            let components = Calendar.current.dateComponents([.hour, .minute], from: acordar)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleeptime = acordar - prediction.actualSleep

            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleeptime.formatted(date: .omitted, time: .shortened)
            
        } catch { //se der errado faz isso
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
    
}

#Preview {
    ContentView()
}
