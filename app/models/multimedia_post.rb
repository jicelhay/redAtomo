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
                    styles: lambda { |a| a.instance.is_image? ?  {medium: "300x300>", thumb: "100x100>", big: "1200x1200>", normal: "600x600>" } : {:thumb => { :geometry => "100x100#", :format => 'jpg', :time => 10}, :medium => { :geometry => "300x300#", :format => 'jpg', :time => 10}}},
                    :processors => lambda { |a| a.is_video? ? [ :transcoder ] : [ :thumbnail ] },
                    default_url: '/images/:style/missing.png'
  validates_attachment :img,
                       content_type: { content_type: ['image/jpeg',
                                                      'image/png',
                                                      'video/mp4'] }

  validates_attachment :img,
      content_type: { content_type: ['video/mp4'] },
      message:      "Video debe ser .mp4",
      if:           :is_video?  

  validates_attachment :img,
      content_type: { content_type: ['image/png', 'image/jpeg', 'image/jpg', 'image/gif'] },
      message:      "Formato de imagen no soportado",
      if:           :is_image?

  
  def is_video?
    img.instance.img_content_type =~ %r(video)
  end

  def is_image?
    img.instance.img_content_type =~ %r(image)
  end                                                   
end
