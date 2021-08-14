class Album < ApplicationRecord

    mount_uploaders :photos_url, AlbumUploader


end
