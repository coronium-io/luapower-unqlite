P=osx32 C="-arch i386" L="-arch i386 -install_name @rpath/foo.dylib" \
	D=libfoo.dylib A=libfoo.a ./build.sh
