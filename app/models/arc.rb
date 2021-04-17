class Arc < ApplicationRecord
  belongs_to :anime

  def series_number
    self.series.last - self.series.first + 1
  end

  def poster_url
    s3 = Aws::S3::Client.new
    objecto = Aws::S3::Object.new(client: s3, bucket_name: 'animelib-s3-stoke', key: "arcs-posters/#{id}.jpg")
    objecto.presigned_url(:get)
  end
end
