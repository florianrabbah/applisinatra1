class CreateGossips < ActiveRecord::Migration[7.1]
      def change
        create_table :gossips do |t|
          t.string :author
          t.text :content
    
          t.timestamps
        end
      end
end
    
  
  

