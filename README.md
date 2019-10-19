- スキーマ

Userモデル

| カラム名 | データ型 |
----|----
| id | integer |
| name | string |
| email | string |
| password_digest | string |

Taskモデル

| カラム名 | データ型 |
----|----
| id | integer |
| user_id(FK) |references |
| title | string |
| content | text |
| deadline | datetime |
| status | string |
| priority | integer |

labelモデル

| カラム名 | データ型 |
----|----
| id | integer |
| name | string |


labelingモデル

| カラム名 | データ型 |
----|----
| label_id(FK) | references |
| task_id(FK) | references |

- デプロイ手順
１：git commitコマンドを使用して、コミット<br>
２：Herokuに新しいアプリケーションを作成: $ heroku create<br>
３：Herokuにデプロイ: $ git push heroku master<br>
４：環境(heroku)でのマイグレーション: $ heroku run rails db:migrate<br>

- バージョン
rails 5.2.3
ruby 2.6.4