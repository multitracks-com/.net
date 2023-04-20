## Welcome!

So you want to work for MultiTracks.com? This is a step in the right direction!


This repo contains a Class Library and a Web Forms Website project. As a member of the DotNET server team at MultiTracks.com you will most likely find yourself in similar projects on a regular basis. We have a number of projects also utilizing DotNetCore and all new projects in DotNet 7.


To get started:

- Clone the repo locally	
- Open the solution in Visual Studio	
- Run "Update-Package Microsoft.CodeDom.Providers.DotNetCompilerPlatform -r" from the Package Manager Console	
- Finally run the project for further instructions


## Development of the test - Alan Sierra
During the development of the test, the following tasks were carried out:

### Creation of Stored Procedure and synchronization of view
A Stored Procedure was created for the query of artist details and the corresponding view was synchronized to efficiently obtain the required information.

### Creation of view all artists
A view was created to display all artists and allow access to the artist details view by selecting one.

### Creation of API project with Entity Framework and NET 7
An API project was developed using Entity Framework and NET 7 to implement the 3 endpoints required in the test. 

### Creation of API project with Dapper and NET 7
A second API project was also created using Dapper and NET 7 to implement the same 3 endpoints required in the test. The Dapper library was used to efficiently access the database.

 **Note** : To create the database with the stored procedures, relationships, and new table, run the script "MT Assessment Create DB.sql" located in the "Create DB Assessment" folder. This script will set up the necessary database components for the test development. Make sure to review the script and modify any parameters as needed before running it on your database instance.
