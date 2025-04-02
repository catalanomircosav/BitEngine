project "Game"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++23"

    targetdir "bin/%{cfg.buildcfg}"
    objdir "bin/obj/%{cfg.buildcfg}"

    files {
        "include/**.h",
        "src/**.cpp"
    }

    includedirs {
        "include",
        "../Engine/include",
        "../Vendor/include"
    }

    libdirs {
        "Vendor/libs",
        "bin/%{cfg.buildcfg}"
    }

    links {
        "Engine"
    }

    filter "system:windows"
        systemversion "latest"