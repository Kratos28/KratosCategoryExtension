Pod::Spec.new do |s|
s.name             = "KratosCategoryExtension"
s.version          = "0.0.2"
s.summary          = "https://github.com/Kratos28/KratosCategoryExtension.git"
s.description  =  "https://github.com/Kratos28/KratosCategoryExtension.git  This is KratosCategoryExtension"
s.homepage         = "https://github.com/Kratos28/KratosCategoryExtension.git"
s.license          = 'MIT'



s.author           = { "Kratos" => "461400226@qq.com" }
s.source           = { :git => "https://github.com/Kratos28/KratosCategoryExtension.git", :tag => '0.0.2' }

s.platform     = :ios, '7.0'
s.requires_arc = true
s.source_files  = 'KratosCategoryExtension/*.{h,m}'
s.frameworks = "Foundation","UIKit","MapKit","QuartzCore","CoreText","ImageIO","Security","CoreTelephony","CoreGraphics"

#s.vendored_libraries = 'KratosExtension/*.a'
#s.library = 'KratosExtension'
#s.xcconfig = { 'LIBRARY_SEARCH_PATHS' => '"$(PODS_ROOT)/KratosExtension/KratosExtension/libKratosExtension.a"' }


end
