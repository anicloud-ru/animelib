class Arc < ApplicationRecord
  belongs_to :anime

  def episodes_number
    self.episodes.last - self.episodes.first + 1
  end

  def poster_url
    s3 = Aws::S3::Client.new
    objecto = Aws::S3::Object.new(client: s3, bucket_name: Animelib::Application::S3_BUCKET, key: "arcs-posters/#{id}.jpg")
    objecto.presigned_url(:get)
  end
end
