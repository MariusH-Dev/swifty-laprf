Pod::Spec.new do |spec|

    spec.name                   = 'IRCSwiftyLapRF'
    spec.version                = '0.2'
    spec.summary                = 'ImmersionRC LapRF Comm Library'

    spec.homepage               = 'https://github.com/MariusH-Dev/swifty-laprf'
    spec.license                = { :type => 'MIT', :file => 'LICENSE' }
    spec.author                 = { 'netizen01' => 'n01@invco.de' }

    spec.ios.deployment_target  = '15.0'
    spec.tvos.deployment_target = '11.2'
    spec.osx.deployment_target  = '10.13'

    spec.source                 = { :git => 'https://github.com/MariusH-Dev/swifty-laprf.git',
                                    :tag => spec.version.to_s }

    spec.default_subspec        = 'Core'
    spec.swift_version          = '6.0'

    spec.subspec 'Core' do |core|
        core.source_files       = 'Sources/IRCSwiftyLapRFCore/**/*.swift'
        core.dependency         'Signals'
    end

    spec.subspec 'Bluetooth' do |bluetooth|
        bluetooth.source_files  = 'Sources/IRCSwiftyLapRFBluetooth/**/*.swift'
        bluetooth.dependency    'IRCSwiftyLapRF/Core'
        bluetooth.dependency    'SwiftySensors'
    end

    spec.subspec 'SerialUSB' do |serialUSB|
        serialUSB.source_files  = 'Sources/IRCSwiftyLapRFSerialUSB/**/*.swift'
        serialUSB.dependency    'IRCSwiftyLapRF/Core'
        serialUSB.dependency    'ORSSerialPort'
    end

    spec.subspec 'Ethernet' do |ethernet|
        ethernet.source_files   = 'Sources/IRCSwiftyLapRFEthernet/**/*.swift'
        ethernet.dependency     'IRCSwiftyLapRF/Core'
        ethernet.dependency     'CocoaAsyncSocket'
    end
end
