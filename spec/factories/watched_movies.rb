# == Schema Information
#
# Table name: watched_movies
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  movie_id   :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_watched_movies_on_user_id_and_movie_id  (user_id,movie_id) UNIQUE
#
FactoryBot.define do
  factory :watched_movie do
    user_id { 1 }
    movie { 1 }
  end
end
