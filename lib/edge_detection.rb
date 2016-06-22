class EdgeDetection
  def edge

    output_window = GUI::Window.new('Output')

    input_image = CvMat.load("./utils/images/many_pieces.jpg")

    begin
    rescue
      puts '開けませんでした'
      exit
    end

    output_image = input_image.BGR2GRAY.canny(70,70)

    output_window.show output_image

    GUI::wait_key
    GUI::Window.destroy_all
  end
end
