Pod::Spec.new do |s|
  s.name             = 'PredicateFlow'
  s.version          = '0.1.1'
  s.summary          = 'Flowable NSPredicate. Written in Swift.'

  s.description      = <<-DESC
			            PredicateFlow is a builder that allows you to write amazing, strong-typed and easy-to-read NSPredicate.
                       DESC

  s.homepage         = 'https://github.com/andreadelfante/PredicateFlow'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'andreadelfante' => 'andreadelfante94@gmail.com' }
  s.requires_arc     = true
  s.source           = { :git => 'https://github.com/andreadelfante/PredicateFlow.git', :tag => s.version.to_s }

  s.swift_version = '4.0'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = 'PredicateFlow/Classes/**/*'
  s.preserve_paths = [ 'PredicateFlow/Templates', 'PredicateFlow/Classes/Utils' ]
  
  s.dependency 'Sourcery', '~> 0.10.1'
end
