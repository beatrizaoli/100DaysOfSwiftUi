//
//  ContentView.swift
//  BetterRest
//
//  Created by Beatriz Amorim Oliveira on 14/11/25.
//

// Substitua o controle deslizante “Número de xícaras” por um Picker que mostre a mesma faixa de valores.
// Altere a interface do usuário para que ela sempre mostre o horário de dormir recomendado, usando uma fonte grande e legível. Você deve poder remover completamente o botão "Calcular".

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var acordar = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 0
        
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    //usa propriedade computada pois ela é disparada pelo próprio sistema para renderizar a interface
    //retornamos direto o valor que deve aprecer em tela e tiramos as variáveis @state do alert pois propriedade computada não deve conter state apenas ler e imprimir um valor, se ela muda o estado ela atrapalha a renderização podendo criar um looping
    var calculateBedTime: String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: acordar)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleeptime = acordar - prediction.actualSleep
            
            return sleeptime.formatted(date: .omitted, time: .shortened)
                    
        } catch {
            return "Sorry, there was a problem calculating your bedtime."
        }
    }
    
    var body: some View {
        NavigationStack{
            Form {
                VStack(alignment: .leading, spacing: 0) {
                    Text("When do you want to wakeUp")
                        .font(.headline)
                    DatePicker("Insira uma hora", selection: $acordar, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Desired Amount Of Sleep")
                        .font(.headline)
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Amount Of Coffee")
                        .font(.headline)
                    Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                }
                Section("Your sleeptime is:"){
                    Text(calculateBedTime)
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .navigationTitle("Better Rest")
            
        }
    }

    
}

#Preview {
    ContentView()
}
