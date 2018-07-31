#!/bin/sh
set -ex

# Download and extract Nuget Packages

cd packages
nuget install
cd -

# Copy Assemblies and Native libraries from Nugets

# versions need to match with packages/packages.config
PROTOBUF_PKG=Google.Protobuf.3.6.0
GRPC_CORE_PKG=Grpc.Core.1.15.0-dev
INTERACTIVE_ASYNC_PKG=System.Interactive.Async.3.1.1

cp packages/${PROTOBUF_PKG}/lib/net45/Google.Protobuf.dll                         Plugins/Google.Protobuf/lib/net45/Google.Protobuf.dll
cp packages/${PROTOBUF_PKG}/lib/net45/Google.Protobuf.xml                         Plugins/Google.Protobuf/lib/net45/Google.Protobuf.xml
cp packages/${GRPC_CORE_PKG}/lib/net45/Grpc.Core.dll                              Plugins/Grpc.Core/lib/net45/Grpc.Core.dll
cp packages/${GRPC_CORE_PKG}/lib/net45/Grpc.Core.pdb                              Plugins/Grpc.Core/lib/net45/Grpc.Core.pdb
cp packages/${GRPC_CORE_PKG}/lib/net45/Grpc.Core.xml                              Plugins/Grpc.Core/lib/net45/Grpc.Core.xml
cp packages/${GRPC_CORE_PKG}/runtimes/linux/native/libgrpc_csharp_ext.x86.so      Plugins/Grpc.Core/runtimes/linux/x86/libgrpc_csharp_ext.so
cp packages/${GRPC_CORE_PKG}/runtimes/linux/native/libgrpc_csharp_ext.x64.so      Plugins/Grpc.Core/runtimes/linux/x64/libgrpc_csharp_ext.so
cp packages/${GRPC_CORE_PKG}/runtimes/osx/native/libgrpc_csharp_ext.x86.dylib     Plugins/Grpc.Core/runtimes/osx/x86/grpc_csharp_ext.bundle
cp packages/${GRPC_CORE_PKG}/runtimes/osx/native/libgrpc_csharp_ext.x64.dylib     Plugins/Grpc.Core/runtimes/osx/x64/grpc_csharp_ext.bundle
cp packages/${GRPC_CORE_PKG}/runtimes/win/native/grpc_csharp_ext.x86.dll          Plugins/Grpc.Core/runtimes/win/x86/grpc_csharp_ext.dll
cp packages/${GRPC_CORE_PKG}/runtimes/win/native/grpc_csharp_ext.x64.dll          Plugins/Grpc.Core/runtimes/win/x64/grpc_csharp_ext.dll
cp packages/${INTERACTIVE_ASYNC_PKG}/lib/net45/System.Interactive.Async.dll       Plugins/System.Interactive.Async/lib/net45/System.Interactive.Async.dll
cp packages/${INTERACTIVE_ASYNC_PKG}/lib/net45/System.Interactive.Async.xml       Plugins/System.Interactive.Async/lib/net45/System.Interactive.Async.xml

# add Android and iOS native libraries
cp packages/${GRPC_CORE_PKG}/runtimes/monoandroid/armeabi-v7a/libgrpc_csharp_ext.so  Plugins/Grpc.Core/runtimes/android/armeabi-v7a/libgrpc_csharp_ext.so
cp packages/${GRPC_CORE_PKG}/runtimes/monoandroid/arm64-v8a/libgrpc_csharp_ext.so    Plugins/Grpc.Core/runtimes/android/arm64-v8a/libgrpc_csharp_ext.so
cp packages/${GRPC_CORE_PKG}/runtimes/monoandroid/x86/libgrpc_csharp_ext.so          Plugins/Grpc.Core/runtimes/android/x86/libgrpc_csharp_ext.so
cp packages/${GRPC_CORE_PKG}/runtimes/ios/native/libgrpc_csharp_ext.a                Plugins/Grpc.Core/runtimes/ios/libgrpc_csharp_ext.a
cp packages/${GRPC_CORE_PKG}/runtimes/ios/native/libgrpc.a                           Plugins/Grpc.Core/runtimes/ios/libgrpc.a

# TODO: add Grpc.Auth package..
# TODO: add Grpc.Tools package...

# TODO: add file with package versions...


# Zipping

zip -r grpc-unity-package.zip Plugins
