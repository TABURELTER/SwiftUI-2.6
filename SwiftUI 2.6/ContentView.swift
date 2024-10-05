//
//  ContentView.swift
//  SwiftUI 2.6
//
//  Created by Дмитрий Богданов on 05.10.2024.
//

import SwiftUI

struct ContentView: View {
    @State var sex:Sex = .Man
    @State var toggle:Bool = false
    @State var news:Bool = true
    @State var updateFromFriends:Bool = true
    @State var alert:Bool = false
    @State var FirstName:String = ""
    @State var LastName:String = ""
    
    enum Sex:String, CaseIterable, Identifiable {
        case Man,Woman
        var id: Self  { self }
    }
    
    var body: some View {
        
        NavigationView{
            Form{
                List{
                    Section("Личные данные"){
                        TextField("Имя", text: $FirstName)
                        TextField("Фамилия", text: $LastName)
                        DatePicker("Дата рождения", selection: .constant(Date()),displayedComponents: .date)
                        
                        Picker("Пол",selection: $sex){
                            Text("Мужской").tag(Sex.Man)
                            Text("Женский").tag(Sex.Woman)
                        }.pickerStyle(.navigationLink)
                    }
                    
                    Section("Нотификации"){
                        Toggle(isOn: $toggle) {
                                Text("Получать нотификации")
                            }
                        if toggle{
                            Toggle(isOn: $news) {
                                    Text("Новости")
                                }
                            Toggle(isOn: $updateFromFriends) {
                                    Text("Обновления друзей")
                                }
                        }
                    }
                    
                    Section("Документы"){
                        Button("Личные данные"){}
                        Button("Условия использования"){}
                    }
                    
                    Section(){
                        Button("Выход",role: .destructive){
                            alert.toggle()
                        }.alert(isPresented: $alert){
                            Alert(
                                title: Text("Выход"),
                                message: Text("Вы уверены, что хотите выйти?"),
                                primaryButton: .default(Text("Отменить")),
                                secondaryButton: .destructive(Text("Выйти"))
                            )
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
