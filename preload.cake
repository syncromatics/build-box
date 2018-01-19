#addin "Cake.Docker"
#addin "Cake.FileHelpers"
#addin "Cake.Testing"
#addin nuget:?package=Cake.Compression
#addin nuget:?package=Cake.Git
#addin nuget:?package=SharpZipLib

#tool "nuget:?package=xunit.runner.console"
#tool nuget:?package=GitVersion.CommandLine&version=4.0.0-beta0012

Task("Preload")
    .Does(() => 
    {
        Information("Pre-loaded common Cake addins and tools");
    });

RunTarget("Preload");
