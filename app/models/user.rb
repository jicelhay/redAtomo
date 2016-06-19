# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  teacher                :boolean
#  image_file_name        :string
#  image_content_type     :string
#  image_file_size        :integer
#  image_updated_at       :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_token_authenticatable
         
  has_many :posts
  has_many :likes
  has_many :parent_obligations
  has_many :parent_classes, through: :parent_obligations, source: :school_class
  has_many :school_classes
  has_many :comments
  has_attached_file :image, styles: { thumb: ["64x64#", :jpg] }, default_url: ":style/avatar.png"
  
  validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/png"] }
  validates :name, presence: true                   
     
end
