class User < ActiveRecord::Base

    has_attached_file :avatar, styles: {
        thumb: '100x100>',
        square: '200x200#',
        medium: '300x300>'
    }
    validates_attachment :avatar,
        content_type: { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }, 
        size: { :in => 0..10.megabytes }

    validates :name, presence: true
    
end

