# README

# テーブル設計

## users テーブル
## ユーザ情報
| Column             | Type   | Options                |
| ------------------ | ------ | ---------------------- |
| nickname           | string | null:false             |
| email              | string | null:false,unipue:true |
| encrypted_password | string | null:false             |
| name_first         | string | null:false             |
| name_last          | string | null:false             |
| name_reading_first | string | null:false             |
| name_reading_last  | string | null:false             |
| birthday           | date   | null:false             |

## users_Association
- has_many :buyer
- has_many :items

## items テーブル
## 商品情報
| Column                 | Type       | Options    |
| ---------------------- | ---------- | ---------- |
| name                   | string     | null:false |
| detail                 | text       | null:false |
| item_price             | integer    | null:false |
| user                   | references |            |
| category_id            | integer    | null:false |
| sales_status_id        | integer    | null:false |
| shipping_fee_status_id | integer    | null:false |
| prefecture_id          | integer    | null:false |
| scheduled_delivery_id  | integer    | null:false |

## items_Association
- belongs_to :user
- has_one :buyer

## orders テーブル
## 注文者情報
| Column        | Type       | Options    |
| ------------- | ---------- | ---------- |
| postal_code   | string     | null:false |
| prefecture_id | integer    | null:false |
| city          | string     | null:false |
| house_number  | string     | null:false |
| building_name | string     | 　　　　　　 |
| phone_number  | string     | null:false |
| buyer         | references | null:false |

## orders_Association
- belongs_to :buyer

## buyers テーブル
## 商品購入時の支払い金額情報
| Column | Type       | Options    |
| ------ | ---------- | ---------- |
| item   | references | null:false |
| user   | references | null:false |

## buyers_Association
- belongs_to :item
- has_one :order
- belongs_to :user
