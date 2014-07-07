Pod::Spec.new do |s|
  s.name             = "GitHubAPI"
  s.version          = "0.1.0"
  s.summary          = "A client for the GitHub v3 API."
  s.homepage         = "https://github.com/PodBuilder>/GitHubAPI"
  s.license          = 'MIT'
  s.author           = { "William Kent" => "https://github.com/wjk" }
  s.source           = { :git => "https://github.com/PodBuilder/GitHubAPI.git", :tag => s.version.to_s }

  s.dependency 'BoltsTask'
  s.dependency 'Mantle'
  s.dependency 'ISO8601DateFormatter'

  s.source_files = 'Pod/Classes/**/*.{h,m}'
  s.requires_arc = true
end
