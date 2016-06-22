class CommunicationPost < ActiveRecord::Base
  # Teacher
  belongs_to :user
  belongs_to :school_class
  # Firmantes
  has_and_belongs_to_many :signers, class_name: 'User', join_table: :communication_posts_users

  has_attached_file :thumbnail, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment :thumbnail, content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'] }

  has_attached_file :pdf
  validates_attachment :pdf, content_type: { content_type: %w(application/pdf application) }
end
