/*

Queries used for Tableau Project

*/



-- 1. 

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From CovidProject..CovidDeaths
--Where location like '%nepal%'
where continent is not null 
--Group By date
order by 1,2

-- Just a double check based off the data provided
-- numbers are extremely close so we will keep them - The Second includes "International"  Location


--Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
--From CovidProject..CovidDeaths
----Where location like '%nepal%'
--where location = 'World'
----Group By date
--order by 1,2


-- 2. 

-- We take these out as they are not inluded in the above queries and want to stay consistent
-- European Union is part of Europe

Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From CovidProject..CovidDeaths
--Where location like '%nepal%'
Where continent is null 
and location not in ('World', 'European Union', 'International','Upper middle income','Lower middle income','Low income','High income')
Group by location
order by TotalDeathCount desc


-- 3.

Select Location, Population, MAX(CAST(total_cases as int)) as HighestInfectionCount,
Max((CAST(total_cases as int)/population))*100 as PercentPopulationInfected
From CovidProject..CovidDeaths
--Where location like '%nepal%'
Group by Location, Population
order by PercentPopulationInfected desc


-- 4.


Select Location, Population,date, MAX(CAST(total_cases as int)) as HighestInfectionCount,  
Max((CAST(total_cases AS int)/population))*100 as PercentPopulationInfected
From CovidProject..CovidDeaths
--Where location like '%nepal%'
Group by Location, Population, date
order by PercentPopulationInfected desc












