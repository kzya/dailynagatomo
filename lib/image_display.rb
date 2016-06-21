class Imagedisplay
  def display
    input_window = GUI::Window.new('Input')
    output_window = GUI::Window.new('Output')

    begin
      input_img = CvMat.load("./utils/images/many_pieces.jpg")
    rescue
      puts '開けませんでした'
      exit
    end

    output_img = input_img.BGR2GRAY.canny(50,50)

    input_window.show input_img
    output_window.show output_img

    GUI::wait_key
    GUI::Window.destroy_all
  end
end
