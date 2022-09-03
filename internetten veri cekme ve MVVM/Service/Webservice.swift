//
//  Webservice.swift
//  internetten veri cekme ve MVVM
//
//  Created by Mert AKBAŞ on 3.09.2022.
//

import Foundation

class Webservice {
    
    func HaberleriIndir(url: URL, Completion: @escaping([News]?)->()){ //escaping yaptık çünkü tamamlanması zaman alan işlemler. News i de ekledik.
        
        
        // session transfer etmek anlamında kullanıldı data transveri
        URLSession.shared.dataTask(with: url) {  (data, response, error ) in
            
            if let error = error { // hata verirse burası
                print(error.localizedDescription)
                Completion(nil)
            }else if let data = data { // veri gelirse burası
                let haberlerDizisi = try? JSONDecoder().decode([News].self, from: data)
                if let haberlerDizisi = haberlerDizisi{
                    Completion(haberlerDizisi)
                }
            }
            
        }.resume() // devam ettir demek 
        
    }
}
