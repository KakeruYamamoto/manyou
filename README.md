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
| title | text |
| limitline | datetime |
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