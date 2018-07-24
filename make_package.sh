#!/bin/sh
set -ex

# Download and extract Nuget Packages

cd packages
nuget install
cd -

# Copy Assemblies and Native libraries from Nugets

# versions need to match with packages/packages.config
PROTOBUF_PKG=Google.Protobuf.3.6.0
GRPC_CORE_PKG=Grpc.Core.1.13.1
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

# Copy Custom Plugins Files

#cp build.android/libgrpc_csharp_ext.so                Plugins/Grpc.Core/runtimes/android/armv7/libgrpc_csharp_ext.so
#cp build.ios/libaddress_sorting.a                     Plugins/Grpc.Core/runtimes/ios/libaddress_sorting.a
#cp build.ios/third_party/cares/cares/lib/libcares.a   Plugins/Grpc.Core/runtimes/ios/libcares.a
#cp build.ios/third_party/boringssl/crypto/libcrypto.a Plugins/Grpc.Core/runtimes/ios/libcrypto.a
#cp build.ios/libgpr.a                                 Plugins/Grpc.Core/runtimes/ios/libgpr.a
#cp build.ios/libgrpc.a                                Plugins/Grpc.Core/runtimes/ios/libgrpc.a
#cp build.ios/libgrpc_csharp_ext.a                     Plugins/Grpc.Core/runtimes/ios/libgrpc_csharp_ext.a
#cp build.ios/third_party/boringssl/ssl/libssl.a       Plugins/Grpc.Core/runtimes/ios/libssl.a
#cp build.ios/third_party/zlib/libz.a                  Plugins/Grpc.Core/runtimes/ios/libz.a

# Zipping

zip -r grpc-unity-package.zip Plugins
