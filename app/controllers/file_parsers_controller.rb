class FileParsersController < ApplicationController
  def home
  end

  def parse
    unless File.exist?('./public/up_file.txt')
      render 'home'
    end
    text = File.read('./public/up_file.txt')
    @messages = FileParser.parse_text(text)
    if @messages[:error].blank?
      TextFile.result_to_file('result.txt',@messages[:success])
      flash.now[:notice] = "Success! File saved to public folder. Result: " + @messages[:success]
    else
      flash.now[:error] = "Failiure! " + @messages[:error] + ". You should upload a new file"
    end
  end

  def upload
    if params[:upload].nil?
      flash.now[:error] = "No file selected"
      render 'home'
    else
      TextFile.save(params[:upload]['textfile'],'up_file.txt')
      flash.now[:notice] = "File uploaded"
    end
  end
end
