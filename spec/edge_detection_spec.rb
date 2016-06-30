require "spec_helper"
require "opencv"
include OpenCV
load "edge_detection.rb"


describe "Get edge" do
  specify "image show"
   it 'test' do 
     test_detection = Image.new("./test_utils/test_picture.jpg") 
     test_detection.edge
     test_detection.line_detection
   end
end
