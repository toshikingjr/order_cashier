# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* アプリケーション名
order_cashier

* アプリケーション概要
ユーザー側は商品を注文・注文履歴の確認・店員呼び出しができる
店員側は新規テーブル作成・オーダーされた商品のの表示・クリックによって商品を非表示・昨日や先月等の注文された商品の集計を表示できる


* url
https://order-cashier-36107.herokuapp.com/

* テスト用アカウント
メール：tomurai77@gmail.com
password:gundam00

* 利用方法
ユーザーはQRコードを読み取るとアンケートページ（男女・年齢）のページに飛び、回答を終えると商品一覧ページに飛び、注文したい商品をカートに入れ流ことができる
カート画面ではオーダー数量の変更・削除・注文確定ができる
注文履歴画面で注文履歴を閲覧・店員呼び出しが可能
店員側は、各テーブルの注文履歴の確認やメニューの追加・集計されたデータの閲覧をすることができる
事前にメニューを登録しておく *AWS導入をしていないため、一定時間でメニュー画像が消えてしまう


* 目指した課題解決
大学時代のアルバイト先（以下アルバイト先）で、店員側・お客側での作業効率の向上を目指して開発
アルバイト先では未だにオーダーを紙に書いている。ピーク時にはオーダーを取りに行くのに時間がかかってしまったり、オーダーミスが発生していた。
そこで、大学時代にあったら楽になったと思うアプリを作成した

* 洗い出した要件
https://docs.google.com/spreadsheets/d/13DSbtVQ6fHrKtrKr07jzgb_lC3RQVLxPsQnMyqU1A8o/edit?usp=sharing

* 実装した機能についての画像やGIFおよびその説明
メニューを新規作成するとメニュー画面に作成したメニューが表示される
作成の際にカテゴリーを登録することによって、メニュー一覧画面でメニューをカテゴリーごとに絞ることができる
[![Image from Gyazo](https://i.gyazo.com/65941d250abf660a048093a0904583f1.gif)](https://gyazo.com/65941d250abf660a048093a0904583f1)
テーブル一覧画面では、table_numが複数存在する場合は、新しいものを表示する
テーブル一覧でテーブル番号をクリックすると注文履歴画面に飛ぶことができる
注文履歴画面では合計金額を表示する
[![Image from Gyazo](https://i.gyazo.com/a04d2585f5a9bbdcbbdb35132f66d23c.gif)](https://gyazo.com/a04d2585f5a9bbdcbbdb35132f66d23c)
メニュー一覧画面でタグの絞り込みをすると選択したタグのみ表示できる
注文したい商品をクリックすることでメニュー詳細画面に遷移することができる
７つ以上の商品がメニューとして登録されている場合は、６つごとに次のページで表示する（画面下の遷移ボタンから移動できる）
*商品注文前にアンケート（注文履歴画面から遷移できる）に回答しないとメニュー詳細画面にエラーが出ます
[![Image from Gyazo](https://i.gyazo.com/ea7b1c965376c9b4cdcde192acae1a24.gif)](https://gyazo.com/ea7b1c965376c9b4cdcde192acae1a24)
メニュー詳細画面で数量を選択して、注文ボタンを押すとカート画面に移動する
カート画面では、メニュー詳細画面で注文ボタンを押した商品と数量が表示される
カート画面では数量の変更・オーダーの削除ができる
注文確定ボタンを押すことで注文が確定する
[![Image from Gyazo](https://i.gyazo.com/dc8d6d7813c02733f120850cab7f1780.gif)](https://gyazo.com/dc8d6d7813c02733f120850cab7f1780)
テーブル作成画面にてテーブル番号を入力してテーブル作成を押すと新しいテーブルが作成される
同じテーブル番号が複数ある場合は、新しく作成したテーブルのみが表示される
[![Image from Gyazo](https://i.gyazo.com/660d3813bfe7d7fe33d809898faf17f1.png)](https://gyazo.com/660d3813bfe7d7fe33d809898faf17f1)
顧客の年齢と性別を1月分集計して表示する
直近３ヶ月の年齢・性別別のオーダー数量を表示する
[![Image from Gyazo](https://i.gyazo.com/ac77887453ca0181737f019c619c732b.png)](https://gyazo.com/ac77887453ca0181737f019c619c732b)
期間別（前日・１週間・先週・今月・先月・前年同月）のオーダー数量と合計売り上げを表示する

* 実装予定の機能	
店員呼び出しのためのプッシュ通知機能がうまく行っていないため、今後改善要
ビューを最低限しか作成していないので、今後改善要
AWS導入予定

* データベース設計
[![Image from Gyazo](https://i.gyazo.com/86d484d7ca55408d16fc4351fb37d82c.png)](https://gyazo.com/86d484d7ca55408d16fc4351fb37d82c)


* ローカルでの動作方法
rails db:migrate 
bundle install
