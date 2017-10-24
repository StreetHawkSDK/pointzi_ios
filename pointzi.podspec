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
  
  s.default_subspec 	= 'Lite'
  
  # subspec for users who don't want the optional functions
  s.subspec 'Lite' do |sp|
  		sp.platform            	= :ios, '8.0'
  		sp.xcconfig            	= { 'OTHER_LDFLAGS' => '$(inherited) -lObjC',
                                    'OTHER_CFLAGS' => '$(inherited) -DNS_BLOCK_ASSERTIONS=1 -DNDEBUG'
                                  }
  		sp.source_files        	= 'Pointzi/**/*.{h,m}'
  		sp.public_header_files 	= 'Pointzi/Headers/*.h'
  		sp.vendored_libraries   = 'Pointzi/libPointzi.a'
  		sp.resource_bundles    	= {'Pointzi' => ['Pointzi/Assets/**/*']}
  		sp.frameworks          	= 'CoreTelephony', 'Foundation', 'CoreGraphics', 'UIKit', 'CoreSpotlight'
  		sp.libraries           	= 'sqlite3'
  end

  s.subspec 'PaperOnBoarding' do |sp|
   		sp.platform             = :ios, '8.0'
   		sp.xcconfig             = { 'OTHER_LDFLAGS' => '$(inherited) -lObjC',
                                    'OTHER_CFLAGS' => '$(inherited) -DNS_BLOCK_ASSERTIONS=1 -DNDEBUG'
                                  }
  		sp.source_files        	= 'PaperOnboarding/**/*.{h,m}'
  		sp.public_header_files 	= 'PaperOnboarding/Headers/*.h'
  		sp.vendored_libraries 	= 'PaperOnboarding/libPaperOnboarding.a'
        sp.resource_bundles     = {'PaperOnboarding' => ['PaperOnboarding/Assets/**/*']}
  		sp.dependency           'pointzi/Lite'
  end
  
end
