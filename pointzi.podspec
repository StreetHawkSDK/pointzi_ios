Pod::Spec.new do |s|
  s.name                = "pointzi"
  s.version             = "1.1.0"
  s.summary             = "Pointzi module."
  s.description         = <<-DESC
                            Pointzi is an excellent SDK for you to create an experiment.
                            DESC
  s.homepage            = "https://dashboard.pointzi.com"
  s.screenshots         = [ ]
  s.license             = 'LGPL'
  s.author              = { 'Supporter' => 'support@streethawk.com' }

  s.source              = { :git => 'https://github.com/StreetHawkSDK/pointzi_ios.git', :tag => s.version.to_s, :submodules => true }
  s.platform            = :ios, '8.0'
  s.requires_arc        = true
  
  s.xcconfig            = { 'OTHER_LDFLAGS' => '$(inherited) -lObjC', 
                            'OTHER_CFLAGS' => '$(inherited) -DNS_BLOCK_ASSERTIONS=1 -DNDEBUG'
                          }  
                          
  s.source_files        = 'Pointzi/**/*.{h,m}'    
  s.public_header_files = 'Pointzi/Headers/*.h'
  s.vendored_libraries 	= 'Pointzi/libPointzi.a'
  s.resource_bundles    = {'Pointzi' => ['Pointzi/Assets/**/*']}
  
  s.frameworks          = 'CoreTelephony', 'Foundation', 'CoreGraphics', 'UIKit', 'CoreSpotlight'
  s.libraries           = 'sqlite3'
  
end
