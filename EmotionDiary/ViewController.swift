//
//  ViewController.swift
//  EmotionDiary
//
//  Created by SangRae Kim on 1/2/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var emotionButtons: [UIButton]!
    @IBOutlet var emotionLabels: [UILabel]!
    let emotions = ["기쁘다", "행복해", "사랑해", "짜증나", "그냥저냥", "졸리다", "황당해", "이게뭐람", "우울해"]
    var emotionNum = Array(repeating: 0, count: 9)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: .background)
        
        setNavigationItem()
        
        setEmotionButtonsTag()
        setEmotionButtonsImage()
        
        setEmotionLabelsTag()
        setEmotionLabelsText()
    }
    
    @IBAction func emotionButtonsClicked(_ sender: UIButton) {
        let tag = sender.tag
        
        emotionNum[tag] += 1
        emotionLabels[tag].text = "\(emotions[tag]): \(emotionNum[tag])"
    }
    
    func setNavigationItem() {
        navigationItem.title = "감정 다이어리"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(showAlert))
    }
    
    @objc
    func showAlert() {
        let content = UIAlertController(title: "환영합니다", message: "감정 다이어리 입니다!", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "확인", style: .default)
        let cancelButton = UIAlertAction(title: "취소", style: .cancel)
        
        content.addAction(okButton)
        content.addAction(cancelButton)
        
        present(content, animated: true)
    }
    
    func setEmotionButtonsTag() {
        for idx in 0...8 {
            emotionButtons[idx].tag = idx
        }
    }
    
    func setEmotionButtonsImage() {
        for emotionButton in emotionButtons {
            let image = UIImage(named: "slime\(emotionButton.tag+1)")!.withRenderingMode(.alwaysOriginal)
            emotionButton.contentMode = .scaleAspectFit
            emotionButton.setImage(image, for: .normal)
        }
    }
    
    func setEmotionLabelsTag() {
        for idx in 0...8 {
            emotionLabels[idx].tag = idx
        }
    }
    
    func setEmotionLabelsText() {
        for emotionLabel in emotionLabels {
            let randomNum = randomInt()
            let tag = emotionLabel.tag
            let text =  "\(emotions[tag]): \(randomNum)"
            
            emotionLabel.text = text
            emotionLabel.textAlignment = .center
            emotionNum[tag] = randomNum
        }
    }
    
    func randomInt() -> Int {
        Int.random(in: 0...5)
    }
}

