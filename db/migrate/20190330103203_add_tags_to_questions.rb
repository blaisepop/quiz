class AddTagsToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :tags, :string, index:true
  end
end
