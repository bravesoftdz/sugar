﻿<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="4.0" DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
    <Platform Condition=" '$(Platform)' == '' ">AnyCPU</Platform>
    <ProductVersion>10.0.20506</ProductVersion>
    <SchemaVersion>2.0</SchemaVersion>
    <ProjectGuid>{ef1654e8-f2e2-43a2-888a-eb1cb177f75a}</ProjectGuid>
    <ProjectTypeGuids>{89896941-7261-4476-8385-4DA3CE9FDB83};{C089C8C0-30E0-4E22-80C0-CE093F111A43};{656346D9-4656-40DA-A068-22D5425D4639}</ProjectTypeGuids>
    <OutputType>Library</OutputType>
    <AppDesignerFolder>Properties</AppDesignerFolder>
    <RootNamespace>Sugar.Echoes.WP8.Test</RootNamespace>
    <AssemblyName>Sugar.Echoes.WP8.Test</AssemblyName>
    <TargetFrameworkIdentifier>WindowsPhone</TargetFrameworkIdentifier>
    <TargetFrameworkVersion>v8.0</TargetFrameworkVersion>
    <SilverlightVersion>$(TargetFrameworkVersion)</SilverlightVersion>
    <SilverlightApplication>true</SilverlightApplication>
    <SupportedCultures>
    </SupportedCultures>
    <XapOutputs>true</XapOutputs>
    <GenerateSilverlightManifest>true</GenerateSilverlightManifest>
    <XapFilename>Sugar.Echoes.WP8.Test_$(Configuration)_$(Platform).xap</XapFilename>
    <SilverlightManifestTemplate>Properties\AppManifest.xml</SilverlightManifestTemplate>
    <SilverlightAppEntry>Sugar.Echoes.WP8.Test.App</SilverlightAppEntry>
    <ValidateXaml>true</ValidateXaml>
    <MinimumVisualStudioVersion>11.0</MinimumVisualStudioVersion>
    <ThrowErrorsInValidation>true</ThrowErrorsInValidation>
    <Name>Sugar.Echoes.WP8.Test</Name>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Debug|AnyCPU' ">
    <DebugSymbols>true</DebugSymbols>
    <DebugType>full</DebugType>
    <Optimize>false</Optimize>
    <OutputPath>..\..\Bin\Debug\WP8</OutputPath>
    <DefineConstants>DEBUG;TRACE;SILVERLIGHT;WINDOWS_PHONE</DefineConstants>
    <NoStdLib>true</NoStdLib>
    <NoConfig>true</NoConfig>
    <ErrorReport>prompt</ErrorReport>
    <WarningLevel>4</WarningLevel>
    <XmlDocWarningLevel>WarningOnPublicMembers</XmlDocWarningLevel>
    <CpuType>anycpu</CpuType>
    <GeneratePDB>True</GeneratePDB>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Release|AnyCPU' ">
    <DebugType>pdbonly</DebugType>
    <Optimize>true</Optimize>
    <OutputPath>..\..\Bin\Release\WP8</OutputPath>
    <DefineConstants>TRACE;SILVERLIGHT;WINDOWS_PHONE</DefineConstants>
    <NoStdLib>true</NoStdLib>
    <NoConfig>true</NoConfig>
    <ErrorReport>prompt</ErrorReport>
    <WarningLevel>4</WarningLevel>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Debug|x86' ">
    <DebugSymbols>true</DebugSymbols>
    <DebugType>full</DebugType>
    <Optimize>False</Optimize>
    <OutputPath>..\..\Bin\x86\Debug\WP8</OutputPath>
    <DefineConstants>DEBUG;TRACE;SILVERLIGHT;WINDOWS_PHONE</DefineConstants>
    <NoStdLib>true</NoStdLib>
    <NoConfig>true</NoConfig>
    <ErrorReport>prompt</ErrorReport>
    <WarningLevel>4</WarningLevel>
    <XmlDocWarningLevel>WarningOnPublicMembers</XmlDocWarningLevel>
    <CpuType>anycpu</CpuType>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>True</GenerateMDB>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Release|x86' ">
    <DebugType>pdbonly</DebugType>
    <Optimize>true</Optimize>
    <OutputPath>..\..\Bin\x86\Release\WP8</OutputPath>
    <DefineConstants>TRACE;SILVERLIGHT;WINDOWS_PHONE</DefineConstants>
    <NoStdLib>true</NoStdLib>
    <NoConfig>true</NoConfig>
    <ErrorReport>prompt</ErrorReport>
    <WarningLevel>4</WarningLevel>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Debug|ARM' ">
    <DebugSymbols>true</DebugSymbols>
    <DebugType>full</DebugType>
    <Optimize>false</Optimize>
    <OutputPath>..\..\Bin\ARM\Debug\WP8</OutputPath>
    <DefineConstants>DEBUG;TRACE;SILVERLIGHT;WINDOWS_PHONE</DefineConstants>
    <NoStdLib>true</NoStdLib>
    <NoConfig>true</NoConfig>
    <ErrorReport>prompt</ErrorReport>
    <WarningLevel>4</WarningLevel>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Release|ARM' ">
    <DebugType>pdbonly</DebugType>
    <Optimize>true</Optimize>
    <OutputPath>..\..\Bin\ARM\Release\WP8</OutputPath>
    <DefineConstants>TRACE;SILVERLIGHT;WINDOWS_PHONE</DefineConstants>
    <NoStdLib>true</NoStdLib>
    <NoConfig>true</NoConfig>
    <ErrorReport>prompt</ErrorReport>
    <WarningLevel>4</WarningLevel>
  </PropertyGroup>
  <ItemGroup>
    <Compile Include="App.xaml.pas">
      <DependentUpon>App.xaml</DependentUpon>
    </Compile>
    <Compile Include="LocalizedStrings.pas" />
    <Compile Include="MainPage.xaml.pas">
      <DependentUpon>MainPage.xaml</DependentUpon>
    </Compile>
    <Compile Include="Properties\AssemblyInfo.pas" />
    <Compile Include="Resources\AppResources.Designer.pas">
      <DependentUpon>Resources\AppResources.resx</DependentUpon>
    </Compile>
    <Compile Include="..\..\Printer\Printer.pas" />
    <Compile Include="..\..\Tests\AutoreleasePool.pas" />
    <Compile Include="..\..\Tests\Binary.pas" />
    <Compile Include="..\..\Tests\Convert.pas" />
    <Compile Include="..\..\Tests\DateTime.pas" />
    <Compile Include="..\..\Tests\Dictionary.pas" />
    <Compile Include="..\..\Tests\Extensions.pas" />
    <Compile Include="..\..\Tests\FileHandle.pas" />
    <Compile Include="..\..\Tests\Folder.pas" />
    <Compile Include="..\..\Tests\File.pas" />
    <Compile Include="..\..\Tests\Guid.pas" />
    <Compile Include="..\..\Tests\HashSet.pas" />
    <Compile Include="..\..\Tests\HTTP.pas" />
    <Compile Include="..\..\Tests\List.pas" />
    <Compile Include="..\..\Tests\Queue.pas" />
    <Compile Include="..\..\Tests\Random.pas" />
    <Compile Include="..\..\Tests\Stack.pas" />
    <Compile Include="..\..\Tests\String.pas" />
    <Compile Include="..\..\Tests\StringBuilder.pas" />
    <Compile Include="..\..\Tests\Url.pas" />
    <Compile Include="..\..\Tests\UserSettings.pas" />
    <Compile Include="..\..\Tests\Math.pas" />
    <Compile Include="..\..\Tests\Xml\CharacterData.pas" />
    <Compile Include="..\..\Tests\Xml\Document.pas" />
    <Compile Include="..\..\Tests\Xml\DocumentType.pas" />
    <Compile Include="..\..\Tests\Xml\Element.pas" />
    <Compile Include="..\..\Tests\Xml\Node.pas" />
    <Compile Include="..\..\Tests\Xml\ProcessingInstruction.pas" />
    <Compile Include="..\..\Tests\Xml\TestData.pas" />
  </ItemGroup>
  <ItemGroup>
    <ApplicationDefinition Include="App.xaml">
      <SubType>Designer</SubType>
      <Generator>MSBuild:Compile</Generator>
    </ApplicationDefinition>
    <Page Include="MainPage.xaml">
      <SubType>Designer</SubType>
      <Generator>MSBuild:Compile</Generator>
    </Page>
  </ItemGroup>
  <ItemGroup>
    <None Include="Properties\AppManifest.xml" />
    <None Include="Properties\WMAppManifest.xml">
      <SubType>Designer</SubType>
    </None>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Assets\AlignmentGrid.png" />
    <Content Include="Assets\ApplicationIcon.png">
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    </Content>
    <Content Include="Assets\Tiles\FlipCycleTileLarge.png">
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    </Content>
    <Content Include="Assets\Tiles\FlipCycleTileMedium.png">
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    </Content>
    <Content Include="Assets\Tiles\FlipCycleTileSmall.png">
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    </Content>
    <Content Include="Assets\Tiles\IconicTileMediumLarge.png">
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    </Content>
    <Content Include="Assets\Tiles\IconicTileSmall.png">
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <EmbeddedResource Include="Resources\AppResources.resx">
      <Generator>PublicResXFileCodeGenerator</Generator>
    </EmbeddedResource>
  </ItemGroup>
  <ItemGroup>
    <Folder Include="Assets\" />
    <Folder Include="Assets\Tiles\" />
    <Folder Include="Properties\" />
    <Folder Include="Resources\" />
    <Folder Include="..\..\Printer\" />
    <Folder Include="..\..\Tests\" />
    <Folder Include="..\..\Tests\Xml\" />
  </ItemGroup>
  <ItemGroup>
    <ProjectReference Include="..\..\..\Sugar.TestFramework\Sugar.Echoes.WP8.TestFramework.oxygene">
      <Name>Sugar.Echoes.WP8.TestFramework</Name>
      <Project>{23f34f6e-c862-4f52-8c06-a63caff070a7}</Project>
      <Private>True</Private>
      <HintPath>..\..\..\Sugar.TestFramework\Bin\x86\Debug\WP8\Sugar.TestFramework.dll</HintPath>
    </ProjectReference>
    <ProjectReference Include="..\..\..\Sugar\Sugar.Echoes.WP8.oxygene">
      <Name>Sugar.Echoes.WP8</Name>
      <Project>{bd5d51e2-b11a-4356-9450-64566f8cdc38}</Project>
      <Private>True</Private>
      <HintPath>..\..\..\Sugar\bin\Debug\WP8\Sugar.dll</HintPath>
    </ProjectReference>
  </ItemGroup>
  <!-- To modify your build process, add your task inside one of the targets below and uncomment it.
       Other similar extension points exist, see Microsoft.Common.targets.
  <Target Name="BeforeBuild">
  </Target>
  <Target Name="AfterBuild">
  </Target>
  -->
  <ProjectExtensions>
    <VisualStudio>
      <FlavorProperties Guid="{c089c8c0-30e0-4e22-80c0-ce093f111a43}" User="">
        <SilverlightMobileCSProjectFlavor>
          <FullDeploy>False</FullDeploy>
          <DebuggerType>Managed</DebuggerType>
          <DebuggerAgentType>Managed</DebuggerAgentType>
          <Tombstone>False</Tombstone>
        </SilverlightMobileCSProjectFlavor>
      </FlavorProperties>
    </VisualStudio>
  </ProjectExtensions>
  <Import Project="$(MSBuildExtensionsPath)\Microsoft\$(TargetFrameworkIdentifier)\$(TargetFrameworkVersion)\Microsoft.$(TargetFrameworkIdentifier).$(TargetFrameworkVersion).Overrides.targets" />
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\$(TargetFrameworkIdentifier)\$(TargetFrameworkVersion)\RemObjects.Oxygene.Echoes.$(TargetFrameworkIdentifier).targets" />
  <PropertyGroup>
    <PreBuildEvent />
  </PropertyGroup>
</Project>