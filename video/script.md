
# PRESENTATION

In this video we will show how we use and build powerful tools with the Roassal visualization engine to understand data.
We take as example the database of the European football leagues.

# INTRODUCTION Slide 1

Data analysis involves inspecting and modeling the data to discover useful information and to see patterns that are hidden at first sight.
The visualization shows the information presenting it in a visual context making it more natural for humans.
With visualizations and inspection techniques, we will see how Roassal empower the end-user

# DATABASE Slide 2

_At the same time as the text, we will show some of the content of the database and the database diagram_

For this example we use a database from data dot world. 
They did a great job compiling the data of the most important European football leagues between the years 2008 and 2016. 
The database is around 300 megabytes in size. It contains seven tables and thousands of rows of data. 

This picture shows the relationships between the tables of this database. 
Notice that Match is the main table. It has the most number of columns and rows in the database.

Slide 3

The first step of the tool building process is to prepare the data:
we import part of the database in memory and improve the domain model.
We will not present this part. 


Slide 4

The second step is to design new presentations to support the navigation and understanding of data.
For this, we create new presentations (visualizations or tables) and we navigate the data using the extensible inspector and iterate up to the point we have the desired tools.

Let us start looking at the inspector in action.

Slide 5
The extensible inspector is a powerful tool to present, navigate and query complex data


The Pharo Inspector is a tool that allows one to examine data, to interact with it and to display it in different presentation forms.

## Inspecting the first object, the European Football League
This inspector is open on the football data.
This inspector has already enhanced with specific views. 

In the first inspector panel, you can see a list of the available European leagues.
In the second pane, we see the same information but as an interactive map of Europe.
The countries with data have a flag.
With the map we see the same information as before but we identify the countries without data.
Notice that we can always access the raw data. 

## Inspecting the Spanigh League

Let's inspect the Spanish League. 
When we click on Spain, we get another inspector page that appears at the right. 
This new page has the information of the Spanish League entity.
In the first inspector pane, we see a list of the available seasons.
In the next one, we can see a list of all the teams that participated at least once in the Spanish league. There are 33 teams in total in which we can see, for example, Villareal, Real Madrid and so on.


## Inspecting the 2015-2016 season of the Spanish league

Now let's see the data of the season 2015 2016.
As a first thing, we see a list of all the matches that were played on that season, this list is sorted by the date of the match.
Note that the presentations offer special query facilities
For example we get the list of the matches between Real Madrid and Barcelona.
The result are the two matches that took place in this season.


In the next inspector pane, we see a special table with the points and some statistics of the season.
The teams colored in green are the ones that will compete in the Europa and Champions Leagues.
The last teams colored in red are the ones that are relegated.
The table displays the number of matches won by each team, the goals, draws, losses, etc.

The third pane shows us a line graph.
This graph shows the evolution of the points of each of the team.
Here, the graph shows that Barcelona was the champion of the league for this season. 
But there was a really tight battle with the second one: Real Madrid and with the third one: Atletico Madrid.

Visualizations provide on the spot insights.
Here a pop up appears on the graph.
This pop up shows the points of each team at a particular time.

Clicking on Barcelona, we get a dedicated Radar visualization with the statistics of the team performance.

Visualizations are interactive and also animated.
The button "Play Evolution" launches an animation with the evolution of the stats.

In the next pane, there is a table that shows the results and stats, like the points obtained, for all the available seasons, of Barcelona.

And in the last pane, there is a list that shows all the matches of Barcelona for this particular season.

#Slide 6

Up until now, the inspector was loaded with special presentations that we already prepared for the league domain. 
Now we want to show how to add a new one. 

Let's go back to the matches list.
Now, we want to examine this match in which Barcelona won 4 0 to Real Madrid.
As we already say we can always access the raw data of any entity. 
Here we see that a match has a lot of values. For example, the players, the position in the field of each player: if they are goalkeepers, strikers, the date of the match, goals that were scored, etc.

### Adding the match field visualization

Understanding this information in the raw form is actually difficult.
That's why we built a new custom visualization to show this exact same data.

To add it to the inspector, we browse the Match class and modify this method that adds this new visualization in the inspector.

???
The new visualization component is using roassal. 
It defines programmatically how to display field information.
Defining it follows the same process as the other Roassal visualization. 
It can take a couple hours to a couple of days depending on the complexity of the vizualization.
???

Now, if we inspect the other Barcelona match, we get a nice visualization.
 The raw data still exists and it's still available. 
 But we have the option to also see it in a different and more powerful presentation.

### Inspecting a Player

Now let's inspect a player. 
Let's start with Lionel Messi. 
We see the statistics of the player and their evolution over the time.
Now let's inspect other striker: Cristiano Ronaldo.
The radar graph shows a similar shape because both of them play in similar positions.

On the other hand, the stats of a goalkeeper, as Claudio Bravo, are different from the strikers. 
Let's select the other goalkeeper, Keylor Navas, to compare. 
The two graphs of the goalkeepers are similar.

### Script queries for superusers
Our tools are not closed.
We provide super users facilities such as advanced queries.
Let us look at one example....
In this season let's find all the matches where goals are above 5.
Or we can access the same information using the database.

# More projects

Roassal has been used to visualize many data and complex projects such as large software in Java, satelite data, profilers, 3d visualizations, etc.

# CONCLUSIONS

Building customised analysis tools

Roassal let us 
- Create custom tools to visually understand data 
- Define multiple powerful presentations of the same data
- Navigate your complex data model interactively
- Talk and query lively your data
- Reveal hidden patterns and trends with visualizations
