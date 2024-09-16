# 使用官方的 .NET SDK 作為建構環境
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /app

# 複製 .csproj 並還原相依項目
COPY DbAdm/*.csproj ./DbAdm/
COPY Base/*.csproj ./Base/
RUN dotnet restore DbAdm/DbAdm.csproj

# 複製專案文件並進行建構
COPY . ./
RUN dotnet publish DbAdm/DbAdm.csproj -c Release -o out

# 建立運行時期映像檔
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build-env /app/out .

# 指定運行的指令
ENTRYPOINT ["dotnet", "DbAdm.dll"]
