class RenameAutoApprove < ActiveRecord::Migration[5.0]
  def change
    rename_column(:rewards, :auto_approve?, :approval)
  end
end
