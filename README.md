# St10480926_Sombonga-Mjongile_RaceDay-POE-PART-RCNMB-Campus

# RaceDay — Part 2 RESTful API

This project is a starter implementation for PROG6212 Programming 2B PoE Part 2. It uses ASP.NET Core Web API, Entity Framework Core, SQL Server, session-based authentication, role checks, Swagger, unit tests and GitHub Actions.

## Roles
- **Organiser:** manage only events they created, categories for those events, view event enrolments, and record results.
- **Participant:** view events/categories, enrol in events, view their own enrolments/results, and manage their own profile.

## Requirements
- .NET 8 SDK
- SQL Server or SQL Server LocalDB
- Visual Studio 2022 or another .NET-capable IDE

## Configure and run
1. Open `RaceDay.sln` in Visual Studio.
2. Check `RaceDay.Api/appsettings.json` and change the `ConnectionStrings:RaceDay` value to your SQL Server instance.
3. In a terminal from the repository root, run:
   ```bash
   dotnet restore RaceDay.sln
   dotnet build RaceDay.sln
   dotnet run --project RaceDay.Api
   ```
4. In Development, open `/swagger` on the local URL printed by the application.
5. The project uses EF Core Code First. Install EF tools if needed (`dotnet tool install --global dotnet-ef`), then run:
   ```bash
   dotnet ef migrations add InitialCreate --project RaceDay.Api
   dotnet ef database update --project RaceDay.Api
   ```
   Run these commands from the repository root. Do not run migrations against a database you need to preserve without backing it up first.

## Session authentication
Register using `POST /api/auth/register` with `fullName`, `email`, `password` (minimum 8 characters) and `role` (`Organiser` or `Participant`). Log in through `POST /api/auth/login`. The API uses an HTTP-only session cookie; retain/send that cookie for subsequent requests. Use `POST /api/auth/logout` to clear the session. Passwords are stored as hashes, not plain text.

## Main endpoint groups
- `POST /api/auth/register`, `POST /api/auth/login`, `POST /api/auth/logout`, `GET /api/auth/session`
- `GET /api/profile`, `PUT /api/profile`
- `GET /api/events`, `GET /api/events/{id}`, `POST /api/events`, `PUT /api/events/{id}`, `DELETE /api/events/{id}`
- `GET /api/categories`, `POST /api/categories/events/{eventId}`, `PUT /api/categories/{id}`, `DELETE /api/categories/{id}`
- `POST /api/enrolments`, `GET /api/enrolments/mine`, `GET /api/enrolments/events/{eventId}`
- `POST /api/results/enrolments/{enrolmentId}`, `GET /api/results/mine`

## Tests and CI
Run tests using `dotnet test RaceDay.Tests/RaceDay.Tests.csproj`. GitHub Actions in `.github/workflows/part2-ci.yml` restores, builds and tests on each push and pull request. After pushing the project, open **Actions**, wait for a green run, and add your own screenshot to this README before submitting.

## Important checks before submission
- Compare entity names, properties and keys against your actual Part 1 ERD and `docs/RaceDay_Database.sql`; keep the schema consistent. This starter uses the six-table design `Users`, `EventTypes`, `Events`, `Categories`, `Enrolments`, `Results` remembered from the Part 1 planning.
- Run the app and every test locally. This workspace did not have the .NET SDK installed, so the code could not be compiled here.
- Add your actual GitHub repository link, green CI screenshot and unlisted video link.
- Make at least 20 genuine, meaningful commits from your own account. Do not create fake commits merely to meet the count.
- Your brief requires disclosure of AI assistance in a footnote/comments section. Follow your institution's rules and ensure you understand, test and adapt the code yourself.

## AI assistance disclosure example
“AI tools were used to assist with planning, code drafting and proofreading. I reviewed and tested the implementation and am responsible for the final submitted work.”
