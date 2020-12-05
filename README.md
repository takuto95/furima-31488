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
- has_one :buyer
- has_many :items

## items テーブル
## 商品情報
| Column          | Type       | Options    |
| --------------- | ---------- | ---------- |
| image           | ActiveStorageで実装      |
| item_name       | string     | null:false |
| item_explantion | text       | null:false |
| item_detail     | text       | null:false |
| item_price      | integer    | null:false |
| user            | references |            |
| item_info_id    | integer    |            |

## items_Association
- belongs_to :user
- has_one :buyer

## item_info_id
## item_category/item_sales_status/item_shipping_fee_status/
## item_prefecture/item_scheduled_delivery

## orders テーブル
## 注文者情報
| Column        | Type       | Options    |
| ------------- | ---------- | ---------- |
| postal_code   | string     | null:false |
| prefecture_id | integer    | null:false |
| city          | string     | null:false |
| house_number  | string     | null:false |
| building_name | string     | 　　　　　　 |
| buyer         | references |            |

## orders_Association
- belongs_to :buyer

## buyers テーブル
## 商品購入時の支払い金額情報
| Column | Type       | Options    |
| ------ | ---------- | ---------- |
| order  | references | null:false |
| item   | references | null:false |
| user   | references | null:false |

## buyers_Association
- belongs_to :item
- has_one :order
- belongs_to :user
