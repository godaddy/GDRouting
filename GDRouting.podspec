Pod::Spec.new do |s|
  s.name          = "GDRouting"
  s.version       = "0.0.1"
  s.summary       = "Search results app for the GDDiscovery App"
  s.homepage      = "https://www.godaddy.com"
  s.license       = { :'type' => 'GoDaddy', :'file' => 'LICENSE' }
  s.author        = { "Jonah Neugass" => "jneugass@godaddy.com" }
  s.platform      = :ios, '7.0'
  s.source        = { :git => "https://github.com/godaddy/GDRouting", :tag => "0.0.1" }
  s.source_files  = 'GDRouting'
  s.requires_arc  = true
  s.dependency 'DProperty'
  s.dependency 'JLRoutes'
  s.dependency 'FastCoding'
end