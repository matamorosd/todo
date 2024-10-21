class Project < ApplicationRecord
  belongs_to :user
  has_many :statuses, dependent: :destroy
  has_many :tasks, dependent: :destroy

  after_create :create_default_statuses

  private

  def create_default_statuses
    self.statuses.create([ { name: "To Do", position: 1 }, { name: "In Progress", position: 2 }, { name: "Done", position: 3 } ])
  end
end
