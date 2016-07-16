class Image

  def initialize(image_path)
    @output_window = GUI::Window.new('Output')

    input_image = CvMat.load(image_path, CV_LOAD_IMAGE_GRAYSCALE)
    begin
    rescue
      puts '開けませんでした'
      exit
    end

    @resize_image = input_image.resize(CvSize.new(800,600))
  end

  def edge
    gaus_image = @resize_image.smooth(CV_GAUSSIAN)
    gaus_image, th = gaus_image.threshold(0,255, CV_THRESH_OTSU)
    @edge_detection = gaus_image.canny(0,200)
 end


  def line_detection
    @hough = @edge_detection.hough_lines(CV_HOUGH_PROBABILISTIC, 1, Math::PI / 10000, 10, 10, 10)
    @result = @edge_detection.GRAY2BGR
    @hough.each do |points|
      @result.line!(*points, color:CvColor::Yellow, thickness:1, line_type: :aa)
    end
  end


  def output_show
    @output_window.show @edge_detection
   @output_window.show @result

    GUI::wait_key
    GUI::Window.destroy_all
  end

end
