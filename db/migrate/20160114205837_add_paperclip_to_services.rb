class AddPaperclipToServices < ActiveRecord::Migration
  def change
    add_attachment :services, :image
    add_attachment :services, :inventory
    add_attachment :services, :other_file1
  end
end
