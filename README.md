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

* 目指した課題解決
大学時代のアルバイト先（以下アルバイト先）で、店員側・お客側での作業効率の向上を目指して開発
アルバイト先では未だにオーダーを紙に書いている。ピーク時にはオーダーを取りに行くのに時間がかかってしまったり、オーダーミスが発生していた。
そこで、大学時代にあったら楽になったと思うアプリを作成した

* 洗い出した要件
https://docs.google.com/spreadsheets/d/13DSbtVQ6fHrKtrKr07jzgb_lC3RQVLxPsQnMyqU1A8o/edit?usp=sharing

* 実装した機能についての画像やGIFおよびその説明


* 実装予定の機能	


* データベース設計



* ローカルでの動作方法
rails db:migrate 
bundle install
