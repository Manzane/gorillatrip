class AddOnboardingCompletedAtToTravels < ActiveRecord::Migration[6.0]
  def change
    add_column :travels, :onboarding_completed_at, :datetime
  end
end
