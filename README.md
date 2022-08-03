## usersテーブル
  | Column             | Type   | Options     |
  | ------------------ | ------ | ----------- |
  | name               | string | null: false |
  | email              | string | null: false |
  | encrypted_password | string | null: false |
  
### Association

- has_many :records

# recordsテーブル
  | Column             | Type       | Options                        |
  | ------------------ | ---------- | ------------------------------ |
  | title              | string     | null: false                    |
  | content            | text       | null: false                    |
  | height             | integer    |                                |
  | weight             | integer    |                                |
  | user_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :user

# memosテーブル

# expensesテーブル
