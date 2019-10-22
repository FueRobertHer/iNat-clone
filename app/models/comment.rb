class Comment < ApplicationRecord
  validates :observation_id, :commenter_id, :body, presence: true

  belongs_to :commenter,
    foreign_key: :commenter_id,
    class_name: :User

  belongs_to :observation,
    foreign_key: :observation_id,
    class_name: :Observation

    
end
