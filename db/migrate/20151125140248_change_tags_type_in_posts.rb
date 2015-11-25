class ChangeTagsTypeInPosts < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :posts do |p|
        dir.up   { p.change :tags, :string, array:true, default: [] }
        dir.down { p.change :tags, :string, array:false }
      end
    end
  end
end
