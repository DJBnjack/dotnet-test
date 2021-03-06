FROM microsoft/dotnet:1.0.3-sdk-projectjson

RUN mkdir dotnetapp
WORKDIR dotnetapp

# copy project.json and restore as distinct layers
COPY project.json .
RUN dotnet restore

# copy and build everything else
COPY . .
RUN dotnet publish -c Release -o out

#ENTRYPOINT ["dotnet", "run"]
ENTRYPOINT ["dotnet", "out/dotnetapp.dll"]