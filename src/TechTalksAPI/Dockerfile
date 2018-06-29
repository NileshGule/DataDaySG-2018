#FROM microsoft/aspnetcore-build AS build-env
FROM microsoft/dotnet:2.1.300-sdk  AS build-env

WORKDIR /TechTalksAPI

COPY TechTalksAPI /TechTalksAPI/

COPY NuGet.config ./

COPY . ./

RUN dotnet restore

RUN dotnet publish --configuration Release --output releaseOutput --no-restore

#build runtime image
FROM microsoft/dotnet:2.1.0-aspnetcore-runtime

WORKDIR /TechTalksAPI

COPY --from=build-env /TechTalksAPI/releaseOutput ./

ENTRYPOINT ["dotnet", "TechTalksAPI.dll"]
