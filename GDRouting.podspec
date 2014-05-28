Pod::Spec.new do |s|
  s.name          = "GDRouting"
  s.version       = "0.0.1"
  s.summary       = "GDRouting is a framework for using private CocoaPod repositories to modularizing a large application into sub-applications"
  s.homepage      = "https://www.godaddy.com"
  s.license       = { :'type' => 'GoDaddy', :'file' => 'LICENSE' }
  s.author        = { "Jonah Neugass" => "jneugass@godaddy.com" }
  s.platform      = :ios, '7.0'
  s.source        = { :git => "https://github.com/godaddy/GDRouting", :tag => "0.0.1" }
  s.source_files  = 'GDRouting'
  s.requires_arc  = true
  s.dependency 'JLRoutes'
  s.dependency 'FastCoding'
end