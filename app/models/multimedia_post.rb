# == Schema Information
#
# Table name: posts
#
#  id              :integer          not null, primary key
#  title           :string
#  body            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  school_class_id :integer
#  user_id         :integer
#
class MultimediaPost < ActiveRecord::Base
  belongs_to :user
  belongs_to :school_class
  alias_attribute :author, :user

  has_attached_file :img,
                    styles: { media_item: '300x300>', thumb: '100x100>' },
                    default_url: '/images/:style/missing.png'
  validates_attachment :img,
                       content_type: { content_type: ['image/jpeg',
                                                      'image/png'] }
end
