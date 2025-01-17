# rubyのモデルは、ApplicationRecord を継承することによって、Rails のActiveRecord機能を利用でき、ほとんど何も定義しなくてもデータベースとのやり取りが可能
# 基本的な操作（レコードの作成、更新、削除など）は自動的にサポートされる
# このモデルは、posts テーブルに対応している
class Post < ApplicationRecord
end
