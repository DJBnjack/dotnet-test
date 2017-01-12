FROM microsoft/dotnet

RUN mkdir dotnetapp
WORKDIR dotnetapp

# copy project.json and restore as distinct layers
COPY project.json dotnetapp
RUN dotnet restore

# copy and build everything else
COPY . dotnetapp
ENTRYPOINT ["dotnet", "run"]