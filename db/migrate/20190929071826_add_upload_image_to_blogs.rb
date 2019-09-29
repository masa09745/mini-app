class AddUploadImageToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :upload_image, :binary
  end
end
