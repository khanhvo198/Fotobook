class Photo < ApplicationRecord



    mount_uploader :photo_url, PhotoUploader
end
