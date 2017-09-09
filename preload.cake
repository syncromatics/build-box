#addin "Cake.Docker"
#addin "Cake.FileHelpers"
#addin "Cake.Testing"
#addin nuget:?package=Cake.Compression
#addin nuget:?package=Cake.Git
#addin nuget:?package=SharpZipLib
#tool "nuget:?package=xunit.runner.console"

Task("Preload")
    .Does(() => 
    {
        Information("Pre-loaded common Cake addins and tools");
    });

RunTarget("Preload");