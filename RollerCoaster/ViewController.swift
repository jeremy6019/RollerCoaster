//
//  ViewController.swift
//  RollerCoaster
//
//  Created by 503 on 2020/02/26.
//  Copyright © 2020 ssang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //좌표를 누적시킬 배열 선언
    var pointArray:Array = Array<Array<CGFloat>>()
    var index:Int = 0 //이차원배열의 접근용 인덱스
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func goMove(_ sender: Any) {
        // move()
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(move), userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //터치제스처 추가하기
        let gesture = UITapGestureRecognizer(target: self, action: #selector(getPoint))
        self.view.addGestureRecognizer(gesture)
        
        
    }
    
    @objc func getPoint(sender:UITapGestureRecognizer){
       //터치한 곳의 CGPoint 반환받음
        var point = sender.location(in: self.view)
        
        //점하나를 담을 일차원 배열 생성
        var dot = [point.x, point.y]
        pointArray.append(dot)
        print(pointArray)
        
        //화면에 좌표흔적을 남기자
        var red = UIView(frame: CGRect(x: dot[0], y: dot[1], width: 5, height: 5))
        red.backgroundColor = UIColor.yellow // 색상주기
        
        //화면애 부착 (기존뷰에 부착)
        self.view.addSubview(red)
        
    }
    
    //좌표를 /다라다니는 캐릭터 구현 '
    @objc func move(){
        imageView.frame.origin.x = pointArray[index][0]
        imageView.frame.origin.y = pointArray[index][1]
        if index < pointArray.count-1{
            index += 1
        }
        
    }
    
}

