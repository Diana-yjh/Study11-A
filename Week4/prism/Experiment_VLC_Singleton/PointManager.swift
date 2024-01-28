//
//  PointManager.swift
//  Experiment_VLC_Singleton
//
//  Created by Jaehun Lee on 1/27/24.
//

class PointManager {
    static var shared = PointManager()
    
    var point: Int = 50
    
    private init() {
        
    }
    
    func subtractPoint(_ point: Int) {
        self.point -= point
    }
}
