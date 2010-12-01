class UploadController < ApplicationController

  def index
     render :file => 'app\views\upload\uploadfile1.html.erb'
  end
  
  def uploadFile
#    DataFile.save(params[:upload])

    name =  (params[:upload])['datafile'].original_filename
    #directory = "public/images"
    # create the file path
    path = File.join("public/images", name)
    # write the file
    File.open(path, "wb") { |f| f.write((params[:upload])['datafile'].read) }

    render :text => "Файл " + name + " удачно загружен"
  end

end
