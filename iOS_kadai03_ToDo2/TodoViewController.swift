//
//  ViewController.swift
//  iOS_kadai03_ToDo2
//
//  Created by 篠原未花 on 2019/05/30.
//  Copyright © 2019 mika shinohara. All rights reserved.
//

import UIKit

class TodoViewController: UITableViewController {
    
    var itemArray : [Item] = []

     //itemの配列を作る
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        // あらかじめ3つくらいアイテムを作っておく
//        let item1: Item = Item(title: "")
//        let item2: Item = Item(title: "")
//        let item3: Item = Item(title: "")
    
        // NaviBarのタイトルを大きく表示させ、スクロールした場合は小さくする
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //navigationbarを表示する
        self.navigationController?.isNavigationBarHidden = false
        
        tableView.delegate = self
        tableView.dataSource = self

        
        
//        // 先ほど作ったitemArray配列に追加
//        itemArray.append(item1)
//        itemArray.append(item2)
//        itemArray.append(item3)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // セルの数を指定してあげる。
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //itemArrayの配列の数だけCellを表示させる
        return itemArray.count
        
    }
    // Cellの内容を決める
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Todocell", for: indexPath)
        //Cell番号のitemArrayを変数Itemに代入
        let item = itemArray[indexPath.row]
        //ToDoCellにCell番号のItemArrayの中身を表示させるようにしている
        cell.textLabel?.text = item.title
        
        return cell
        
    }
    
    //１画面で収まるように設定
    @IBAction func addBtn(_ sender: Any) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add to the list", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let newItem: Item = Item(title: textField.text!)
            self.itemArray.append(newItem)
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    /// セル選択時（UITableViewDataSource optional）
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 次の画面へ移動
        performSegue(withIdentifier: "next", sender: itemArray[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let editVC = segue.destination as! EditTableViewController
        let _ = editVC.view // ラベルのインスタンス作成のため…ダサいw 他にいい手はないのか.
        
        editVC.editModelTextField.text = sender as? String
    }
    
    //Appleが提供しているスワイプして削除できる機能
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        itemArray.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
       
    }
    
    
    
    
}

