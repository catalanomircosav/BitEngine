project "Engine"
    kind "StaticLib"
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
        "../Vendor/include"
    }

    libdirs { "../Vendor/libs" }

    links {
        -- "opengl32.lib",
        -- "glfw3.lib"
    }

    filter "system:windows"
        systemversion "latest"