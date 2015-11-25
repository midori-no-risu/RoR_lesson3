class Post < ActiveRecord::Base
  validates :title,
            presence: true,
            length: {
                in: 5..140,
                too_short: 'must be at least %{count} symbols long',
                too_long: 'must be at most %{count} symbols long'
            }
            # uniqueness: { case_sensitive: false, message: 'should be unique' }
  validates :body, presence: true,
            length: { minimum: 140 }

  serialize :tags, Array
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
end
