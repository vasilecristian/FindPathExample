@echo off


set externalFolder=%~dp0deps


set folder=premake
set address=file:///E:/Dropbox/SVN_REPOSITORY/tools/premake
if not exist %externalFolder%\%folder% (
	svn co %address% %externalFolder%\%folder%
) else (
	svn up %externalFolder%\%folder%
)


set folder=teckel
set address=https://github.com/vasilecristian/teckel.git/trunk
if not exist %externalFolder%\%folder% (
	svn co %address% %externalFolder%\%folder%
) else (
	svn up %externalFolder%\%folder%
)

set folder=base64
set address=https://github.com/vasilecristian/base64.git/trunk
if not exist %externalFolder%\%folder% (
	svn co %address% %externalFolder%\%folder%
) else (
	svn up %externalFolder%\%folder%
)

set folder=freetype
set address=https://github.com/vasilecristian/freetype.git/trunk
if not exist %externalFolder%\%folder% (
	svn co %address% %externalFolder%\%folder%
) else (
	svn up %externalFolder%\%folder%
)

set folder=bullet2
set address=https://github.com/vasilecristian/bullet2.git/trunk
if not exist %externalFolder%\%folder% (
	svn co %address% %externalFolder%\%folder%
) else (
	svn up %externalFolder%\%folder%
)

set folder=curl
set address=https://github.com/vasilecristian/curl.git/trunk
if not exist %externalFolder%\%folder% (
	svn co %address% %externalFolder%\%folder%
) else (
	svn up %externalFolder%\%folder%
)

set folder=glew
set address=https://github.com/vasilecristian/glew.git/trunk
if not exist %externalFolder%\%folder% (
	svn co %address% %externalFolder%\%folder%
) else (
	svn up %externalFolder%\%folder%
)


set folder=openssl
set address=https://github.com/vasilecristian/openssl.git/trunk
if not exist %externalFolder%\%folder% (
	svn co %address% %externalFolder%\%folder%
) else (
	svn up %externalFolder%\%folder%
)


set folder=zlib
set address=https://github.com/vasilecristian/zlib.git/trunk
if not exist %externalFolder%\%folder% (
	svn co %address% %externalFolder%\%folder%
) else (
	svn up %externalFolder%\%folder%
)


set folder=vorbis
set address=https://github.com/vasilecristian/vorbis.git/trunk
if not exist %externalFolder%\%folder% (
	svn co %address% %externalFolder%\%folder%
) else (
	svn up %externalFolder%\%folder%
)


set folder=theora
set address=https://github.com/vasilecristian/theora.git/trunk
if not exist %externalFolder%\%folder% (
	svn co %address% %externalFolder%\%folder%
) else (
	svn up %externalFolder%\%folder%
)


set folder=libpng
set address=https://github.com/vasilecristian/libpng.git/trunk
if not exist %externalFolder%\%folder% (
	svn co %address% %externalFolder%\%folder%
) else (
	svn up %externalFolder%\%folder%
)


set folder=tinyxml2
set address=https://github.com/vasilecristian/tinyxml2.git/trunk
if not exist %externalFolder%\%folder% (
	svn co %address% %externalFolder%\%folder%
) else (
	svn up %externalFolder%\%folder%
)



set folder=openal
set address=https://github.com/vasilecristian/openal.git/trunk
if not exist %externalFolder%\%folder% (
	svn co %address% %externalFolder%\%folder%
) else (
	svn up %externalFolder%\%folder%
)


set folder=ogg
set address=https://github.com/vasilecristian/ogg.git/trunk
if not exist %externalFolder%\%folder% (
	svn co %address% %externalFolder%\%folder%
) else (
	svn up %externalFolder%\%folder%
)


set folder=lua
set address=https://github.com/vasilecristian/lua-5.2.3.git/trunk
if not exist %externalFolder%\%folder% (
	svn co %address% %externalFolder%\%folder%
) else (
	svn up %externalFolder%\%folder%
)


set folder=libjson
set address=https://github.com/vasilecristian/libjson.git/trunk
if not exist %externalFolder%\%folder% (
	svn co %address% %externalFolder%\%folder%
) else (
	svn up %externalFolder%\%folder%
)
