class CreateSupressMessages < ActiveRecord::Migration[8.0]
  def change
    suppress_messages do
      create_table :supressmessages do |t|
        t.string :title

        t.timestamps
      end
    end

    say "I am after supressing messages"

    #It will print message after 10 sec wait i.e sleep
    say_with_time "Waiting for a while" do
          sleep 10
          250
    end
  end
end
