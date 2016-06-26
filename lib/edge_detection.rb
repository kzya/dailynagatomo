class Image

  def initialize
    @output_window = GUI::Window.new('Output')

    begin
    input_image = CvMat.load(ARGV[0], CV_LOAD_IMAGE_GRAYSCALE)
    rescue
      puts '開けませんでした'
      exit
    end

    @resize_image = input_image.resize(CvSize.new(800,600))
  end

  def edge
    gaus_image = @resize_image.smooth(CV_GAUSSIAN)
    gaus_image, th = gaus_image.threshold(0,255, CV_THRESH_OTSU)
    @edge_detection = gaus_image.canny(50,50)
  end

  def line_detection
    @hough = @edge_detection.hough_lines(CV_HOUGH_PROBABILISTIC, 1, Math::PI / 300, 10, 10, 10)
  end

  def line_draw
    @result = @edge_detection.GRAY2BGR
    @hough.each do |points|
      @result.line!(*points, color:CvColor::Yellow, thickness:2, line_type: :aa)
    end
  end

  def output_show
    @output_window.show @edge_detection
    @output_window.show @result

    GUI::wait_key
    GUI::Window.destroy_all
  end

end
