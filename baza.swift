
import Foundation
import SwiftUI

class Kategorie: ObservableObject{
    @Published var polscyArtysciLoaded: Bool = false
    @Published var pALColor: Color = .red
}

class System: ObservableObject{
    @Published var kategorie: Kategorie = Kategorie()
    @Published var characters: [Character]
    @Published var systemLoaded: Bool = false

    init(){
        characters = []
        characters.append(Character(imie: "Jakub", nazwisko: "Hill", img: "postac0", ksywa: ""))
    }
    
}

class Character: ObservableObject{
    @Published var name: String
    @Published var surname: String
    @Published var imgName: String
    @Published var ksywka: String
    init(imie: String, nazwisko: String, img: String, ksywa: String){
        name = imie
        surname = nazwisko
        imgName = img
        ksywka = ksywa
    }
}

//func start(baza: inout System){
//}

func wczytajZPliku(baza: System, nazwaPliku: String){

    do {
        let path: String = Bundle.main.path(forResource: nazwaPliku, ofType: "txt")!
        let file = try String(contentsOfFile: path)
        var text: [String] = file.components(separatedBy: "\n")

        var doSprawdzenia: Int = text.count - 1
        while(doSprawdzenia != 0){
            if(text[doSprawdzenia] == ""){
                text.remove(at: doSprawdzenia)
            }
            doSprawdzenia -= 1

        }
        
    
        for (index, element) in text.enumerated() {
            print(index, ":", element)
            let charParts: [String] = element.components(separatedBy: ";")
            if charParts.count == 5{
                baza.characters.append(Character(imie: charParts[0], nazwisko: charParts[1], img: charParts[3], ksywa: charParts[2]))
            }
            
            else{
                print("Bląd! :(")
            }
            print("Imie: \(baza.characters[baza.characters.count-1].name)")
            print("Ksywka: \"\(baza.characters[baza.characters.count-1].ksywka)\"")
            print("Nazwisko: \(baza.characters[baza.characters.count-1].surname)")
            print("Nazwa pliku zdjecia: \(baza.characters[baza.characters.count-1].imgName)")
            
            print()

        }

    } catch let error {
        Swift.print("Fatal Error: \(error.localizedDescription)")
    }
    baza.characters.remove(at: 0)
    baza.characters.shuffle() //miesza kolejnosc
    print(baza.characters.count)
}
