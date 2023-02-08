class CreateArticles < ActiveRecord::Migration[7.0]

  def change
    create_table :articles do |t|
      t.belongs_to :user, foregin_key: true
      t.belongs_to :category;
      t.string :title
      t.string :subheading
      t.string :article_url
      t.date :created
      t.text :content
      t.integer :no_likes
      t.integer :no_comments

      t.timestamps
    end
  end
end
