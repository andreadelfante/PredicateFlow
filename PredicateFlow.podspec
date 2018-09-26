Pod::Spec.new do |pf|
  pf.name             = 'PredicateFlow'
  pf.version          = '1.1.1'
  pf.summary          = 'Flowable NSPredicate. Written in Swift.'

  pf.description      = <<-DESC
			            PredicateFlow is a builder that allows you to write amazing, strong-typed and easy-to-read NSPredicate.
                       DESC

  pf.homepage         = 'https://github.com/andreadelfante/PredicateFlow'
  pf.license          = { :type => 'MIT', :file => 'LICENSE' }
  pf.author           = { 'andreadelfante' => 'andreadelfante94@gmail.com' }
  pf.requires_arc     = true
  pf.source           = { :git => 'https://github.com/andreadelfante/PredicateFlow.git', :tag => pf.version.to_s }

  pf.swift_version = '4.2'

  pf.ios.deployment_target = '8.0'
  pf.osx.deployment_target = '10.9'
  pf.tvos.deployment_target = '9.0'
  pf.watchos.deployment_target = '2.0'

  pf.default_subspec = 'Basic'  

  pf.dependency 'Sourcery', '~> 0.15.0'

  pf.subspec 'Basic' do |basic|
    basic.source_files = 'PredicateFlow/Classes/**/*'
    basic.preserve_paths = [ 'PredicateFlow/Templates', 'PredicateFlow/Classes/Utils' ]
  end

  pf.subspec 'Realm' do |realm|
    realm.source_files = [ 'PredicateFlow/Classes/**/*', 'PredicateFlow-Realm/Classes/**/*' ]
    
    realm.dependency 'RealmSwift'
  end
end
