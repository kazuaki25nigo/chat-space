class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.string :image
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
# group_idとuser_idはreferences型で設定してあるので、カラム名に_idは不要です。
# また、その2つのカラムには外部キー制約をつけましょう。
# referencesを使用するとインデックスの設定も自動的に行われます。
      t.timestamps
    end
  end
end
