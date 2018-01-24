//
//  ViewController.swift
//  MyMusic
//
//  Created by home on 2018/01/23.
//  Copyright © 2018年 Swift-beginners. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//シンバルの音源ファイルを指定
let cymbalPath = Bundle.main.bundleURL.appendingPathComponent("cymbal.mp3")

//シンバル用のプレイヤーインスタンスを作成
var cymbalPlayer = AVAudioPlayer()

//シンバルがタップされたときの処理
    @IBAction func cymbal(_ sender: Any) {
        soundPlayer(&cymbalPlayer, path:cymbalPath, count: 0)
    }
    
// ギターの音源ファイルを指定
    let guitarPath = Bundle.main.bundleURL.appendingPathComponent("guitar.mp3")
    
// ギター用のプレイヤーインスタンスを作成
    var guitarPlayer = AVAudioPlayer()
    
// ギターがタップされた時の処理
    @IBAction func guitar(_ sender: Any) {
    soundPlayer(&guitarPlayer, path:guitarPath, count: 0)
    }
    
// バックミュージックの音源ファイルを指定
    let backmusicPath = Bundle.main.bundleURL.appendingPathComponent("backmusic.mp3")
        
// バックミュージック用のプレイヤーインスタンスを作成
    var backmusicPlayer = AVAudioPlayer()

// Playボタンがタップされた時の処理
    @IBAction func play(_ sender: Any) {
    soundPlayer(&backmusicPlayer, path:backmusicPath, count: -1)
    }

    @IBAction func stop(_ sender: Any) {
// バックミュージック停止
    backmusicPlayer.stop()
    }
 
// 共通のプレイヤー再生処理
    fileprivate func soundPlayer(_ player:inout AVAudioPlayer, path: URL, count: Int) {
        do{
        player = try AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
        player.numberOfLoops = count
        player.play()
      } catch {
        print("エラーが発生しました！")
      }
}
}
