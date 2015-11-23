class Post < ActiveRecord::Base
  validates :title,
            presence: true,
            length: {
                in: 5..100,
                too_short: "must be at least %{count} symbols long",
                too_long: "must be at most %{count} symbols long"
            },
            uniqueness: { case_sensitive: false, message: 'should be unique' }
  validates :body, presence: true

  belongs_to :user
end
