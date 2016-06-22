class CommunicationPost < ActiveRecord::Base
  belongs_to :user
  belongs_to :school_class
  
  has_attached_file :thumbnail, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment :thumbnail, content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'] }

  has_attached_file :pdf
  validates_attachment :pdf, content_type: { content_type: %w(application/pdf application) }

  def get_temp_file_path
    attachment.queued_for_write[:pdf].path
  end
end
