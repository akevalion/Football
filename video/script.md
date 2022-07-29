
# PRESENTATION

Hello, in this video we will analyze a database that has data of the most important European football leagues.
We will develop analysis tools to understand this database using Pharo programming language and Roassal visualization engine.

# INTRODUCTION

Data analysis is a process that involves inspecting and modeling the data with the objective of discovering useful information and to see patterns that are hidden at first sight. The visualization shows the information presenting it in a visual context making it more natural for humans. With the help of visualizations and inspection techniques, we will see how Pharo and Roassal are powerful technologies for data analysis.

# DATABASE

_At the same time as the text, we will show some of the content of the database and the database diagram_

For this project we will use this database that we obtained from data dot world. They did a great job compiling the data of the most important European football leagues between the years 2008 and 2016. The database is around 300 megabytes in size. It contains seven tables and thousands of rows of data. With the help of Pharo we can model and build analysis tools to analyze and visualize this data.

In this picture you can see the relationships between the tables where Match is the main table. It has the most number of columns and rows in the database.

# DEMO

## Opening the demo

First, we need to start our Pharo image. In this case, we'll use the Pharo Launcher to do it. Then, after installing the project, we need to go to Library and then click on European Leagues demo. This will open the Pharo Inspector with European football leagues.

## Talking about the Pharo Inspector

Tha Pharo Inspector is a tool that allows one to examine an entity, to interact with it and to see it in different presentation forms.

## Inspecting the first object, the European Football League

In the first inspector panel, you can see a list of the available European leagues. In the second pane, we can see the same information but in a different presentation, in this case a map of Europe. You can see that for the countries that we have data we put a flag of the countries. In this map presentation, we see the same information, as we are inspecting the same object, but we can also see the countries for which no data exists.

## Inspecting the Spanigh League

Let's inspect the Spanish League. We see that when we clicked on Spain, we have another inspector page that appears at the right. his new page, has the information of the Spanish League entity.
In the first inspector pane of this new object, we see a list of the available seasons.
In the next one,  we can see a list of all the teams that participated at least once in the Spanish league. There are 33 teams in total in which we can see, for example, Villareal, Real Madrid and so on.

## Inspecting the 2015-2016 season of the Spanish league

Now let's see the data of the season 2015 2016.
As a first thing, we can see a list of all the matches that were played on that season, this list is sorted by the date of the match.
We can search on that list for the matches of the Real Madrid and Barcelona.
The result are the two matches that took place in this season.

In the next inspector pane, we have a table with the points and some statistics of the season. The teams colored in green are classified for an European competition as the Champions League.
The last teams colored in read are the ones that will drop in category. Also, we can see the number of matches won by each team, the goals on favor and other statistics that can be calculated from the matches.

The third pane shows us a line graph.
This graph show the development of the points of each of the team in a season. As you may know, in one season, if a team wins a match it gets 3 points, if it ties 1 points and 0 if the team loses.
Here, the graph shows that Barcelona was the champion of the league for this season. But there was a really tight battle with the second one: Real Madrid and with the third one: Atletico Madrid.

A pop up appears when one moves the mouse over the graph. This pop up shows the state of the points of each of the teams at a particular time of the season.

If we click on the team Barcelona to inspect it, we see a Radar visualization with the statistics of performance of the team.
When we click on the button "Play Evolution", an animation will start playing with the evolution of the stats in the time.

In the next pane, there is a table that shows the results and stats, like the points obtained, for all the available seasons, of Barcelona.

And in the last pane for this object, there is a list that shows all the matches of Barcelona for this particular season.

## Inspecting one match of the season

Let's go back to the matches list. Now, we want to examine this match in which Barcelona won 4 0 to Real Madrid.
We see in the inspector the raw data of the match. We can see that a match has a lot of variables. For example, the players, the position in the field of each player: if they are goalkeepers, strikers, the date of the match, goals that were scored, etc.

### Adding the match field visualization

Understanding this information in the raw form is difficult as it's not natural for humans. That's why we built a custom visualization to show this same data.

To show it, we have to open the Match class and modify this method that adds this new visualization in the inspector.

Now, if we inspect the other Bercelona match, you can see that a nice visualization now is shown along with the raw data. The raw data still exists and it's still available. But we have the option to also see it in a different presentation.

### Inspecting a Player

Now let's inspect a player. Let's start with Lionel Messi. We see the statistics of the player and the evolution of the stats over the time, the radar graph as same as the one for the teams. Now let's inspect other striker: Cristiano Ronaldo. The radar graph has a similar shape as the one of Messi because both of them play in similar positions.

By other hand, if we see the stats of a goalkeeper, as Claudio Bravo, we can see that the shape of a goalkeeper is different from the strikers. Let's select the other goalkeeper, Keylor Navas, to compare. We can also see that the two graphs of the goalkeepers are similar.

If we check for the defenders, like Mascherano and Pepe, they also have a similar shape between them.

# CONCLUSIONS

- Pharo allows to create custom tools to understand data by placing it in a visual context.
- Pharo provides navigation tools to talk lively with the data.
- Using Pharo we can build analysing tools to present and visualize data in personalized ways.
- The graphical representations allow to spot patterns and trends that are not obviouls to see in the raw data.
