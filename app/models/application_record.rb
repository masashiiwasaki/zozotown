class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # 本実装時にストロングパラメターを設定。Viewも同様に変更。
end
