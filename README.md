# README

# テーブル設計

## users テーブル
## ユーザ情報
| Column       | Type   | Options    |
| ------------ | ------ | ---------- |
| nickname     | string | null:false |
| email        | string | null:false |
| password     | string | null:false |
| name         | string | null:false |
| name_reading | string | null:false |
| birthday     | string | null:false |

## users_Association
- has_one :buyers
- has_many :items
- has_one :orders

## items テーブル
## 商品情報
| Column          | Type       | Options    |
| --------------- | ---------- | ---------- |
| image           | ActiveStorageで実装      |
| item_name       | string     | null:false |
| item_explantion | text       | null:false |
| item_detail     | text       | null:false |
| item_price      | string     | null:false |
| user            | references |            |
| item_info       | integer    |            |

## items_Association
- belongs_to :users
- has_one :buyers

## item_info
## item_category/item_sales_status

## orders テーブル
## 注文するための情報
| Column        | Type       | Options    |
| ------------- | ---------- | ---------- |
| postal_code   | string     | null:false |
| prefecture    | string     | null:false |
| city          | string     | null:false |
| house_number  | string     | null:false |
| building_name | string     | null:false |
| user          | references |            |
| order_info    | integer    |            |

## orders_Association
- belongs_to :users

## order_info
## item_shipping_fee_status/item_prefecture/item_scheduled_delivery

## buyers テーブル
## 商品購入時の支払い金額情報
| Column | Type       | Options    |
| ------ | ---------- | ---------- |
| price  | integer    | null:false |
| user   | references | null:false |
| item   | references | null:false |

## buyers_Association
- belongs_to :items
- belongs_to :users
