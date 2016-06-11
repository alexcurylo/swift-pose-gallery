#
# Be sure to run `pod lib lint ScreamingParty.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ScreamingParty'
  s.version          = '0.0.1-alpha.1'
  s.summary          = 'Swift utilities collection.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Collects MIT-licensable snippets, gists, small packages and so forth into a single stably versioned package.
“The screaming helps the birds bond as a screaming party...”
                         DESC

  s.homepage         = 'https://github.com/alexcurylo/ScreamingParty'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alex Curylo' => 'alex@trollwerks.com' }
  s.source           = { :git => 'https://github.com/alexcurylo/ScreamingParty.git',
                         :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/trollwerks'

  s.ios.deployment_target = '9.3'

  s.source_files     = 'ScreamingParty/ScreamingParty/Classes/**/*'

  # s.resource_bundles = {
  #   'ScreamingParty' => ['ScreamingParty/ScreamingParty/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
