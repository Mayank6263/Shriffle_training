class Irriversible < ActiveRecord::Migration[8.0]
  # def up
  #       execute("INSERT INTO posts(p1, p2, created_at, updated_at) VALUES ('Foo', 'Bar', '2018-07-31', '2018-07-31');")
  # end
  
  # def down
  #       execute("DELETE FROM posts WHERE p1 ='Foo';")
  # end

  reversible do |d|
    d.up {execute("INSERT INTO posts(p1, p2, created_at, updated_at) VALUES ('Foo', 'Bar', '2018-07-31', '2018-07-31');")}
    d.down {execute("INSERT INTO posts(p1, p2, created_at, updated_at) VALUES ('Foo', 'Bar', '2018-07-31', '2018-07-31');")}
  end
end


