class AddUserToVaccineProgression < ActiveRecord::Migration[6.0]
  def change
    add_reference :vaccine_progressions, :user, null: false, foreign_key: true
  end
end
