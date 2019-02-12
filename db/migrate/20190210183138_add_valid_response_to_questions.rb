class AddValidResponseToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :valid_response, :string
  end
end
