FROM microsoft/dotnet:1.1-sdk

COPY /src /build/src

WORKDIR /build/src
RUN dotnet restore
RUN dotnet publish --configuration Release --output /build/out

WORKDIR /docker
ENTRYPOINT ["dotnet", "/build/out/OpcPublisher.dll"]
