# Étape 1 : Build avec SDK .NET
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copier les fichiers de solution et projet
COPY CESIZen.sln ./
COPY CESIZen/CESIZen.csproj CESIZen/

# Restauration des dépendances
RUN dotnet restore CESIZen/CESIZen.csproj

# Copier tout le contenu
COPY . .

# Build et publish en Release
WORKDIR /src/CESIZen
RUN dotnet publish -c Release -o /app/publish

# Étape 2 : Runtime (image plus légère)
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

# Copier les fichiers publiés depuis l'étape build
COPY --from=build /app/publish .

# Exposer le port (si nécessaire)
EXPOSE 80
EXPOSE 443

# Lancer l'application
ENTRYPOINT ["dotnet", "CESIZen.dll"]
