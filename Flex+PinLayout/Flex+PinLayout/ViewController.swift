//
//  ViewController.swift
//  Flex+PinLayout
//
//  Created by 최수훈 on 2023/06/08.
//

import UIKit
import PinLayout
import FlexLayout


class ViewController: UIViewController {
    
    var sampleFlexView = UIView()
    private var testButton1: UIButton = {
        var button = UIButton()
        button.setTitle("navigationTest", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
        
        return button
    }()
    
    private var testButton2: UIButton = {
        var button = UIButton()
        button.setTitle("test2", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        sampleFlexView.pin.all(view.pin.safeArea)
        sampleFlexView.flex.layout()
        
        testButton1.pin.left(view.pin.safeArea + 40).right(sampleFlexView.pin.safeArea + 40)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
    
    func configUI() {
        view.backgroundColor = .white
        view.addSubview(sampleFlexView)
//        sampleFlexView.backgroundColor = .yellow
        sampleFlexView.flex.direction(.column).define {
            $0.addItem(testButton1)
            $0.addItem(testButton2).margin(30, 50)
        }
        
        testButton1.addTarget(self, action: #selector(tapTest1Button), for: .touchUpInside)
        
        testButton2.addTarget(self, action: #selector(tapTest2Button), for: .touchUpInside)
        
    }
    
   @objc func tapTest1Button() {
       self.navigationController?.pushViewController(FlexLayoutViewControler(), animated: true)
    }
    
    @objc func tapTest2Button() {
        print(#function)
    }
}

