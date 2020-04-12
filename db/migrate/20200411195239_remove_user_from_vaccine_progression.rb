class RemoveUserFromVaccineProgression < ActiveRecord::Migration[6.0]
  def change
    remove_reference :vaccine_progressions, :user, null: false, foreign_key: true
    add_reference :vaccine_progressions, :travel, index: true, foreign_key: true
  end
end
