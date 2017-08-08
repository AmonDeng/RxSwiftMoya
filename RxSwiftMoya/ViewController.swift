//
//  ViewController.swift
//  RxSwiftMoya
//
//  Created by Chao Li on 9/20/16.
//  Copyright © 2016 ERStone. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        viewModel.getPosts()
//            .subscribe(onNext: { (posts: [Post]) in
//                //do something with posts
//                print(posts.count)
//            })
//            .addDisposableTo(disposeBag)
        let viewModel  = ViewModel(self)
        viewModel.createPost(title: "Title 1", body: "Body 1", userId: 1)
            .subscribe({event in
                switch event{
                case .next(let response):
                    print(response);
                    break
                case .error(let error):
                    print(error)
                    break
                default:
                   break
                }
            })
            .addDisposableTo(disposeBag)
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

