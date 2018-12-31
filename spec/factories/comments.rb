FactoryBot.define do
  factory :comment do
    content { "dummy comment" }
    movie
    user
  end

  factory :empty_comment, class: Comment do
    content { nil }
    movie
    user
  end
end
