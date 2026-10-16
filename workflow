name: RaceDay Part 2 API CI
on:
  push:
  pull_request:
jobs:
  build-and-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Install .NET 8
        uses: actions/setup-dotnet@v4
        with:
          dotnet-version: 8.0.x
      - name: Restore
        run: dotnet restore RaceDay.Tests/RaceDay.Tests.csproj
      - name: Build API
        run: dotnet build RaceDay.Api/RaceDay.Api.csproj --configuration Release --no-restore
      - name: Run unit tests
        run: dotnet test RaceDay.Tests/RaceDay.Tests.csproj --configuration Release --verbosity normal
