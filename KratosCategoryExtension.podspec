Pod::Spec.new do |s|
s.name             = "KratosCategoryExtension"
s.version          = "0.0.8"
s.summary          = "https://github.com/Kratos28/KratosCategoryExtension.git"
s.description  =  "https://github.com/Kratos28/KratosCategoryExtension.git  This is KratosCategoryExtension"
s.homepage         = "https://github.com/Kratos28/KratosCategoryExtension.git"
s.license          = 'MIT'
s.author           = { "Kratos" => "461400226@qq.com" }
s.source           = { :git => "https://github.com/Kratos28/KratosCategoryExtension.git", :tag =>  s.version }
s.platform     = :ios, '7.0'
s.requires_arc = true
s.source_files  = 'KratosCategoryExtension0.0.8/**/*.h'
s.resource      = 'KratosCategoryExtension0.0.8/KratosCategoryExtension.bundle'
s.xcconfig     = {'OTHER_LDFLAGS' => '-ObjC'}
s.vendored_libraries = 'KratosCategoryExtension0.0.8/**/*.a'
s.public_header_files = 'KratosCategoryExtension0.0.8/**/*.h'
s.library = 'KratosCategoryExtension'







#s.subspec 'WebProgressView' do |ss|
#ss.source_files = 'WebProgressView/*.{h,m}'
#end



#s.subspec 'YJSortAndIndex' do |ss|
#ss.source_files = 'YJSortAndIndex/*.{h,m}'
#end


#s.xcconfig = { 'LIBRARY_SEARCH_PATHS' => '"$(PODS_ROOT)/*.a"' }
#s.frameworks = "Foundation","UIKit","MapKit","QuartzCore","CoreText","ImageIO","Security","CoreTelephony","CoreGraphics"
end
