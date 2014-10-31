﻿<?xml version="1.0" encoding="utf-8"?>
<Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="4.0">
  <PropertyGroup>
    <ProductVersion>3.5</ProductVersion>
    <OutputType>StaticLibrary</OutputType>
    <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
    <AllowLegacyCreate>False</AllowLegacyCreate>
    <Name>Sugar.Data.Nougat.OSX</Name>
    <RootNamespace>Sugar</RootNamespace>
    <SDK>OS X</SDK>
    <ProjectGuid>{0d5b253d-762b-42d9-bfd2-3c217e07cf52}</ProjectGuid>
    <AssemblyName>Sugar.Data</AssemblyName>
    <DefaultUses>Foundation</DefaultUses>
    <StartupClass />
    <DeploymentTargetVersion>10.6</DeploymentTargetVersion>
    <AllowLegacyOutParams>False</AllowLegacyOutParams>
    <CreateHeaderFile>False</CreateHeaderFile>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
    <Optimize>False</Optimize>
    <OutputPath>bin\</OutputPath>
    <DefineConstants>DEBUG;TRACE;OSX</DefineConstants>
    <CaptureConsoleOutput>False</CaptureConsoleOutput>
    <StartMode>Project</StartMode>
    <XmlDoc>False</XmlDoc>
    <XmlDocWarningLevel>WarningOnPublicMembers</XmlDocWarningLevel>
    <EnableUnmanagedDebugging>False</EnableUnmanagedDebugging>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Release' ">
    <Optimize>True</Optimize>
    <OutputPath>.\bin</OutputPath>
    <GenerateDebugInfo>True</GenerateDebugInfo>
    <EnableAsserts>False</EnableAsserts>
    <DefineConstants>OSX</DefineConstants>
    <CaptureConsoleOutput>False</CaptureConsoleOutput>
    <StartMode>Project</StartMode>
    <XmlDoc>False</XmlDoc>
    <XmlDocWarningLevel>WarningOnPublicMembers</XmlDocWarningLevel>
    <EnableUnmanagedDebugging>False</EnableUnmanagedDebugging>
  </PropertyGroup>
  <ItemGroup>
    <Reference Include="AppKit.fx" />
    <Reference Include="CoreServices.fx" />
    <Reference Include="Foundation.fx" />
    <Reference Include="libNougat.fx" />
    <Reference Include="libxml2.fx" />
    <Reference Include="rtl.fx" />
  </ItemGroup>
  <ItemGroup>
    <Compile Include="JSON\JsonConsts.pas" />
    <Compile Include="JSON\JsonDeserializer.pas" />
    <Compile Include="JSON\JsonSerializer.pas" />
    <Compile Include="JSON\JsonTokenizer.pas" />
    <Compile Include="JSON\JsonTokenKind.pas" />
    <Compile Include="JSON\Objects\JsonArray.pas" />
    <Compile Include="JSON\Objects\JsonObject.pas" />
    <Compile Include="JSON\Objects\JsonValue.pas" />
  </ItemGroup>
  <ItemGroup>
    <Folder Include="JSON" />
    <Folder Include="JSON\Objects" />
    <Folder Include="Properties\" />
  </ItemGroup>
  <ItemGroup>
    <ProjectReference Include="..\Sugar\Sugar.Nougat.OSX.oxygene">
      <Name>Sugar.Nougat.OSX</Name>
      <Project>{ab7ab88b-2370-43bf-844b-54d015da9e57}</Project>
      <Private>True</Private>
      <HintPath>..\Sugar\bin\OS X\libSugar.fx</HintPath>
    </ProjectReference>
  </ItemGroup>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Nougat.targets" />
  <PropertyGroup>
    <PreBuildEvent>
    </PreBuildEvent>
  </PropertyGroup>
</Project>