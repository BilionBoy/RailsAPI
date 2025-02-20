# frozen_string_literal: true

class CreateProdutos < ActiveRecord::Migration[7]
  def change
    create_table :Produtos do |t|
      
      t.timestamps
    end
  end
end
