-------------------------------------------------------------------------------
-- FindPathExample
-------------------------------------------------------------------------------
local my_path = path.getabsolute(_SCRIPT_DIR)
local FindPathExample_checkout_folder = my_path .. "/../"
local extern_path = FindPathExample_checkout_folder .. "/deps/"

depends_on = depends_on or {}
-------------------------------------------------------------------------------
-- add all checkout folders for lib dependencies
-------------------------------------------------------------------------------


include (extern_path .. "premake/common/")
-------------------------------------------------------------------------------
-- lib solution
-------------------------------------------------------------------------------
if pre_build then
	pre_build()
end

solution "FindPathExample"
	startproject ("FindPathExample")
	addCommonConfig()

	-------------------------------------------------------------------------------
	-- teckel
	-------------------------------------------------------------------------------
	external "teckel"
		location  (extern_path .. "/teckel/prj/" .. GetPathFromPlatform())
		kind "StaticLib"

	-------------------------------------------------------------------------------
	-- base64
	-------------------------------------------------------------------------------
	external "base64"
		location  (extern_path .. "/base64/premake5_projects/" .. GetPathFromPlatform())
		kind "StaticLib"

	-------------------------------------------------------------------------------
	-- bullet2
	-------------------------------------------------------------------------------
	external "bullet2"
		location  (extern_path .. "/bullet2/premake5_projects/" .. GetPathFromPlatform())
		kind "StaticLib"
		
	-------------------------------------------------------------------------------
	-- curl
	-------------------------------------------------------------------------------
	external "curl"
		location  (extern_path .. "/curl/premake5_projects/" .. GetPathFromPlatform())
		kind "StaticLib"

	-------------------------------------------------------------------------------
	-- freetype
	-------------------------------------------------------------------------------
	external "freetype"
		location  (extern_path .. "/freetype/prj/" .. GetPathFromPlatform())
		kind "StaticLib"

	-------------------------------------------------------------------------------
	-- glew
	-------------------------------------------------------------------------------
	external "glew"
		location  (extern_path .. "/glew/premake5_projects/" .. GetPathFromPlatform())
		kind "StaticLib"

	-------------------------------------------------------------------------------
	-- libjson
	-------------------------------------------------------------------------------
	external "libjson"
		location  (extern_path .. "/libjson/premake5_projects/" .. GetPathFromPlatform())
		kind "StaticLib"

	-------------------------------------------------------------------------------
	-- libpng
	-------------------------------------------------------------------------------
	external "libpng"
		location  (extern_path .. "/libpng/premake5_projects/" .. GetPathFromPlatform())
		kind "StaticLib"
		
	-------------------------------------------------------------------------------
	-- lua
	-------------------------------------------------------------------------------
	external "lua"
		location  (extern_path .. "/lua/premake5_projects/" .. GetPathFromPlatform())
		kind "StaticLib"

	-------------------------------------------------------------------------------
	-- ogg
	-------------------------------------------------------------------------------
	external "ogg"
		location  (extern_path .. "/ogg/premake5_projects/" .. GetPathFromPlatform())
		kind "StaticLib"
		
	-------------------------------------------------------------------------------
	-- openal
	-------------------------------------------------------------------------------
	external "openal"
		location  (extern_path .. "/openal/premake5_projects/" .. GetPathFromPlatform())
		kind "StaticLib"
		
	-------------------------------------------------------------------------------
	-- theora
	-------------------------------------------------------------------------------
	external "theora"
		location  (extern_path .. "/theora/premake5_projects/" .. GetPathFromPlatform())
		kind "StaticLib"

	-------------------------------------------------------------------------------
	-- tinyxml2
	-------------------------------------------------------------------------------
	external "tinyxml2"
		location  (extern_path .. "/tinyxml2/prj/" .. GetPathFromPlatform())
		kind "StaticLib"

	-------------------------------------------------------------------------------
	-- vorbis
	-------------------------------------------------------------------------------
	external "vorbis"
		location  (extern_path .. "/vorbis/premake5_projects/" .. GetPathFromPlatform())
		kind "StaticLib"

	-------------------------------------------------------------------------------
	-- zlib
	-------------------------------------------------------------------------------
	external "zlib"
		location  (extern_path .. "/zlib/premake5_projects/" .. GetPathFromPlatform())
		kind "StaticLib"

	-------------------------------------------------------------------------------
	-- openssl
	-------------------------------------------------------------------------------
	external "openssl"
		location  (extern_path .. "/openssl/premake5_projects/" .. GetPathFromPlatform())
		kind "StaticLib"

	-------------------------------------------------------------------------------
	-- crypto
	-------------------------------------------------------------------------------
	external "crypto"
		location  (extern_path .. "/openssl/premake5_projects/" .. GetPathFromPlatform())
		kind "StaticLib"
		
-------------------------------------------------------------------------------
-- lib project
-------------------------------------------------------------------------------
project "FindPathExample"
	uuid "4491E20C-B0A5-0ABE-7927-AE1DE5FA06E0"
	
	
	kind "WindowedApp"
	
	
	targetname( "FindPathExample" )
	targetdir ( FindPathExample_checkout_folder .. "/build/" .. GetPathFromPlatform())
-------------------------------------------------------------------------------
-- project files
-------------------------------------------------------------------------------	
	files 
	{ 
		FindPathExample_checkout_folder .. "/src/**",	
	}
	
-------------------------------------------------------------------------------
-- include paths
-------------------------------------------------------------------------------		
	includedirs
	{
		FindPathExample_checkout_folder .. "/src",
		
		extern_path .. "/teckel/include",
		extern_path .. "/teckel/deps/include",

		extern_path .. "/bullet2/src",
		extern_path .. "/openal/include",
		extern_path .. "/vorbis/include",	
		extern_path .. "/ogg/include",	
		extern_path .. "/libpng",	
		extern_path .. "/lua/src",	
		extern_path .. "/glew/include",					
	}
	
	defines
	{
		--"GP_USE_GAMEPAD",
		"_WINDOWS",
		
		"AL_LIBTYPE_STATIC",
		"AL_ALEXT_PROTOTYPES",
	}
	
	links
	{
		"teckel",
		"base64",
		"bullet2",
		"curl",
		"freetype",
		"glew",
		"libjson",
		"libpng",
		"lua",
		"ogg",
		"openal",
		"theora",
		"tinyxml2",
		"vorbis",
		"zlib",
	}		
			
    
-------------------------------------------------------------------------------
-- platform specific paths
-------------------------------------------------------------------------------	
	if IsIos() then
		includedirs
		{
		}
		
	end		

	if IsTvos() then
		includedirs
		{
		}
		
	end		
	
	if IsAndroidS2G() then
		includedirs
		{
		}
		
	end
	
	if IsWinPhone80App() or IsWinPhone81App() or IsWin8StoreApp() or IsWin10App() then
		includedirs
		{
		}
		
	end
	
	if IsWin32() then
		includedirs
		{
		}	

		links
		{			
			"OpenGL32.lib",
			"GLU32.lib",
			"XInput.lib",
			"Winmm.lib",
		}
		
		filter { "Debug*" }
			links
			{
				"libcmtd.lib",
		
			}
			libdirs
			{
				extern_path .. "/teckel/deps/lib/windows/x86_64/Debug/",		
				"$(DXSDK_DIR)Lib\x64",
			}
		filter {}	
			
		filter { "Release*" }
			links
			{
				"libcmt.lib",
	
			}
			libdirs
			{
				extern_path .. "/teckel/deps/lib/windows/x86_64/Release/",		
				"$(DXSDK_DIR)Lib\x64"
			}
		filter {}	
		
		
		buildoptions { "/EHsc"}
		
		flags {"WinMain"}
		
		linkoptions
		{
			--"/ENTRY:mainCRTStartup",
		}
		
	end

-------------------------------------------------------------------------------
-- platform specific settings
-------------------------------------------------------------------------------		
	if IsXCode() then
	
		addCommonXcodeBuildSettings()
		
		if (IsIos()) then
           defines {"OS_IPHONE"}       
		elseif (IsTvos()) then
			defines {"OS_APPLETV"}        
		end
	
-------------------------------------------------------------------------------
-- files that need to be compiled as Objective-C++
-------------------------------------------------------------------------------	
	end	

	if IsWin32() then		
		defines {"WIN32"}
	end
	