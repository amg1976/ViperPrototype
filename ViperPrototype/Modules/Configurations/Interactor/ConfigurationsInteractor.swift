//
//  ConfigurationsInteractor.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import Foundation
import RxSwift

struct ConfigurationsInteractor {
   
   private let disposeBag = DisposeBag()
   private let dataManager: TmdbApiDataManager
   
   init(dataManager: TmdbApiDataManager) {
      self.dataManager = dataManager
   }
   
   func getConfigurations() -> Observable<Bool> {
      
      return Observable.create { observer in
      
         self.dataManager.configurations().subscribeNext { (configuration) -> Void in
            observer.onNext(configuration.imagesBaseUrl != "")
         }.addDisposableTo(self.disposeBag)

         return AnonymousDisposable {}
         
      }
      
   }
   
}