//
//  NewsViewModel.swift
//  internetten veri cekme ve MVVM
//
//  Created by Mert AKBAŞ on 3.09.2022.
//

import Foundation
struct NewsTableViewModel{
    let newList: [News]
    func numberOfRowsInsection()-> Int{
        return self.newList.count
    }
    
    func newsAtIndexPath(_ index: Int)-> NewsViewModel{
        let news = self.newList[index]
        return NewsViewModel(news: news)
    }
}
struct NewsViewModel{
    let news: News
    
    
    var title: String{
        return self.news.title
    }
    var story: String{
        return self.news.stroy
    }
}
