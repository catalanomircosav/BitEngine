workspace "BitEngine"
    configurations { "Debug", "Release" }
    platforms { "x64" }
    startproject "Game"

    filter "configurations:Debug"
        defines { "Debug" }
        symbols "on"
        runtime "Debug"
    
    filter "configurations:Release"
        defines { "Release" }
        symbols "on"
        runtime "Release"
    
    filter { "platforms:x64" }
        architecture "x64"

include "Engine"
include "Game"