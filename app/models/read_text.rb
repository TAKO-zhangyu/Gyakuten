# == Schema Information
#
# Table name: read_texts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  text_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_read_texts_on_user_id_and_text_id  (user_id,text_id) UNIQUE
#
class ReadText < ApplicationRecord
  belongs_to :user
  belongs_to :text
  validates :user_id, presence: true, uniqueness: { scope: :text_id }
  validates :text_id, presence: true
end
